// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:jtlc_front/src/features/goshow/domain/entities/gate_in_input_tamu.dart';
import 'package:logger/logger.dart';

import '../../../../core/client/dio_client.dart';
import '../../../../core/client/endpoints.dart';
import '../../../../core/client/multipart_file_extended.dart';
import '../../domain/entities/gate_in_input_karyawan.dart';
import '../model/gate_in_model.dart';
import '../model/image_tmp_model.dart';

abstract class GoshowRemoteDataSource {
  Future<GateInModel> gateInOtsEmployee(GateInInputKaryawan gateInInputKaryawan);
  Future<GateInModel> gateInOtsTamu(GateInInputTamu gateInInputTamu);
  Future<ImageTmpModel> uploadTmpImageProfile(XFile xfile, File file);
}

class GoshowRemoteDataSourceImpl implements GoshowRemoteDataSource {
  @override
  Future<GateInModel> gateInOtsEmployee(GateInInputKaryawan gateInInputKaryawan) async {
    Logger().w(gateInInputKaryawan.visitor?.toMap());
    final resp = await DioClient().apiCall(
      url: Endpoints.otsGateInEmployee,
      requestType: RequestType.post,
      body: {
        'visitor': gateInInputKaryawan.visitor?.toMap(),
        'username': gateInInputKaryawan.username,
      },
    );

    return GateInModel.fromJson(resp.data);
  }

  @override
  Future<GateInModel> gateInOtsTamu(GateInInputTamu gateInInputTamu) async {
    Logger().w(gateInInputTamu.toMap());
    final resp = await DioClient().apiCall(
      url: Endpoints.otsGateInTamu,
      requestType: RequestType.post,
      body: {
        'visitor': gateInInputTamu.visitor?.toMap(),
        'organizer': gateInInputTamu.organizer?.toMap(),
        'username': gateInInputTamu.username,
      },
    );

    return GateInModel.fromJson(resp.data);
  }

  @override
  Future<ImageTmpModel> uploadTmpImageProfile(XFile xfile, File file) async {
    FormData formData = FormData();
    formData = FormData.fromMap({
      "upload_file": MultipartFileExtended.fromFileSync(
        // xfile.path,
        file.path,
        filename: DateTime.now().toString(),
        contentType: MediaType('image', 'jpg'),
      ),
    });
    final resp = await DioClient().apiCall(
      url: Endpoints.uploadTemporary,
      requestType: RequestType.postForm,
      requestOptions: RequestOptions(
        data: formData,
        path: Endpoints.uploadTemporary,
        method: 'POST',
      ),
    );
    return ImageTmpModel.fromJson(resp.data);
  }
}
