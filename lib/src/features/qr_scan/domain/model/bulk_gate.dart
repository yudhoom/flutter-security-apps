// To parse this JSON data, do
//
//     final bulkGate = bulkGateFromJson(jsonString);

import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

BulkGate bulkGateFromJson(String str) => BulkGate.fromJson(json.decode(str));

String bulkGateToJson(BulkGate data) => json.encode(data.toJson());

class BulkGate {
  BulkGate({
    // this.actionType,
    this.securityUsername,
    this.driverName,
    this.driverGender,
    this.driverPhoto,
    this.visitors,
  });

  // String? actionType;
  String? securityUsername;
  String? driverName;
  int? driverGender;
  String? driverPhoto;
  List<Visitors>? visitors;

  BulkGate copyWith({
    // String? actionType,
    String? securityUsername,
    String? driverName,
    int? driverGender,
    String? driverPhoto,
    List<Visitors>? visitors,
  }) =>
      BulkGate(
        // actionType: actionType ?? this.actionType,
        securityUsername: securityUsername ?? this.securityUsername,
        driverName: driverName ?? this.driverName,
        driverGender: driverGender ?? this.driverGender,
        driverPhoto: driverPhoto ?? this.driverPhoto,
        visitors: visitors ?? this.visitors,
      );

  factory BulkGate.fromJson(String str) => BulkGate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BulkGate.fromMap(Map<String, dynamic> json) => BulkGate(
        // actionType: json["action_type"],
        securityUsername: json["security_username"],
        driverName: json["driver_name"],
        driverGender: json["driver_gender"],
        driverPhoto: json["driver_photo"],
        visitors: List<Visitors>.from(json["visitors"].map((x) => Visitors.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        // "action_type": actionType,
        "security_username": securityUsername,
        "driver_name": driverName,
        "driver_gender": driverGender,
        "driver_photo": driverPhoto,
        "visitors": List<dynamic>.from(visitors!.map((x) => x.toJson())),
      };
}

class Visitors {
  Visitors({
    this.username,
  });

  String? username;

  factory Visitors.fromJson(Map<String, dynamic> json) => Visitors(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}

final bulkGateProvider = StateProvider<BulkGate>((ref) {
  return BulkGate();
});
