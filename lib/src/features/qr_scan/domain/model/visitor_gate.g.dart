// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_gate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VisitorGate _$$_VisitorGateFromJson(Map<String, dynamic> json) =>
    _$_VisitorGate(
      securityUsername: json['security_username'] as String?,
      securityName: json['security_name'] as String?,
      driverName: json['driver_name'] as String?,
      driverGender: json['driver_gender'] as int?,
      driverPhoto: json['driver_photo'] as String?,
      visitors: (json['visitors'] as List<dynamic>?)
          ?.map((e) => Visitor.fromJson(e as Map<String, dynamic>))
          .toList(),
      actionTime: json['action_time'] as String?,
    );

Map<String, dynamic> _$$_VisitorGateToJson(_$_VisitorGate instance) =>
    <String, dynamic>{
      'security_username': instance.securityUsername,
      'security_name': instance.securityName,
      'driver_name': instance.driverName,
      'driver_gender': instance.driverGender,
      'driver_photo': instance.driverPhoto,
      'visitors': instance.visitors,
      'action_time': instance.actionTime,
    };

_$_Visitor _$$_VisitorFromJson(Map<String, dynamic> json) => _$_Visitor(
      username: json['username'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      idAccessType: json['id_access_type'] as int?,
      idEmpType: json['id_emp_type'] as int?,
      company: json['company'] as String?,
      gender: json['gender'] as String?,
      photo: json['photo'] as String?,
      accessType: json['access_type'] as String?,
      validStart: json['valid_start'] == null
          ? null
          : DateTime.parse(json['valid_start'] as String),
      validEnd: json['valid_end'] == null
          ? null
          : DateTime.parse(json['valid_end'] as String),
      visitorCategory: json['visitor_category'] as String?,
      idEvent: json['id_event'] as int?,
      idManifest: json['id_manifest'] as int?,
    );

Map<String, dynamic> _$$_VisitorToJson(_$_Visitor instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'phone': instance.phone,
      'id_access_type': instance.idAccessType,
      'id_emp_type': instance.idEmpType,
      'company': instance.company,
      'gender': instance.gender,
      'photo': instance.photo,
      'access_type': instance.accessType,
      'valid_start': instance.validStart?.toIso8601String(),
      'valid_end': instance.validEnd?.toIso8601String(),
      'visitor_category': instance.visitorCategory,
      'id_event': instance.idEvent,
      'id_manifest': instance.idManifest,
    };
