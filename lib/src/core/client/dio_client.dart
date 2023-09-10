// ignore_for_file: body_might_complete_normally_nullable, unused_element

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../constants/constants.dart';
import '../domain/user_shared_preferences.dart';
import 'endpoints.dart';
import 'failure.dart';
import 'interceptors/dio_interceptors.dart';
import 'multipart_file_extended.dart';

enum RequestType { get, post, put, patch, delete, postForm }

class DioClient {
  final String? baseUrl;
  DioClient({this.baseUrl}) {
    _dio = Dio(
      BaseOptions(
        // baseUrl: Endpoints.baseURL,
        baseUrl: baseUrl ?? Endpoints.baseURL,
        connectTimeout: Endpoints.connectionTimeout,
        receiveTimeout: Endpoints.receiveTimeout,
        responseType: ResponseType.json,
      ),
    )..interceptors.addAll([
        DioInterceptors(),
      ]);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: ((options, handler) async {
          final accessToken = await UserSharedPreferences.getAccessToken();
          options.path = options.path;
          options.headers['Authorization'] = 'Bearer $accessToken';
          options.headers['Content-Type'] = 'application/json';
          return handler.next(options);
        }),
        onError: ((DioError e, handler) async {
          if (e.response?.statusCode == 401) {
            Logger().wtf('e.response?.statusCode == 401');
            Response regenerateToken = await refreshTokenApi();
            Logger().w('regenerateToken: ${regenerateToken.data['msg']}');
            var statusRevoke = regenerateToken.data['msg'].toString().toLowerCase();
            if (regenerateToken.statusCode == 201 && statusRevoke != 'token has been revoked') {
              Logger().wtf('regenerateToken.statusCode == 201');
              try {
                // return handler.resolve(await _retry(e.requestOptions));
                Response retry = await _retry(e.requestOptions);
                // nyoba untuk nutup if else dan langsung return handler.resolve(retry);
                if (retry.statusCode == 200 || retry.statusCode == 201) {
                  Logger().wtf('retry.statusCode == 200 || retry.statusCode == 201');
                  return handler.resolve(retry);
                }
              } on DioError catch (err) {
                return handler.next(err);
              }
            } else {
              return handler.reject(
                DioError(
                  error: Constants.UNAUTHORIZED,
                  type: DioErrorType.other,
                  requestOptions: e.requestOptions,
                ),
              );
            }
          } else if (e.type == DioErrorType.receiveTimeout) {
            return handler.next(e);
            // throw Exception('Receive timeout');
          } else if (e.type == DioErrorType.response) {
            return handler.next(e);
            // throw Exception('Response error');
          } else {
            return handler.next(e);
          }
        }),
      ),
    );
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: {
        'Authorization': 'Bearer ${await UserSharedPreferences.getAccessToken()}',
      },
    );
    if (requestOptions.data is FormData) {
      FormData formData = FormData();
      formData.fields.addAll(requestOptions.data.fields);

      for (MapEntry mapFile in requestOptions.data.files) {
        formData.files.add(
          MapEntry(
              mapFile.key,
              MultipartFileExtended.fromFileSync(
                mapFile.value.filePath,
                filename: mapFile.value.filename,
                contentType: mapFile.value.contentType,
              )),
        );
      }
      requestOptions.data = formData;
    }
    return Dio().request<dynamic>(
      requestOptions.baseUrl + requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future refreshTokenApi() async {
    Logger().e('Future refreshTokenApi()');
    var tokenApi = Dio();
    tokenApi.options.baseUrl = baseUrl ?? Endpoints.baseURL;
    tokenApi.options.headers['Authorization'] = 'Bearer ${await UserSharedPreferences.getRefreshToken()}';

    try {
      var response = await tokenApi.post(Endpoints.refreshToken);
      if (response.statusCode == 201) {
        Logger().e('response.statusCode == 201');
        var resBody = response.data['data'];
        Logger().e('resBody: $resBody');
        await UserSharedPreferences.setAccessToken(resBody['access_token'].toString());
        return response;
      }
    } on DioError catch (e) {
      // Logger().e(e.message);
      // Logger().e(e.response?.data['message']);
      return e.response;
    }
  }

  late final Dio _dio;

  Future<Response<dynamic>> apiCall({
    required String url,
    required RequestType requestType,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, String>? header,
    RequestOptions? requestOptions,
  }) async {
    late Response result;

    switch (requestType) {
      case RequestType.get:
        {
          Options options = Options(headers: header);
          result = await _dio.get(url, queryParameters: queryParameters, options: options);
          break;
        }
      case RequestType.post:
        {
          Options options = Options(headers: header);
          result = await _dio.post(url, data: body, options: options);
          break;
        }
      case RequestType.delete:
        {
          Options options = Options(headers: header);
          result = await _dio.delete(url, data: body, options: options);
          break;
        }
      case RequestType.put:
        {
          Options options = Options(headers: header);
          result = await _dio.put(url, data: body, options: options);
          break;
        }
      case RequestType.patch:
        {
          Options options = Options(headers: header);
          result = await _dio.put(url, data: body, options: options);
          break;
        }
      case RequestType.postForm:
        {
          Options options = Options(headers: header);
          FormData formData = FormData();
          formData.fields.addAll(requestOptions?.data.fields);
          for (MapEntry mapFile in requestOptions?.data.files) {
            formData.files.add(
              MapEntry(
                mapFile.key,
                MultipartFileExtended.fromFileSync(
                  mapFile.value.filePath,
                  filename: mapFile.value.filename,
                  contentType: mapFile.value.contentType,
                  // contentType: MediaType('image', 'png'),
                ),
              ),
            );
            requestOptions?.data = formData;
          }
          result = await _dio.post(url, data: requestOptions?.data, options: options);
          break;
        }
    }
    return result;
  }
}

Future<Either<Failure, T>> remoteProcess<T>(Future<T> t) async {
  try {
    var futureCall = await t;
    return Right(futureCall);
  } on DioError catch (error) {
    return Left(
      GeneralFailure(
        type: error.type,
        code: error.response?.statusCode ?? 0,
        message: error.response != null && error.response?.statusCode as int >= 500
            ? 'Terjadi kesalahan dalam berkomunikasi dengan Server, silahkan coba kembali beberapa saat lagi.'
            : error.response?.data['message'] ??
                error.response?.statusMessage ??
                'Terjadi kesalahan dalam berkomunikasi dengan Server, silahkan coba kembali beberapa saat lagi.',
      ),
    );
  } catch (error) {
    return Left(GeneralFailure(message: error.toString()));
  }
}
