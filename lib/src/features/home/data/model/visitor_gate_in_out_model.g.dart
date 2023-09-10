// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_gate_in_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VisitorGateInOutModel _$$_VisitorGateInOutModelFromJson(
        Map<String, dynamic> json) =>
    _$_VisitorGateInOutModel(
      data: json['data'] == null
          ? null
          : VisitorGateInOut.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_VisitorGateInOutModelToJson(
        _$_VisitorGateInOutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };
