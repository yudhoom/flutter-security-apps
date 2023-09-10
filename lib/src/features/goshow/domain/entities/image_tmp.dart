// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_tmp.freezed.dart';
part 'image_tmp.g.dart';

@freezed
abstract class ImageTmp with _$ImageTmp {
  const factory ImageTmp({
    @JsonKey(name: 'image_profile_url') String? imageProfileUrl,
    @JsonKey(name: 'image_location') String? imageLocation,
    @JsonKey(name: 'mime_type') String? mimeType,
  }) = _ImageTmp;

  factory ImageTmp.fromJson(Map<String, dynamic> json) => _$ImageTmpFromJson(json);
}
