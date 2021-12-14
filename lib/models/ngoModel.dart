// To parse this JSON data, do
//
//     final ngos = ngosFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<Ngos> ngosFromJson(String str) =>
    List<Ngos>.from(json.decode(str).map((x) => Ngos.fromJson(x)));

String ngosToJson(List<Ngos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ngos {
  Ngos({
    required this.ngoId,
    required this.ngoName,
    required this.email,
    required this.password,
    required this.address,
    required this.contact,
    required this.storage,
    required this.city,
  });

  String ngoId;
  String ngoName;
  String email;
  String password;
  String address;
  String contact;
  String storage;
  String city;

  factory Ngos.fromJson(Map<String, dynamic> json) => Ngos(
        ngoId: json["ngo_id"] as String,
        ngoName: json["ngo_name"] as String,
        email: json["email"] as String,
        password: json["password"] as String,
        address: json["address"] as String,
        contact: json["contact"] as String,
        storage: json["storage"],
        city: json["city"] as String,
      );

  Map<String, dynamic> toJson() => {
        "ngo_id": ngoId,
        "ngo_name": ngoName,
        "email": email,
        "password": password,
        "address": address,
        "contact": contact,
        "storage": storage,
        "city": city,
      };
}
