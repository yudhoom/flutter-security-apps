// To parse this JSON data, do
//
//     final visitorCounterModel = visitorCounterModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/visitor_counter.dart';

part 'visitor_counter_model.freezed.dart';
part 'visitor_counter_model.g.dart';

@freezed
abstract class VisitorCounterModel with _$VisitorCounterModel {
  const factory VisitorCounterModel({
    int? status,
    VisitorCounter? data,
    String? message,
  }) = _VisitorCounterModel;

  factory VisitorCounterModel.fromJson(Map<String, dynamic> json) => _$VisitorCounterModelFromJson(json);
}
