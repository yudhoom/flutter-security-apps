// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
abstract class Login with _$Login {
  const factory Login({
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'grade') String? grade,
    @JsonKey(name: 'user_role') String? userRole,
    @JsonKey(name: 'emails') List<Email>? emails,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'pin_status') int? pinStatus,
    @JsonKey(name: 'pin_status_desc') String? pinStatusDesc,
    @JsonKey(name: 'image_available') bool? imageAvailable,
    @JsonKey(name: 'image_profile_url') String? imageProfileUrl,
    @JsonKey(name: 'is_change_password') String? isChangePassword,
  }) = _Login;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
}

@freezed
abstract class Email with _$Email {
  const factory Email({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'email_address') String? emailAddress,
  }) = _Email;

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);
}
