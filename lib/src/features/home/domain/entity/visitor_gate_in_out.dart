// To parse this JSON data, do
//
//     final visitorGateInOut = visitorGateInOutFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'visitor_gate_in_out.freezed.dart';
part 'visitor_gate_in_out.g.dart';

@freezed
abstract class VisitorGateInOut with _$VisitorGateInOut {
  const factory VisitorGateInOut({
    String? username,
    String? name,
    int? idManifest,
    String? gateinDate,
  }) = _VisitorGateInOut;

  factory VisitorGateInOut.fromJson(Map<String, dynamic> json) => _$VisitorGateInOutFromJson(json);
}
