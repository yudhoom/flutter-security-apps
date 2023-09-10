// To parse this JSON data, do
//
//     final visitorTotal = visitorTotalFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:jtlc_front/src/features/home/domain/entity/visitor.dart';

part 'visitor_total.freezed.dart';
part 'visitor_total.g.dart';

@freezed
abstract class VisitorTotal with _$VisitorTotal {
  const factory VisitorTotal({
    @JsonKey(name: 'total_visitor') int? totalVisitor,
    @JsonKey(name: 'visitors') List<Visitor>? visitors,
  }) = _VisitorTotal;

  factory VisitorTotal.fromJson(Map<String, dynamic> json) => _$VisitorTotalFromJson(json);
}
