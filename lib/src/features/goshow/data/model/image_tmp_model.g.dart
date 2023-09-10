// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_tmp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageTmpModel _$$_ImageTmpModelFromJson(Map<String, dynamic> json) =>
    _$_ImageTmpModel(
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : ImageTmp.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_ImageTmpModelToJson(_$_ImageTmpModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
