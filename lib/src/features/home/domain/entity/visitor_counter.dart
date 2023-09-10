// To parse this JSON data, do
//
//     final visitorCounter = visitorCounterFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'visitor_counter.freezed.dart';
part 'visitor_counter.g.dart';

@freezed
abstract class VisitorCounter with _$VisitorCounter {
  const factory VisitorCounter({
    @JsonKey(name: 'expected_guest') int? expectedGuest,
    @JsonKey(name: 'expected_vip') int? expectedVip,
    @JsonKey(name: 'expected_regular') int? expectedRegular,
    @JsonKey(name: 'real_visitor') int? realVisitor,
  }) = _VisitorCounter;

  factory VisitorCounter.fromJson(Map<String, dynamic> json) => _$VisitorCounterFromJson(json);
}
