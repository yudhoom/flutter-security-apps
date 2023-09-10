// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Otp _$$_OtpFromJson(Map<String, dynamic> json) => _$_Otp(
      username: json['username'] as String?,
      otp: json['otp'] as String?,
      otpExp: json['otpExp'] as String?,
      secExp: json['secExp'] as int?,
    );

Map<String, dynamic> _$$_OtpToJson(_$_Otp instance) => <String, dynamic>{
      'username': instance.username,
      'otp': instance.otp,
      'otpExp': instance.otpExp,
      'secExp': instance.secExp,
    };
