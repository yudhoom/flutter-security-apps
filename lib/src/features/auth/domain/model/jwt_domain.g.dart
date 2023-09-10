// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JwtDomain _$$_JwtDomainFromJson(Map<String, dynamic> json) => _$_JwtDomain(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$$_JwtDomainToJson(_$_JwtDomain instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
