import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jtlc_front/src/features/qr_scan/domain/model/qr_event.dart';

part 'qr_event_model.freezed.dart';
part 'qr_event_model.g.dart';

@freezed
abstract class QrEventModel with _$QrEventModel {
  const factory QrEventModel({
    int? status,
    String? message,
    QrEvent? data,
  }) = _QrEventModel;

  factory QrEventModel.fromJson(Map<String, dynamic> json) => _$QrEventModelFromJson(json);
}
