// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VisitorDetail _$$_VisitorDetailFromJson(Map<String, dynamic> json) =>
    _$_VisitorDetail(
      imageProfileUrl: json['image_profile_url'] as String?,
      userBorderColor: json['user_border_color'] as String?,
      idGateStat: json['id_gate_stat'] as int?,
      gateStat: json['gate_stat'] as String?,
      gateStatDesc: json['gate_stat_desc'] as String?,
      gateTimeDisplay: json['gate_time_display'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      idCardNumber: json['id_card_number'],
      companyName: json['company_name'] as String?,
      genderCode: json['gender_code'] as String?,
      gendername: json['gendername'] as String?,
      visitorTypeDesc: json['visitor_type_desc'] as String?,
      idRequestType: json['id_request_type'] as int?,
      requestTypeDesc: json['request_type_desc'] as String?,
      gateinDate: json['gatein_date'] as String?,
      gateoutDate: json['gateout_date'],
      validStartDate: json['valid_start_date'] as String?,
      validEndDate: json['valid_end_date'] as String?,
      isOts: json['is_ots'] as String?,
      isExpired: json['is_expired'] as String?,
      idEmpType: json['id_emp_type'] as int?,
      idAccessType: json['id_access_type'] as int?,
    );

Map<String, dynamic> _$$_VisitorDetailToJson(_$_VisitorDetail instance) =>
    <String, dynamic>{
      'image_profile_url': instance.imageProfileUrl,
      'user_border_color': instance.userBorderColor,
      'id_gate_stat': instance.idGateStat,
      'gate_stat': instance.gateStat,
      'gate_stat_desc': instance.gateStatDesc,
      'gate_time_display': instance.gateTimeDisplay,
      'name': instance.name,
      'username': instance.username,
      'phone': instance.phone,
      'id_card_number': instance.idCardNumber,
      'company_name': instance.companyName,
      'gender_code': instance.genderCode,
      'gendername': instance.gendername,
      'visitor_type_desc': instance.visitorTypeDesc,
      'id_request_type': instance.idRequestType,
      'request_type_desc': instance.requestTypeDesc,
      'gatein_date': instance.gateinDate,
      'gateout_date': instance.gateoutDate,
      'valid_start_date': instance.validStartDate,
      'valid_end_date': instance.validEndDate,
      'is_ots': instance.isOts,
      'is_expired': instance.isExpired,
      'id_emp_type': instance.idEmpType,
      'id_access_type': instance.idAccessType,
    };
