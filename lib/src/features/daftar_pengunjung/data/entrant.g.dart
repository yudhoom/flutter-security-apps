// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Entrant _$$_EntrantFromJson(Map<String, dynamic> json) => _$_Entrant(
      idParticipant: json['id_participant'] as int?,
      username: json['username'] as String?,
      idEmpType: json['id_emp_type'] as String?,
      gendercode: json['gendercode'] as String?,
      gendername: json['gendername'] as String?,
      phone: json['phone'],
      name: json['name'] as String?,
      grade: json['grade'] as String?,
      compcode: json['compcode'] as String?,
      compcodename: json['compcodename'] as String?,
      persareacode: json['persareacode'] as String?,
      persareaname: json['persareaname'] as String?,
      perssubareacode: json['perssubareacode'] as String?,
      perssubareaname: json['perssubareaname'] as String?,
      isStay: json['is_stay'] as String?,
      isStayDesc: json['is_stay_desc'] as String?,
      spvEmpid: json['spv_empid'] as String?,
      spvEmpname: json['spv_empname'] as String?,
      gateInGateOut: json['gate_in_gate_out'] as String?,
      isOnTheSpot: json['is_on_the_spot'] as bool?,
      emailAddress: json['email_address'] as String?,
      imageAvailable: json['image_available'] as bool?,
      imageProfileUrl: json['image_profile_url'] as String?,
    );

Map<String, dynamic> _$$_EntrantToJson(_$_Entrant instance) =>
    <String, dynamic>{
      'id_participant': instance.idParticipant,
      'username': instance.username,
      'id_emp_type': instance.idEmpType,
      'gendercode': instance.gendercode,
      'gendername': instance.gendername,
      'phone': instance.phone,
      'name': instance.name,
      'grade': instance.grade,
      'compcode': instance.compcode,
      'compcodename': instance.compcodename,
      'persareacode': instance.persareacode,
      'persareaname': instance.persareaname,
      'perssubareacode': instance.perssubareacode,
      'perssubareaname': instance.perssubareaname,
      'is_stay': instance.isStay,
      'is_stay_desc': instance.isStayDesc,
      'spv_empid': instance.spvEmpid,
      'spv_empname': instance.spvEmpname,
      'gate_in_gate_out': instance.gateInGateOut,
      'is_on_the_spot': instance.isOnTheSpot,
      'email_address': instance.emailAddress,
      'image_available': instance.imageAvailable,
      'image_profile_url': instance.imageProfileUrl,
    };
