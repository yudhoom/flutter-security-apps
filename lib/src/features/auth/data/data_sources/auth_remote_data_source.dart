// ignore_for_file: override_on_non_overriding_member

import 'package:logger/logger.dart';

import '../../../../core/client/dio_client.dart';
import '../../../../core/client/endpoints.dart';
import '../../../qr_scan/data/model/qr_event_model.dart';
import '../model/jwt_model.dart';
import '../model/login_model.dart';
import '../model/otp_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> refreshToken(String refreshToken);
  Future<QrEventModel> scanQr(String year);
  Future<LoginModel> login(String username);
  Future<LoginModel> authLogin(String username);
  Future<JwtModel> createPin(String username, String pin);
  Future<dynamic> verifyWeakPin(String username, String pin);
  Future<String> forgotPin(String username);
  Future<JwtModel> verifyPin(String username, String pin);
  Future<JwtModel> validateDefaultPin(String username, String pin);
  Future<String> validateOldPin(String username, String pin);
  Future<String> pinChange(String username, String pin, String pinNew);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<OtpModel> otpGenerage(String username, String type, String contact) async {
    final resp = await DioClient().apiCall(
      url: Endpoints.otpGenerate,
      requestType: RequestType.post,
      body: {
        'username': username,
        'type': type,
        'contact': contact,
      },
    );
    return OtpModel.fromJson(resp.data);
  }

  @override
  Future<String> otpVerify(String username, String otpNumber) async {
    var resp = await DioClient().apiCall(
      url: Endpoints.otpVerify,
      requestType: RequestType.post,
      body: {
        'username': username,
        'otp': otpNumber,
      },
    );
    return resp.data['message'] as String;
  }

  @override
  Future<String> refreshToken(String refreshToken) async {
    // Logger().wtf('refreshToken >>>' + refreshToken);
    final resp = await DioClient().apiCall(
      header: {
        'Authorization': 'Bearer $refreshToken',
        'Content-Type': 'application/json',
      },
      url: Endpoints.refreshToken,
      requestType: RequestType.post,
    );
    // Logger().wtf('refreshToken >>>' + resp.data);
    return resp.data['access_token'] as String;
  }

  @override
  Future<LoginModel> authLogin(String username) async {
    final resp = await DioClient().apiCall(
      url: Endpoints.authLoginUrl,
      requestType: RequestType.post,
      body: {
        'username': username,
      },
    );
    return LoginModel.fromJson(resp.data);
  }

  @override
  Future<QrEventModel> scanQr(String qrId) async {
    final resp = await DioClient().apiCall(
      url: '${Endpoints.qrScanUrl}/$qrId',
      requestType: RequestType.get,
    );
    return QrEventModel.fromJson(resp.data);
  }

  @override
  Future<QrEventModel> findEmployee(String empid) async {
    final resp = await DioClient().apiCall(
      url: '${Endpoints.findEmployee}/$empid',
      requestType: RequestType.post,
    );
    return QrEventModel.fromJson(resp.data);
  }

  @override
  Future<LoginModel> login(String username) async {
    final resp = await DioClient().apiCall(
      url: Endpoints.loginAuth,
      requestType: RequestType.post,
      body: {
        'username': username,
      },
    );
    return LoginModel.fromJson(resp.data);
  }

  @override
  Future<dynamic> verifyWeakPin(String username, String pin) async {
    var resp = await DioClient().apiCall(
      url: Endpoints.verifyWeakPin,
      requestType: RequestType.post,
      body: {
        'pin': pin,
      },
    );
    return resp;
  }

  @override
  Future<JwtModel> createPin(String username, String pin) async {
    Logger().e('createPin >>>' + username + ' ' + pin);
    final resp = await DioClient().apiCall(
      url: Endpoints.createPin,
      requestType: RequestType.post,
      body: {
        'username': username,
        'pin': pin,
      },
    );
    return JwtModel.fromJson(resp.data);
  }

  @override
  Future<String> forgotPin(String username) async {
    final resp = await DioClient().apiCall(
      url: Endpoints.forgotPin,
      requestType: RequestType.post,
      body: {'username': username},
    );
    return resp.data['message'] as String;
  }

  @override
  Future<JwtModel> verifyPin(String username, String pin) async {
    final resp = await DioClient().apiCall(
      url: Endpoints.verifyPin,
      requestType: RequestType.post,
      body: {
        'username': username,
        'pin': pin,
      },
    );
    return JwtModel.fromJson(resp.data);
  }

  @override
  Future<JwtModel> validateDefaultPin(String username, String pin) async {
    Logger().w('validateDefaultPin >>>' + username + ' ' + pin);
    final resp = await DioClient().apiCall(
      url: Endpoints.validateDefaultPin,
      requestType: RequestType.post,
      body: {
        'username': username,
        'pin': pin,
      },
    );
    return JwtModel.fromJson(resp.data);
  }

  @override
  Future<String> validateOldPin(String username, String pin) async {
    final resp = await DioClient().apiCall(
      url: Endpoints.validateOldPin,
      requestType: RequestType.post,
      body: {
        'username': username,
        'pin': pin,
      },
    );
    return resp.data['message'] as String;
  }

  @override
  Future<String> pinChange(String username, String pin, String pinNew) async {
    final resp = await DioClient().apiCall(
      url: Endpoints.changePin,
      requestType: RequestType.post,
      body: {
        'username': username,
        'pin': pin,
        'new_pin': pinNew,
      },
    );
    return resp.data['message'] as String;
  }
}
