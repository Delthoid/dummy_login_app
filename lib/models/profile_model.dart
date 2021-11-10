// To parse this JSON data, do
//
//     final profileModel = profileModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileModel profileModelFromMap(String str) =>
    ProfileModel.fromMap(json.decode(str));

String profileModelToMap(ProfileModel data) => json.encode(data.toMap());

class ProfileModel {
  ProfileModel({
    required this.data,
    required this.support,
  });

  final Data data;
  final Support support;

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
        data: Data.fromMap(json["data"]),
        support: Support.fromMap(json["support"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
        "support": support.toMap(),
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  Support({
    required this.url,
    required this.text,
  });

  final String url;
  final String text;

  factory Support.fromMap(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "text": text,
      };
}
