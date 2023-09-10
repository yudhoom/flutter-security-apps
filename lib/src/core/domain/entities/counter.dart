// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

@freezed
abstract class Counter with _$Counter {
  const factory Counter({
    @JsonKey(name: 'expected_guest') int? expectedGuest,
    @JsonKey(name: 'expected_regular') int? expectedRegular,
    @JsonKey(name: 'expected_vip') int? expectedVip,
    @JsonKey(name: 'real_visitor') int? realVisitor,
    @JsonKey(name: 'jtlc_all') int? jtlcAll,
    @JsonKey(name: 'jtlc_employee') int? jtlcEmployee,
    @JsonKey(name: 'jtlc_external') int? jtlcExternal,
    @JsonKey(name: 'jtlc_guest') int? jtlcGuest,
    @JsonKey(name: 'jtlc_internal') int? jtlcInternal,
    @JsonKey(name: 'jtlc_vip') int? jtlcVip,
  }) = _Counter;

  factory Counter.fromJson(Map<String, dynamic> json) => _$CounterFromJson(json);
}
