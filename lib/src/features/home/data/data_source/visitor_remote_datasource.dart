import 'package:logger/logger.dart';

import '../../../../core/client/dio_client.dart';
import '../../../../core/client/endpoints.dart';
import '../../domain/entity/visitor_input.dart';
import '../model/visitor_counter_model.dart';
import '../model/visitor_detail_model.dart';
import '../model/visitor_gate_in_out_model.dart';
import '../model/visitor_model.dart';

abstract class VisitorRemoteDataSource {
  Future<VisitorCounterModel> getVisitorCounter();
  Future<VisitorModel> getVisitorGuest();
  Future<VisitorDetailModel> getVisitorGuestDetail(String username, String idEvent, String idManifest);
  Future<VisitorModel> getVisitorVip();
  Future<VisitorDetailModel> getVisitorVipDetail(String username, String finalIdManifest);
  Future<VisitorModel> getVisitorRegular();
  Future<VisitorDetailModel> getVisitorRegularDetail(String username, String finalIdManifest);
  Future<VisitorModel> getVisitorRealization();
  Future<VisitorDetailModel> getVisitorRealizationDetail(String username, String finalIdManifest);
  Future<VisitorGateInOutModel> postSingleGateIn(String username, VisitorInput visitorInput);
  Future<VisitorGateInOutModel> putSingleGateOut(String username, VisitorInput visitorInput);
}

class VisitorRemoteDataSourceImpl implements VisitorRemoteDataSource {
  @override
  Future<VisitorCounterModel> getVisitorCounter() async {
    final resp = await DioClient().apiCall(
      url: Endpoints.visitorCounter,
      requestType: RequestType.get,
    );
    return VisitorCounterModel.fromJson(resp.data);
  }

  @override
  Future<VisitorModel> getVisitorGuest() async {
    final resp = await DioClient().apiCall(
      url: Endpoints.findGuest,
      requestType: RequestType.get,
    );
    return VisitorModel.fromJson(resp.data);
  }

  @override
  Future<VisitorDetailModel> getVisitorGuestDetail(String username, String idEvent, String idManifest) async {
    var finalIdEvent = idEvent == 'null' ? 0 : idEvent;
    var finalIdManifest = idManifest == 'null' ? 0 : idManifest;
    final resp = await DioClient().apiCall(
      url: '${Endpoints.findGuest}/$username?id_event=$finalIdEvent&id_manifest=$finalIdManifest',
      requestType: RequestType.get,
    );
    return VisitorDetailModel.fromJson(resp.data);
  }

  @override
  Future<VisitorModel> getVisitorVip() async {
    final resp = await DioClient().apiCall(
      url: Endpoints.findVip,
      requestType: RequestType.get,
    );
    return VisitorModel.fromJson(resp.data);
  }

  @override
  Future<VisitorDetailModel> getVisitorVipDetail(String username, String idManifest) async {
    var finalIdManifest = idManifest == 'null' ? 0 : idManifest;
    final resp = await DioClient().apiCall(
      url: '${Endpoints.findVip}/$username?id_manifest=$finalIdManifest',
      requestType: RequestType.get,
    );
    return VisitorDetailModel.fromJson(resp.data);
  }

  @override
  Future<VisitorModel> getVisitorRegular() async {
    final resp = await DioClient().apiCall(
      url: Endpoints.findRegular,
      requestType: RequestType.get,
    );
    return VisitorModel.fromJson(resp.data);
  }

  @override
  Future<VisitorDetailModel> getVisitorRegularDetail(String username, String idManifest) async {
    var finalIdManifest = idManifest == 'null' ? 0 : idManifest;
    final resp = await DioClient().apiCall(
      url: '${Endpoints.findRegular}/$username?id_manifest=$finalIdManifest',
      requestType: RequestType.get,
    );
    return VisitorDetailModel.fromJson(resp.data);
  }

  @override
  Future<VisitorModel> getVisitorRealization() async {
    final resp = await DioClient().apiCall(
      url: Endpoints.findRealization,
      requestType: RequestType.get,
      queryParameters: {},
    );
    return VisitorModel.fromJson(resp.data);
  }

  @override
  Future<VisitorDetailModel> getVisitorRealizationDetail(String username, String idManifest) async {
    var finalIdManifest = idManifest == 'null' ? 0 : idManifest;
    final resp = await DioClient().apiCall(
      url: '${Endpoints.findRealization}/$username?id_manifest=$finalIdManifest',
      requestType: RequestType.get,
    );
    return VisitorDetailModel.fromJson(resp.data);
  }

  @override
  Future<VisitorGateInOutModel> postSingleGateIn(String username, VisitorInput visitorInput) async {
    // Logger().w(visitorInput.toMap());
    final resp = await DioClient().apiCall(
      url: Endpoints.postSingleGateIn,
      requestType: RequestType.post,
      body: {
        "visitor": {
          "id_access_type": visitorInput.idAccessType,
          "id_emp_type": visitorInput.idEmpType,
          "username": visitorInput.username,
          "phone": visitorInput.phone,
          "name": visitorInput.name,
          "id_event": visitorInput.idEvent,
          "id_gate_stat": visitorInput.idGateStat,
          "is_expired": visitorInput.isExpired,
        },
        "username": username,
      },
    );
    // Logger().w(resp.toString());
    return VisitorGateInOutModel.fromJson(resp.data);
  }

  @override
  Future<VisitorGateInOutModel> putSingleGateOut(String username, VisitorInput visitorInput) async {
    Logger().w(visitorInput.toMap());
    Logger().w(username);
    final resp = await DioClient().apiCall(
      url: Endpoints.putSingleGateOut,
      requestType: RequestType.put,
      body: {
        "visitor": {
          "id_manifest": visitorInput.idManifest,
          "username": visitorInput.username,
          "id_gate_stat": visitorInput.idGateStat,
        },
        "username": username,
      },
    );
    Logger().w(resp.toString());
    return VisitorGateInOutModel.fromJson(resp.data);
  }
}
