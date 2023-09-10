import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/client/failure.dart';
import '../../../otp/domain/entities/otp.dart';
import '../../../qr_scan/domain/model/qr_event.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../model/jwt_domain.dart';
import '../model/login.dart';

abstract class AuthRepository {
  Future<Either<Failure, QrEvent?>> scanQr(String qrId);
  Future<Either<Failure, Login?>> login(String username);
  Future<Either<Failure, Login?>> authLogin(String username);
  Future<Either<Failure, String?>> verifyWeakPin(String username, String pin);
  Future<Either<Failure, JwtDomain?>> createPin(String username, String pin);
  Future<Either<Failure, String?>> forgotPin(String username);
  Future<Either<Failure, JwtDomain?>> verifyPin(String username, String pin);
  Future<Either<Failure, JwtDomain?>> validateDefaultPin(String username, String pin);
  Future<Either<Failure, String?>> validateOldPin(String username, String pin);
  Future<Either<Failure, String?>> pinChange(String username, String pin, String pinNew);
  Future<Either<Failure, Otp?>> otpGenerate(String username, String type, String contact);
  Future<Either<Failure, String?>> otpVerify(String username, String otpNumber);
}

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(),
);
