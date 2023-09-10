import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/client/failure.dart';
import '../../data/repository/visitor_repository_impl.dart';
import '../entity/visitor_counter.dart';
import '../entity/visitor_detail.dart';
import '../entity/visitor_gate_in_out.dart';
import '../entity/visitor_input.dart';
import '../entity/visitor_total.dart';

abstract class VisitorRepository {
  Future<Either<Failure, VisitorCounter?>> getVisitorCounter();
  Future<Either<Failure, VisitorTotal?>> getVisitorGuest();
  Future<Either<Failure, VisitorDetail?>> getVisitorGuestDetail(String username, String idEvent, String idManifest);
  Future<Either<Failure, VisitorTotal?>> getVisitorVip();
  Future<Either<Failure, VisitorDetail?>> getVisitorVipDetail(String username, String idManifest);
  Future<Either<Failure, VisitorTotal?>> getVisitorRegular();
  Future<Either<Failure, VisitorDetail?>> getVisitorRegularDetail(String username, String idManifest);
  Future<Either<Failure, VisitorTotal?>> getVisitorRealization();
  Future<Either<Failure, VisitorDetail?>> getVisitorRealizationDetail(String username, String idManifest);
  Future<Either<Failure, VisitorGateInOut?>> postSingleGateIn(String username, VisitorInput visitorInput);
  Future<Either<Failure, VisitorGateInOut?>> putSingleGateOut(String username, VisitorInput visitorInput);
}

final visitorRepositoryProvider = Provider<VisitorRepository>(
  (ref) => VisitorRepositoryImpl(),
);
