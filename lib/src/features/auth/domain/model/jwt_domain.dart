// To parse this JSON data, do
//
//     final jwtDomain = jwtDomainFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt_domain.freezed.dart';
part 'jwt_domain.g.dart';

@freezed
abstract class JwtDomain with _$JwtDomain {
  const factory JwtDomain({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = _JwtDomain;

  factory JwtDomain.fromJson(Map<String, dynamic> json) => _$JwtDomainFromJson(json);
}
