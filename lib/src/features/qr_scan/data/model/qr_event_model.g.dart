// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QrEventModel _$$_QrEventModelFromJson(Map<String, dynamic> json) =>
    _$_QrEventModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : QrEvent.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_QrEventModelToJson(_$_QrEventModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
