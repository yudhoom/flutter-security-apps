// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'entrant.freezed.dart';
part 'entrant.g.dart';

@freezed
abstract class Entrant with _$Entrant {
  const factory Entrant({
    @JsonKey(name: 'id_participant') int? idParticipant,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'id_emp_type') String? idEmpType,
    @JsonKey(name: 'gendercode') String? gendercode,
    @JsonKey(name: 'gendername') String? gendername,
    @JsonKey(name: 'phone') dynamic phone,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'grade') String? grade,
    @JsonKey(name: 'compcode') String? compcode,
    @JsonKey(name: 'compcodename') String? compcodename,
    @JsonKey(name: 'persareacode') String? persareacode,
    @JsonKey(name: 'persareaname') String? persareaname,
    @JsonKey(name: 'perssubareacode') String? perssubareacode,
    @JsonKey(name: 'perssubareaname') String? perssubareaname,
    @JsonKey(name: 'is_stay') String? isStay,
    @JsonKey(name: 'is_stay_desc') String? isStayDesc,
    @JsonKey(name: 'spv_empid') String? spvEmpid,
    @JsonKey(name: 'spv_empname') String? spvEmpname,
    @JsonKey(name: 'gate_in_gate_out') String? gateInGateOut,
    @JsonKey(name: 'is_on_the_spot') bool? isOnTheSpot,
    @JsonKey(name: 'email_address') String? emailAddress,
    @JsonKey(name: 'image_available') bool? imageAvailable,
    @JsonKey(name: 'image_profile_url') String? imageProfileUrl,
  }) = _Entrant;

  factory Entrant.fromJson(Map<String, dynamic> json) => _$EntrantFromJson(json);
}
