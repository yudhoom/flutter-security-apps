import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/client/failure.dart';
import '../../data/model/qr_event_model.dart';
import '../../data/repository/qr_event_repository_impl.dart';
import '../model/bulk_gate.dart';
import '../model/visitor_gate.dart';

abstract class QREventRepository {
  Future<Either<Failure, QrEventModel?>> findEmployee(String payload, String gate);
  Future<Either<Failure, VisitorGate?>> bulkGate(BulkGate payload);
  Future<Either<Failure, VisitorGate?>> bulkGateOut(BulkGate payload);
}

final qrEventRepositoryProvider = Provider<QREventRepository>(
  (ref) => QRScanRepositoryImpl(),
);
