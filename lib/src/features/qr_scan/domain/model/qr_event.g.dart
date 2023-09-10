// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QrEvent _$$_QrEventFromJson(Map<String, dynamic> json) => _$_QrEvent(
      username: json['username'] as String?,
      name: json['name'] as String?,
      company: json['company'] as String?,
      gender: json['gender'] as String?,
      photo: json['photo'] as String?,
      visitorCategory: json['visitor_category'] as String?,
      idEvent: json['id_event'] as int?,
      idManifest: json['id_manifest'] as int?,
    );

Map<String, dynamic> _$$_QrEventToJson(_$_QrEvent instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'company': instance.company,
      'gender': instance.gender,
      'photo': instance.photo,
      'visitor_category': instance.visitorCategory,
      'id_event': instance.idEvent,
      'id_manifest': instance.idManifest,
    };
