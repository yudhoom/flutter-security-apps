// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Login _$$_LoginFromJson(Map<String, dynamic> json) => _$_Login(
      username: json['username'] as String?,
      name: json['name'] as String?,
      grade: json['grade'] as String?,
      userRole: json['user_role'] as String?,
      emails: (json['emails'] as List<dynamic>?)
          ?.map((e) => Email.fromJson(e as Map<String, dynamic>))
          .toList(),
      phone: json['phone'] as String?,
      pinStatus: json['pin_status'] as int?,
      pinStatusDesc: json['pin_status_desc'] as String?,
      imageAvailable: json['image_available'] as bool?,
      imageProfileUrl: json['image_profile_url'] as String?,
      isChangePassword: json['is_change_password'] as String?,
    );

Map<String, dynamic> _$$_LoginToJson(_$_Login instance) => <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'grade': instance.grade,
      'user_role': instance.userRole,
      'emails': instance.emails,
      'phone': instance.phone,
      'pin_status': instance.pinStatus,
      'pin_status_desc': instance.pinStatusDesc,
      'image_available': instance.imageAvailable,
      'image_profile_url': instance.imageProfileUrl,
      'is_change_password': instance.isChangePassword,
    };

_$_Email _$$_EmailFromJson(Map<String, dynamic> json) => _$_Email(
      id: json['id'] as int?,
      emailAddress: json['email_address'] as String?,
    );

Map<String, dynamic> _$$_EmailToJson(_$_Email instance) => <String, dynamic>{
      'id': instance.id,
      'email_address': instance.emailAddress,
    };
