import 'package:dartz/dartz.dart';
import 'package:jtlc_front/src/features/auth/domain/model/login.dart';
import 'package:jtlc_front/src/features/qr_scan/domain/model/qr_event.dart';
import 'package:logger/logger.dart';

import '../../../../core/client/dio_client.dart';
import '../../../../core/client/failure.dart';
import '../../../otp/domain/entities/otp.dart';
import '../../domain/model/jwt_domain.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final remoteDataSource = AuthRemoteDataSourceImpl();

  @override
  Future<Either<Failure, Otp?>> otpGenerate(String username, String type, String contact) async {
    final resp = await remoteProcess(
      remoteDataSource.otpGenerage(username, type, contact),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, String?>> otpVerify(String username, String otpNumber) async {
    final resp = await remoteProcess(
      remoteDataSource.otpVerify(username, otpNumber),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Failure, Login?>> authLogin(String username) async {
    final resp = await remoteProcess(
      remoteDataSource.authLogin(username),
    );
    return resp.fold(
      (failure) => Left(failure),
      (login) => Right(login.data),
    );
  }

  @override
  Future<Either<Failure, QrEvent?>> scanQr(String qrId) async {
    final resp = await remoteProcess(
      remoteDataSource.scanQr(qrId),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, Login?>> login(String username) async {
    final resp = await remoteProcess(
      remoteDataSource.login(username),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, String?>> verifyWeakPin(String username, String pin) async {
    var resp = await remoteProcess(
      remoteDataSource.verifyWeakPin(username, pin),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data['message']),
    );
  }

  @override
  Future<Either<Failure, JwtDomain?>> createPin(String username, String pin) async {
    var resp = await remoteProcess(
      remoteDataSource.createPin(username, pin),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, String?>> forgotPin(String username) async {
    var resp = await remoteProcess(
      remoteDataSource.forgotPin(username),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Failure, JwtDomain?>> verifyPin(String username, String pin) async {
    var resp = await remoteProcess(
      remoteDataSource.verifyPin(username, pin),
    );
    Logger().w(resp);
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, JwtDomain?>> validateDefaultPin(String username, String pin) async {
    var resp = await remoteProcess(
      remoteDataSource.validateDefaultPin(username, pin),
    );
    Logger().w(resp);
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r.data),
    );
  }

  @override
  Future<Either<Failure, String?>> validateOldPin(String username, String pin) async {
    var resp = await remoteProcess(
      remoteDataSource.validateOldPin(username, pin),
    );
    return await resp.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Failure, String?>> pinChange(String username, String pin, String pinNew) async {
    var resp = await remoteProcess(
      remoteDataSource.pinChange(username, pin, pinNew),
    );
    return resp.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
