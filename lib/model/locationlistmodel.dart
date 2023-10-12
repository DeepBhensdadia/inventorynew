// To parse this JSON data, do
//
//     final locationlistcompany = locationlistcompanyFromJson(jsonString);

import 'dart:convert';

Locationlistcompany locationlistcompanyFromJson(String str) => Locationlistcompany.fromJson(json.decode(str));

String locationlistcompanyToJson(Locationlistcompany data) => json.encode(data.toJson());

class Locationlistcompany {
  bool? success;
  String? message;
  List<Datum>? data;

  Locationlistcompany({
    this.success,
    this.message,
    this.data,
  });

  factory Locationlistcompany.fromJson(Map<String, dynamic> json) => Locationlistcompany(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  int? companyId;
  String? locationCode;
  String? locationName;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.companyId,
    this.locationCode,
    this.locationName,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    companyId: json["company_id"],
    locationCode: json["location_code"],
    locationName: json["location_name"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "location_code": locationCode,
    "location_name": locationName,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
