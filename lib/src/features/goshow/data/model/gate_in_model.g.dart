// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gate_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GateInModel _$$_GateInModelFromJson(Map<String, dynamic> json) =>
    _$_GateInModel(
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : GateInKaryawanTamu.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_GateInModelToJson(_$_GateInModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
