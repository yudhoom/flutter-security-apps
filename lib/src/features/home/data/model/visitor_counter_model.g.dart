// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_counter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VisitorCounterModel _$$_VisitorCounterModelFromJson(
        Map<String, dynamic> json) =>
    _$_VisitorCounterModel(
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : VisitorCounter.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_VisitorCounterModelToJson(
        _$_VisitorCounterModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
