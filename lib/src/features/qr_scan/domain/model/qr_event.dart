// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_event.freezed.dart';
part 'qr_event.g.dart';

@freezed
abstract class QrEvent with _$QrEvent {
  const factory QrEvent({
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'company') String? company,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'photo') String? photo,
    @JsonKey(name: 'visitor_category') String? visitorCategory,
    @JsonKey(name: 'id_event') int? idEvent,
    @JsonKey(name: 'id_manifest') int? idManifest,
  }) = _QrEvent;

  factory QrEvent.fromJson(Map<String, dynamic> json) => _$QrEventFromJson(json);
}
