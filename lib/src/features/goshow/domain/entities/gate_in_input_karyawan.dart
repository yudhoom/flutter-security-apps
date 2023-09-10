// To parse this JSON data, do
//
//     final gateInKaryawan = gateInKaryawanFromMap(jsonString);

import 'dart:convert';

GateInInputKaryawan gateInKaryawanFromMap(String str) => GateInInputKaryawan.fromMap(json.decode(str));

String gateInKaryawanToMap(GateInInputKaryawan data) => json.encode(data.toMap());

class GateInInputKaryawan {
  GateInInputKaryawan({
    this.visitor,
    this.username,
  });

  Visitor? visitor;
  String? username;

  GateInInputKaryawan copyWith({
    Visitor? visitor,
    String? username,
  }) =>
      GateInInputKaryawan(
        visitor: visitor ?? this.visitor,
        username: username ?? this.username,
      );

  factory GateInInputKaryawan.fromMap(Map<String, dynamic> json) => GateInInputKaryawan(
        visitor: Visitor.fromMap(json["visitor"]),
        username: json["username"],
      );

  Map<String, dynamic> toMap() => {
        "visitor": visitor?.toMap(),
        "username": username,
      };
}

class Visitor {
  Visitor({
    this.username,
    this.name,
    this.grade,
    this.gendercode,
    this.compcode,
    this.compcodename,
    this.persareacode,
    this.persareaname,
    this.perssubareacode,
    this.perssubareaname,
    this.spvEmpid,
    this.spvEmpname,
    this.imageLocation,
  });

  String? username;
  String? name;
  String? grade;
  String? gendercode;
  String? compcode;
  String? compcodename;
  String? persareacode;
  String? persareaname;
  String? perssubareacode;
  String? perssubareaname;
  String? spvEmpid;
  String? spvEmpname;
  dynamic imageLocation;

  Visitor copyWith({
    String? username,
    String? name,
    String? grade,
    String? gendercode,
    String? compcode,
    String? compcodename,
    String? persareacode,
    String? persareaname,
    String? perssubareacode,
    String? perssubareaname,
    String? spvEmpid,
    String? spvEmpname,
    dynamic imageLocation,
  }) =>
      Visitor(
        username: username ?? this.username,
        name: name ?? this.name,
        grade: grade ?? this.grade,
        gendercode: gendercode ?? this.gendercode,
        compcode: compcode ?? this.compcode,
        compcodename: compcodename ?? this.compcodename,
        persareacode: persareacode ?? this.persareacode,
        persareaname: persareaname ?? this.persareaname,
        perssubareacode: perssubareacode ?? this.perssubareacode,
        perssubareaname: perssubareaname ?? this.perssubareaname,
        spvEmpid: spvEmpid ?? this.spvEmpid,
        spvEmpname: spvEmpname ?? this.spvEmpname,
        imageLocation: imageLocation ?? this.imageLocation,
      );

  factory Visitor.fromMap(Map<String, dynamic> json) => Visitor(
        username: json["username"],
        name: json["name"],
        grade: json["grade"],
        gendercode: json["gendercode"],
        compcode: json["compcode"],
        compcodename: json["compcodename"],
        persareacode: json["persareacode"],
        persareaname: json["persareaname"],
        perssubareacode: json["perssubareacode"],
        perssubareaname: json["perssubareaname"],
        spvEmpid: json["spv_empid"],
        spvEmpname: json["spv_empname"],
        imageLocation: json["image_location"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "name": name,
        "grade": grade,
        "gendercode": gendercode,
        "compcode": compcode,
        "compcodename": compcodename,
        "persareacode": persareacode,
        "persareaname": persareaname,
        "perssubareacode": perssubareacode,
        "perssubareaname": perssubareaname,
        "spv_empid": spvEmpid,
        "spv_empname": spvEmpname,
        "image_location": imageLocation,
      };
}
