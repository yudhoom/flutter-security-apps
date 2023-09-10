// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'direct_spv.freezed.dart';
part 'direct_spv.g.dart';

@freezed
abstract class DirectSpv with _$DirectSpv {
  const factory DirectSpv({
    @JsonKey(name: 'empid') String? empid,
    @JsonKey(name: 'empname') String? empname,
    @JsonKey(name: 'gendercode') String? gendercode,
    @JsonKey(name: 'gendername') String? gendername,
    @JsonKey(name: 'compcode') String? compcode,
    @JsonKey(name: 'compcodename') String? compcodename,
    @JsonKey(name: 'persareacode') String? persareacode,
    @JsonKey(name: 'persareaname') String? persareaname,
    @JsonKey(name: 'perssubareacode') String? perssubareacode,
    @JsonKey(name: 'perssubareaname') String? perssubareaname,
    @JsonKey(name: 'grade') String? grade,
    @JsonKey(name: 'spv_empid') String? spvEmpid,
    @JsonKey(name: 'spv_empname') String? spvEmpname,
    @JsonKey(name: 'image_profile_url') String? imageProfileUrl,
    @JsonKey(name: 'email_address') String? emailAddress,
    @JsonKey(name: 'image_available') bool? imageAvailable,
  }) = _DirectSpv;

  factory DirectSpv.fromJson(Map<String, dynamic> json) => _$DirectSpvFromJson(json);
}
