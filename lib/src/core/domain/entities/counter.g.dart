// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Counter _$$_CounterFromJson(Map<String, dynamic> json) => _$_Counter(
      expectedGuest: json['expected_guest'] as int?,
      expectedRegular: json['expected_regular'] as int?,
      expectedVip: json['expected_vip'] as int?,
      realVisitor: json['real_visitor'] as int?,
      jtlcAll: json['jtlc_all'] as int?,
      jtlcEmployee: json['jtlc_employee'] as int?,
      jtlcExternal: json['jtlc_external'] as int?,
      jtlcGuest: json['jtlc_guest'] as int?,
      jtlcInternal: json['jtlc_internal'] as int?,
      jtlcVip: json['jtlc_vip'] as int?,
    );

Map<String, dynamic> _$$_CounterToJson(_$_Counter instance) =>
    <String, dynamic>{
      'expected_guest': instance.expectedGuest,
      'expected_regular': instance.expectedRegular,
      'expected_vip': instance.expectedVip,
      'real_visitor': instance.realVisitor,
      'jtlc_all': instance.jtlcAll,
      'jtlc_employee': instance.jtlcEmployee,
      'jtlc_external': instance.jtlcExternal,
      'jtlc_guest': instance.jtlcGuest,
      'jtlc_internal': instance.jtlcInternal,
      'jtlc_vip': instance.jtlcVip,
    };
