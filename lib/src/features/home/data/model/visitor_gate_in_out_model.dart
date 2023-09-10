// To parse this JSON data, do
//
//     final visitorGateInOutModel = visitorGateInOutModelFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/visitor_gate_in_out.dart';

part 'visitor_gate_in_out_model.freezed.dart';
part 'visitor_gate_in_out_model.g.dart';

@freezed
abstract class VisitorGateInOutModel with _$VisitorGateInOutModel {
  const factory VisitorGateInOutModel({
    VisitorGateInOut? data,
    int? status,
    String? message,
  }) = _VisitorGateInOutModel;

  factory VisitorGateInOutModel.fromJson(Map<String, dynamic> json) => _$VisitorGateInOutModelFromJson(json);
}
