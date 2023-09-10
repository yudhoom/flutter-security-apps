import 'dart:convert';

GateInInputTamu gateInInputTamuFromMap(String str) => GateInInputTamu.fromMap(json.decode(str));

String gateInInputTamuToMap(GateInInputTamu data) => json.encode(data.toMap());

class GateInInputTamu {
  GateInInputTamu({
    this.visitor,
    this.organizer,
    this.username,
  });

  Visitor? visitor;
  Organizer? organizer;
  String? username;

  GateInInputTamu copyWith({
    Visitor? visitor,
    Organizer? organizer,
    String? username,
  }) =>
      GateInInputTamu(
        visitor: visitor ?? this.visitor,
        organizer: organizer ?? this.organizer,
        username: username ?? this.username,
      );

  factory GateInInputTamu.fromMap(Map<String, dynamic> json) => GateInInputTamu(
        visitor: Visitor?.fromMap(json["visitor"]),
        organizer: Organizer?.fromMap(json["organizer"]),
        username: json["username"],
      );

  Map<String, dynamic> toMap() => {
        "visitor": visitor?.toMap(),
        "organizer": organizer?.toMap(),
        "username": username,
      };
}

class Organizer {
  Organizer({
    this.username,
    this.name,
    this.gendercode,
    this.compcodename,
    this.persareaname,
    this.perssubareaname,
    this.spvEmpid,
  });

  String? username;
  String? name;
  String? gendercode;
  String? compcodename;
  String? persareaname;
  String? perssubareaname;
  String? spvEmpid;

  Organizer copyWith({
    String? username,
    String? name,
    String? gendercode,
    String? compcodename,
    String? persareaname,
    String? perssubareaname,
    String? spvEmpid,
  }) =>
      Organizer(
        username: username ?? this.username,
        name: name ?? this.name,
        gendercode: gendercode ?? this.gendercode,
        compcodename: compcodename ?? this.compcodename,
        persareaname: persareaname ?? this.persareaname,
        perssubareaname: perssubareaname ?? this.perssubareaname,
        spvEmpid: spvEmpid ?? this.spvEmpid,
      );

  factory Organizer.fromMap(Map<String, dynamic> json) => Organizer(
        username: json["username"],
        name: json["name"],
        gendercode: json["gendercode"],
        compcodename: json["compcodename"],
        persareaname: json["persareaname"],
        perssubareaname: json["perssubareaname"],
        spvEmpid: json["spv_empid"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "name": name,
        "gendercode": gendercode,
        "compcodename": compcodename,
        "persareaname": persareaname,
        "perssubareaname": perssubareaname,
        "spv_empid": spvEmpid,
      };
}

class Visitor {
  Visitor({
    this.phoneNumber,
    this.name,
    this.gendercode,
    this.idCardNumber,
    this.companyName,
    this.imageLocation,
  });

  String? phoneNumber;
  String? name;
  String? gendercode;
  String? idCardNumber;
  String? companyName;
  String? imageLocation;

  Visitor copyWith({
    String? phoneNumber,
    String? name,
    String? gendercode,
    String? idCardNumber,
    String? companyName,
    String? imageLocation,
  }) =>
      Visitor(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        name: name ?? this.name,
        gendercode: gendercode ?? this.gendercode,
        idCardNumber: idCardNumber ?? this.idCardNumber,
        companyName: companyName ?? this.companyName,
        imageLocation: imageLocation ?? this.imageLocation,
      );

  factory Visitor.fromMap(Map<String, dynamic> json) => Visitor(
        phoneNumber: json["phone_number"],
        name: json["name"],
        gendercode: json["gendercode"],
        idCardNumber: json["id_card_number"],
        companyName: json["company_name"],
        imageLocation: json["image_location"],
      );

  Map<String, dynamic> toMap() => {
        "phone_number": phoneNumber,
        "name": name,
        "gendercode": gendercode,
        "id_card_number": idCardNumber,
        "company_name": companyName,
        "image_location": imageLocation,
      };
}
