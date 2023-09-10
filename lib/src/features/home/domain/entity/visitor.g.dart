// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Visitor _$$_VisitorFromJson(Map<String, dynamic> json) => _$_Visitor(
      username: json['username'] as String?,
      name: json['name'] as String?,
      idManifest: json['id_manifest'] as int?,
      idEvent: json['id_event'] as int?,
      visitorTypeDesc: json['visitor_type_desc'] as String?,
      idGender: json['id_gender'] as int?,
      gendername: json['gendername'] as String?,
      idGateStat: json['id_gate_stat'] as int?,
      gateStatDesc: json['gate_stat_desc'] as String?,
      isExpired: json['is_expired'] as String?,
      isOts: json['is_ots'] as String?,
    );

Map<String, dynamic> _$$_VisitorToJson(_$_Visitor instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'id_manifest': instance.idManifest,
      'id_event': instance.idEvent,
      'visitor_type_desc': instance.visitorTypeDesc,
      'id_gender': instance.idGender,
      'gendername': instance.gendername,
      'id_gate_stat': instance.idGateStat,
      'gate_stat_desc': instance.gateStatDesc,
      'is_expired': instance.isExpired,
      'is_ots': instance.isOts,
    };
