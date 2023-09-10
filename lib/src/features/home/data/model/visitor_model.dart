import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jtlc_front/src/features/home/domain/entity/visitor_total.dart';

part 'visitor_model.freezed.dart';
part 'visitor_model.g.dart';

@freezed
abstract class VisitorModel with _$VisitorModel {
  const factory VisitorModel({
    int? status,
    VisitorTotal? data,
    String? message,
  }) = _VisitorModel;

  factory VisitorModel.fromJson(Map<String, dynamic> json) => _$VisitorModelFromJson(json);
}
