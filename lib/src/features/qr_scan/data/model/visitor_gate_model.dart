import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:jtlc_front/src/features/qr_scan/domain/model/visitor_gate.dart';

part 'visitor_gate_model.freezed.dart';
part 'visitor_gate_model.g.dart';

@freezed
abstract class VisitorGateModel with _$VisitorGateModel {
  const factory VisitorGateModel({
    int? status,
    VisitorGate? data,
    String? message,
  }) = _VisitorGateModel;

  factory VisitorGateModel.fromJson(Map<String, dynamic> json) => _$VisitorGateModelFromJson(json);
}
