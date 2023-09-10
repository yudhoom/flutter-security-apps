// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OtpModel _$$_OtpModelFromJson(Map<String, dynamic> json) => _$_OtpModel(
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : Otp.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_OtpModelToJson(_$_OtpModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
