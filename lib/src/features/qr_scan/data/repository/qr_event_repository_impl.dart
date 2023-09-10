import 'package:dartz/dartz.dart';
import 'package:jtlc_front/src/features/qr_scan/domain/model/bulk_gate.dart';

import '../../../../core/client/dio_client.dart';
import '../../../../core/client/failure.dart';
import '../../domain/model/visitor_gate.dart';
import '../../domain/repository/qr_event_repository.dart';
import '../data_source/qr_event_remote_datasource.dart';
import '../model/qr_event_model.dart';

class QRScanRepositoryImpl implements QREventRepository {
  final remoteDataSource = QREventRemoteDataSourceImpl();

  @override
  Future<Either<Failure, QrEventModel?>> findEmployee(String payload, String gate) async {
    final resp = await remoteProcess(
      remoteDataSource.findEmployee(payload, gate),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Failure, VisitorGate?>> bulkGate(BulkGate payload) async {
    final resp = await remoteProcess(
      remoteDataSource.bulkGate(payload),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, VisitorGate?>> bulkGateOut(BulkGate payload) async {
    final resp = await remoteProcess(
      remoteDataSource.bulkGateOut(payload),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }
}
