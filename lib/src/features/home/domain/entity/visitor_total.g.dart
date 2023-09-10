// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VisitorTotal _$$_VisitorTotalFromJson(Map<String, dynamic> json) =>
    _$_VisitorTotal(
      totalVisitor: json['total_visitor'] as int?,
      visitors: (json['visitors'] as List<dynamic>?)
          ?.map((e) => Visitor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VisitorTotalToJson(_$_VisitorTotal instance) =>
    <String, dynamic>{
      'total_visitor': instance.totalVisitor,
      'visitors': instance.visitors,
    };
