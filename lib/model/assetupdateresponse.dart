// To parse this JSON data, do
//
//     final assetresponsemodel = assetresponsemodelFromJson(jsonString);

import 'dart:convert';

Assetresponsemodel assetresponsemodelFromJson(String str) => Assetresponsemodel.fromJson(json.decode(str));

String assetresponsemodelToJson(Assetresponsemodel data) => json.encode(data.toJson());

class Assetresponsemodel {
  int? status;
  String? massage;

  Assetresponsemodel({
    this.status,
    this.massage,
  });

  factory Assetresponsemodel.fromJson(Map<String, dynamic> json) => Assetresponsemodel(
    status: json["status"],
    massage: json["massage"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "massage": massage,
  };
}
