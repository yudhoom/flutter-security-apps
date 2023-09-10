// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_gate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VisitorGateModel _$$_VisitorGateModelFromJson(Map<String, dynamic> json) =>
    _$_VisitorGateModel(
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : VisitorGate.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_VisitorGateModelToJson(_$_VisitorGateModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
