import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/image_tmp.dart';

part 'image_tmp_model.freezed.dart';
part 'image_tmp_model.g.dart';

@freezed
abstract class ImageTmpModel with _$ImageTmpModel {
  const factory ImageTmpModel({
    int? status,
    ImageTmp? data,
    String? message,
  }) = _ImageTmpModel;

  factory ImageTmpModel.fromJson(Map<String, dynamic> json) => _$ImageTmpModelFromJson(json);
}
