// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VisitorModel _$$_VisitorModelFromJson(Map<String, dynamic> json) =>
    _$_VisitorModel(
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : VisitorTotal.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_VisitorModelToJson(_$_VisitorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
