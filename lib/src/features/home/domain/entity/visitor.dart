// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'visitor.freezed.dart';
part 'visitor.g.dart';

@freezed
abstract class Visitor with _$Visitor {
  const factory Visitor({
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'id_manifest') int? idManifest,
    @JsonKey(name: 'id_event') int? idEvent,
    @JsonKey(name: 'visitor_type_desc') String? visitorTypeDesc,
    @JsonKey(name: 'id_gender') int? idGender,
    @JsonKey(name: 'gendername') String? gendername,
    @JsonKey(name: 'id_gate_stat') int? idGateStat,
    @JsonKey(name: 'gate_stat_desc') String? gateStatDesc,
    @JsonKey(name: 'is_expired') String? isExpired,
    @JsonKey(name: 'is_ots') String? isOts,
  }) = _Visitor;

  factory Visitor.fromJson(Map<String, dynamic> json) => _$VisitorFromJson(json);
}
