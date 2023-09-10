// To parse this JSON data, do
//
//     final visitorDetail = visitorDetailFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'visitor_detail.freezed.dart';
part 'visitor_detail.g.dart';

@freezed
abstract class VisitorDetail with _$VisitorDetail {
  const factory VisitorDetail({
    @JsonKey(name: 'image_profile_url') String? imageProfileUrl,
    @JsonKey(name: 'user_border_color') String? userBorderColor,
    @JsonKey(name: 'id_gate_stat') int? idGateStat,
    @JsonKey(name: 'gate_stat') String? gateStat,
    @JsonKey(name: 'gate_stat_desc') String? gateStatDesc,
    @JsonKey(name: 'gate_time_display') String? gateTimeDisplay,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'id_card_number') dynamic idCardNumber,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'gender_code') String? genderCode,
    @JsonKey(name: 'gendername') String? gendername,
    @JsonKey(name: 'visitor_type_desc') String? visitorTypeDesc,
    @JsonKey(name: 'id_request_type') int? idRequestType,
    @JsonKey(name: 'request_type_desc') String? requestTypeDesc,
    @JsonKey(name: 'gatein_date') String? gateinDate,
    @JsonKey(name: 'gateout_date') dynamic gateoutDate,
    @JsonKey(name: 'valid_start_date') String? validStartDate,
    @JsonKey(name: 'valid_end_date') String? validEndDate,
    @JsonKey(name: 'is_ots') String? isOts,
    @JsonKey(name: 'is_expired') String? isExpired,
    @JsonKey(name: 'id_emp_type') int? idEmpType,
    @JsonKey(name: 'id_access_type') int? idAccessType,
  }) = _VisitorDetail;

  factory VisitorDetail.fromJson(Map<String, dynamic> json) => _$VisitorDetailFromJson(json);
}
