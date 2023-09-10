// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../otp/domain/entities/otp.dart';

part 'otp_model.freezed.dart';
part 'otp_model.g.dart';

@freezed
abstract class OtpModel with _$OtpModel {
  const factory OtpModel({
    int? status,
    Otp? data,
    String? message,
  }) = _OtpModel;

  factory OtpModel.fromJson(Map<String, dynamic> json) => _$OtpModelFromJson(json);
}
