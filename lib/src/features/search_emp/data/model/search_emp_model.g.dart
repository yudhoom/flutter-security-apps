// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_emp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchEmpModel _$$_SearchEmpModelFromJson(Map<String, dynamic> json) =>
    _$_SearchEmpModel(
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DirectSpv.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_SearchEmpModelToJson(_$_SearchEmpModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
