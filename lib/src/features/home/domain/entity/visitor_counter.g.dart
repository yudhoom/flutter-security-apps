// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_counter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VisitorCounter _$$_VisitorCounterFromJson(Map<String, dynamic> json) =>
    _$_VisitorCounter(
      expectedGuest: json['expected_guest'] as int?,
      expectedVip: json['expected_vip'] as int?,
      expectedRegular: json['expected_regular'] as int?,
      realVisitor: json['real_visitor'] as int?,
    );

Map<String, dynamic> _$$_VisitorCounterToJson(_$_VisitorCounter instance) =>
    <String, dynamic>{
      'expected_guest': instance.expectedGuest,
      'expected_vip': instance.expectedVip,
      'expected_regular': instance.expectedRegular,
      'real_visitor': instance.realVisitor,
    };
