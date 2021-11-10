// To parse this JSON data, do
//
//     final errorMsgModel = errorMsgModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ErrorMsgModel errorMsgModelFromMap(String str) =>
    ErrorMsgModel.fromMap(json.decode(str));

String errorMsgModelToMap(ErrorMsgModel data) => json.encode(data.toMap());

class ErrorMsgModel {
  ErrorMsgModel({
    required this.error,
  });

  final String error;

  factory ErrorMsgModel.fromMap(Map<String, dynamic> json) => ErrorMsgModel(
        error: json["error"],
      );

  Map<String, dynamic> toMap() => {
        "error": error,
      };
}
