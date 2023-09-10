// To parse this JSON data, do
//
//     final participantType = participantTypeFromJson(jsonString);

import 'dart:convert';

class ParticipantType {
  ParticipantType({
    required this.idParticipantType,
    required this.idActvStat,
    required this.value,
    required this.descId,
    required this.descEn,
  });

  int idParticipantType;
  int idActvStat;
  String value;
  String descId;
  String descEn;

  ParticipantType copyWith({
    int? idParticipantType,
    int? idActvStat,
    String? value,
    String? descId,
    String? descEn,
  }) =>
      ParticipantType(
        idParticipantType: idParticipantType ?? this.idParticipantType,
        idActvStat: idActvStat ?? this.idActvStat,
        value: value ?? this.value,
        descId: descId ?? this.descId,
        descEn: descEn ?? this.descEn,
      );

  factory ParticipantType.fromRawJson(String str) => ParticipantType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParticipantType.fromJson(Map<String, dynamic> json) => ParticipantType(
        idParticipantType: json["id_participant_type"],
        idActvStat: json["id_actv_stat"],
        value: json["value"],
        descId: json["desc_id"],
        descEn: json["desc_en"],
      );

  Map<String, dynamic> toJson() => {
        "id_participant_type": idParticipantType,
        "id_actv_stat": idActvStat,
        "value": value,
        "desc_id": descId,
        "desc_en": descEn,
      };
}
