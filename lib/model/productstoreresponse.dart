// To parse this JSON data, do
//
//     final productstoreresponsemodel = productstoreresponsemodelFromJson(jsonString);

import 'dart:convert';

Productstoreresponsemodel productstoreresponsemodelFromJson(String str) => Productstoreresponsemodel.fromJson(json.decode(str));

String productstoreresponsemodelToJson(Productstoreresponsemodel data) => json.encode(data.toJson());

class Productstoreresponsemodel {
  bool? success;
  String? message;

  Productstoreresponsemodel({
    this.success,
    this.message,
  });

  factory Productstoreresponsemodel.fromJson(Map<String, dynamic> json) => Productstoreresponsemodel(
    success: json["success"],
    message: json["message"] != "Saved Successfully" ? "The product code has already been taken." : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
