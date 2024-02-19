// To parse this JSON data, do
//
//     final producerModel = producerModelFromJson(jsonString);

import 'dart:convert';

ProducerModel producerModelFromJson(String str) => ProducerModel.fromJson(json.decode(str));

String producerModelToJson(ProducerModel data) => json.encode(data.toJson());

class ProducerModel {
  String id;
  String name;
  String email;
  String? telephone;
  String? picture;
  String whereToFind;
  double latitude;
  double longitude;
  int ratingsAvg;
  int ratingsCount;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  ProducerModel({
    required this.id,
    required this.name,
    required this.email,
    required this.telephone,
    required this.picture,
    required this.whereToFind,
    required this.latitude,
    required this.longitude,
    required this.ratingsAvg,
    required this.ratingsCount,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory ProducerModel.fromJson(Map<String, dynamic> json) => ProducerModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    telephone: json["telephone"],
    picture: json["picture"]?["url"],
    whereToFind: json["whereToFind"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    ratingsAvg: json["ratingsAvg"],
    ratingsCount: json["ratingsCount"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "telephone": telephone,
    "picture": picture,
    "whereToFind": whereToFind,
    "latitude": latitude,
    "longitude": longitude,
    "ratingsAvg": ratingsAvg,
    "ratingsCount": ratingsCount,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}
