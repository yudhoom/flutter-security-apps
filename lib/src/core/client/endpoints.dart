import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  Endpoints._();

  static String baseURL = dotenv.get('BASE_URL');
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 30000;

  //Auth
  static const String refreshToken = '/api/v1/auth/refresh-token';
  static const String loginAuth = '/api/v1/security/auth/login';
  static const String preregisterUrl = '/api/v1/praregister_user';
  static const String authLoginUrl = '/api/v1/security/auth/login';

  //OTP
  static const String otpGenerate = '/api/v1/otp/generate';
  static const String otpVerify = '/api/v1/otp/verify';

  //Pin
  static const String validateDefaultPin = '/api/v1/security/pin/validate-default-pin';
  static const String createPin = '/api/v1/security/pin/create';
  static const String verifyPin = '/api/v1/security/pin/verify';
  static const String validateOldPin = '/api/v1/security/pin/validate-old-pin';
  static const String changePin = '/api/v1/security/pin/change'; //🔐 JWT Required
  static const String forgotPin = '/api/v1/security/pin/forgot';
  static const String verifyWeakPin = '/api/v1/pin/check-strength';

  //My Employee
  static const String brandUrl = '/api/v1/brand';
  static const String qrScanUrl = '/api/v1/qr-scan';
  static const String findEmployee = '/api/v1/employees';
  static const String findEmpByKeyword = '/api/v1/general/find-emp-by-keyword';

  //Manifest
  static const String scanQR = '/api/v1/scan-qr';
  static const String bulkGateIn = '/api/v1/bulk-gate';

  //Visitors
  static const String visitorCounter = '/api/v1/visitor/counter';
  static const String findGuest = '/api/v1/visitor/guests';
  static const String findVip = '/api/v1/visitor/vips';
  static const String findRegular = '/api/v1/visitor/regulars';
  static const String findRealization = '/api/v1/visitor/realization';
  static const String postSingleGateIn = '/api/v1/gate-in-out/single-gate-in';
  static const String putSingleGateOut = '/api/v1/gate-in-out/single-gate-out';

  //OTS
  static const String otsGateInEmployee = '/api/v1/ots/employee';
  static const String otsGateInTamu = '/api/v1/ots/guest';

  //Upload Temporary
  static const String uploadTemporary = '/api/v1/upload/temp-img-profile';
}
