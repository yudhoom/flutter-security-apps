// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JwtModel _$$_JwtModelFromJson(Map<String, dynamic> json) => _$_JwtModel(
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : JwtDomain.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_JwtModelToJson(_$_JwtModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
