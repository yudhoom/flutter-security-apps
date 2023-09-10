import 'dart:convert';

class VisitorInput {
  VisitorInput({
    this.idAccessType,
    this.idEmpType,
    this.username,
    this.phone,
    this.name,
    this.idEvent,
    this.idManifest,
    this.idGateStat,
    this.isExpired,
  });

  int? idAccessType;
  int? idEmpType;
  String? username;
  String? phone;
  String? name;
  int? idEvent;
  int? idManifest;
  int? idGateStat;
  String? isExpired;

  VisitorInput copyWith({
    int? idAccessType,
    int? idEmpType,
    String? username,
    String? phone,
    String? name,
    int? idEvent,
    int? idManifest,
    int? idGateStat,
    String? isExpired,
  }) =>
      VisitorInput(
        idAccessType: idAccessType ?? this.idAccessType,
        idEmpType: idEmpType ?? this.idEmpType,
        username: username ?? this.username,
        phone: phone ?? this.phone,
        name: name ?? this.name,
        idEvent: idEvent ?? this.idEvent,
        idManifest: idManifest ?? this.idManifest,
        idGateStat: idGateStat ?? this.idGateStat,
        isExpired: isExpired ?? this.isExpired,
      );

  factory VisitorInput.fromJson(String str) => VisitorInput.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VisitorInput.fromMap(Map<String, dynamic> json) => VisitorInput(
        idAccessType: json["id_access_type"],
        idEmpType: json["id_emp_type"],
        username: json["username"],
        phone: json["phone"],
        name: json["name"],
        idEvent: json["id_event"],
        idManifest: json["id_manifest"],
        idGateStat: json["id_gate_stat"],
        isExpired: json["is_expired"],
      );

  Map<String, dynamic> toMap() => {
        "id_access_type": idAccessType,
        "id_emp_type": idEmpType,
        "username": username,
        "phone": phone,
        "name": name,
        "id_event": idEvent,
        "id_manifest": idManifest,
        "id_gate_stat": idGateStat,
        "is_expired": isExpired,
      };
}
