import 'package:freezed_annotation/freezed_annotation.dart';

part 'gate_in_karyawan_tamu.freezed.dart';
part 'gate_in_karyawan_tamu.g.dart';

@freezed
abstract class GateInKaryawanTamu with _$GateInKaryawanTamu {
  const factory GateInKaryawanTamu({
    int? idEvent,
  }) = _GateInKaryawanTamu;

  factory GateInKaryawanTamu.fromJson(Map<String, dynamic> json) => _$GateInKaryawanTamuFromJson(json);
}
