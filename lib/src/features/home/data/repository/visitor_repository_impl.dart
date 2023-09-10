import 'package:dartz/dartz.dart';
import 'package:jtlc_front/src/features/home/domain/entity/visitor_gate_in_out.dart';
import 'package:jtlc_front/src/features/home/domain/entity/visitor_input.dart';

import '../../../../core/client/dio_client.dart';
import '../../../../core/client/failure.dart';
import '../../domain/entity/visitor_counter.dart';
import '../../domain/entity/visitor_detail.dart';
import '../../domain/entity/visitor_total.dart';
import '../../domain/repository/visitor_repository.dart';
import '../data_source/visitor_remote_datasource.dart';

class VisitorRepositoryImpl implements VisitorRepository {
  final remoteDataSource = VisitorRemoteDataSourceImpl();

  @override
  Future<Either<Failure, VisitorCounter?>> getVisitorCounter() async {
    final resp = await remoteProcess(
      remoteDataSource.getVisitorCounter(),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, VisitorTotal?>> getVisitorGuest() async {
    final resp = await remoteProcess(
      remoteDataSource.getVisitorGuest(),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, VisitorTotal?>> getVisitorVip() async {
    final resp = await remoteProcess(
      remoteDataSource.getVisitorVip(),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, VisitorTotal?>> getVisitorRegular() async {
    final resp = await remoteProcess(
      remoteDataSource.getVisitorRegular(),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, VisitorTotal?>> getVisitorRealization() async {
    final resp = await remoteProcess(
      remoteDataSource.getVisitorRealization(),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, VisitorDetail?>> getVisitorGuestDetail(String username, String idEvent, String idManifest) async {
    final resp = await remoteProcess(
      remoteDataSource.getVisitorGuestDetail(username, idEvent, idManifest),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, VisitorDetail?>> getVisitorRegularDetail(String username, String idManifest) async {
    final resp = await remoteProcess(
      remoteDataSource.getVisitorRegularDetail(username, idManifest),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, VisitorDetail?>> getVisitorVipDetail(String username, String idManifest) async {
    final resp = await remoteProcess(
      remoteDataSource.getVisitorVipDetail(username, idManifest),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, VisitorDetail?>> getVisitorRealizationDetail(String username, String idManifest) async {
    final resp = await remoteProcess(
      remoteDataSource.getVisitorRealizationDetail(username, idManifest),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, VisitorGateInOut?>> postSingleGateIn(String username, VisitorInput visitorInput) async {
    final resp = await remoteProcess(
      remoteDataSource.postSingleGateIn(username, visitorInput),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, VisitorGateInOut?>> putSingleGateOut(String username, VisitorInput visitorInput) async {
    final resp = await remoteProcess(
      remoteDataSource.putSingleGateOut(username, visitorInput),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }
}
