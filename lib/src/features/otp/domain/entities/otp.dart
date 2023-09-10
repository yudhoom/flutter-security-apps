// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp.freezed.dart';
part 'otp.g.dart';

@freezed
abstract class Otp with _$Otp {
  const factory Otp({
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "otp") String? otp,
    @JsonKey(name: "otpExp") String? otpExp,
    @JsonKey(name: "secExp") int? secExp,
  }) = _Otp;

  factory Otp.fromJson(Map<String, dynamic> json) => _$OtpFromJson(json);
}
