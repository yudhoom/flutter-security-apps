// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VisitorDetailModel _$$_VisitorDetailModelFromJson(
        Map<String, dynamic> json) =>
    _$_VisitorDetailModel(
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : VisitorDetail.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_VisitorDetailModelToJson(
        _$_VisitorDetailModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
