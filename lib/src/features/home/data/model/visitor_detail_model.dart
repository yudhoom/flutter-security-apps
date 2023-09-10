// To parse this JSON data, do
//
//     final visitorDetailModel = visitorDetailModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jtlc_front/src/features/home/domain/entity/visitor_detail.dart';

part 'visitor_detail_model.freezed.dart';
part 'visitor_detail_model.g.dart';

@freezed
abstract class VisitorDetailModel with _$VisitorDetailModel {
  const factory VisitorDetailModel({
    int? status,
    VisitorDetail? data,
    String? message,
  }) = _VisitorDetailModel;

  factory VisitorDetailModel.fromJson(Map<String, dynamic> json) => _$VisitorDetailModelFromJson(json);
}
