// To parse this JSON data, do
//
//     final gateInModel = gateInModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/gate_in_karyawan_tamu.dart';

part 'gate_in_model.freezed.dart';
part 'gate_in_model.g.dart';

@freezed
abstract class GateInModel with _$GateInModel {
  const factory GateInModel({
    int? status,
    GateInKaryawanTamu? data,
    String? message,
  }) = _GateInModel;

  factory GateInModel.fromJson(Map<String, dynamic> json) => _$GateInModelFromJson(json);
}
