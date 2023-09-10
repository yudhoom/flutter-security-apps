// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'visitor_gate.freezed.dart';
part 'visitor_gate.g.dart';

@freezed
abstract class VisitorGate with _$VisitorGate {
  const factory VisitorGate({
    @JsonKey(name: 'security_username') String? securityUsername,
    @JsonKey(name: 'security_name') String? securityName,
    @JsonKey(name: 'driver_name') String? driverName,
    @JsonKey(name: 'driver_gender') int? driverGender,
    @JsonKey(name: 'driver_photo') String? driverPhoto,
    @JsonKey(name: 'visitors') List<Visitor>? visitors,
    // @JsonKey(name: 'action_type') String? actionType,
    @JsonKey(name: 'action_time') String? actionTime,
  }) = _VisitorGate;

  factory VisitorGate.fromJson(Map<String, dynamic> json) => _$VisitorGateFromJson(json);
}

@freezed
abstract class Visitor with _$Visitor {
  const factory Visitor({
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'id_access_type') int? idAccessType,
    @JsonKey(name: 'id_emp_type') int? idEmpType,
    @JsonKey(name: 'company') String? company,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'photo') String? photo,
    @JsonKey(name: 'access_type') String? accessType,
    @JsonKey(name: 'valid_start') DateTime? validStart,
    @JsonKey(name: 'valid_end') DateTime? validEnd,
    @JsonKey(name: 'visitor_category') String? visitorCategory,
    @JsonKey(name: 'id_event') int? idEvent,
    @JsonKey(name: 'id_manifest') int? idManifest,
  }) = _Visitor;

  factory Visitor.fromJson(Map<String, dynamic> json) => _$VisitorFromJson(json);
}
