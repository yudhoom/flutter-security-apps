import 'package:dio/dio.dart';

abstract class Failure implements Exception {
  DioErrorType? type;
  int? code;
  String? title;
  String? message;
  Failure({this.title, this.message, this.code, this.type});
}

class GeneralFailure extends Failure {
  GeneralFailure({String? message, int? code, DioErrorType? type})
      : super(
          type: type,
          code: code,
          title: 'General Failure',
          message: message,
        );
}
