import 'package:jtlc_front/src/features/qr_scan/domain/model/bulk_gate.dart';

import '../../../../core/client/dio_client.dart';
import '../../../../core/client/endpoints.dart';
import '../model/qr_event_model.dart';
import '../model/visitor_gate_model.dart';

abstract class QREventRemoteDataSource {
  Future<QrEventModel> findEmployee(String payload, String gate);
  Future<VisitorGateModel> bulkGate(BulkGate payload);
  Future<VisitorGateModel> bulkGateOut(BulkGate payload);
}

//=========================================================================
class QREventRemoteDataSourceImpl implements QREventRemoteDataSource {
  @override
  Future<QrEventModel> findEmployee(String payload, String gate) async {
    final resp = await DioClient().apiCall(
      url: Endpoints.scanQR,
      requestType: RequestType.post,
      body: {'action_type': gate, 'payload': payload},
    );
    return QrEventModel.fromJson(resp.data);
  }

  @override
  Future<VisitorGateModel> bulkGate(BulkGate payload) async {
    final resp = await DioClient().apiCall(
      url: Endpoints.bulkGateIn,
      requestType: RequestType.post,
      body: {
        // 'action_type': payload.actionType,
        // 'security_username': payload.securityUsername,
        'username': payload.securityUsername,
        'driver_name': payload.driverName,
        'driver_gender': payload.driverGender,
        'driver_photo': payload.driverPhoto,
        'visitors': payload.visitors
      },
    );
    return VisitorGateModel.fromJson(resp.data);
  }

  @override
  Future<VisitorGateModel> bulkGateOut(BulkGate payload) async {
    final resp = await DioClient().apiCall(
      url: Endpoints.bulkGateIn,
      requestType: RequestType.put,
      body: {
        // 'action_type': payload.actionType,
        // 'security_username': payload.securityUsername,
        'username': payload.securityUsername,
        // 'driver_name': payload.driverName,
        // 'driver_gender': payload.driverGender,
        // 'driver_photo': payload.driverPhoto,
        'visitors': payload.visitors
      },
    );
    return VisitorGateModel.fromJson(resp.data);
  }
}
