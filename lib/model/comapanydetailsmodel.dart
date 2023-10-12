// To parse this JSON data, do
//
//     final companydetails = companydetailsFromJson(jsonString);

import 'dart:convert';

Companydetails companydetailsFromJson(String str) => Companydetails.fromJson(json.decode(str));

String companydetailsToJson(Companydetails data) => json.encode(data.toJson());

class Companydetails {
  bool? success;
  String? message;
  Data? data;

  Companydetails({
    this.success,
    this.message,
    this.data,
  });

  factory Companydetails.fromJson(Map<String, dynamic> json) => Companydetails(
    success: json["success"],
    message: json["message"],
    data: json["data"] != null ? Data.fromJson(json["data"]) : Data(),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  int? userId;
  String? companyCode;
  String? companyName;
  String? mobileNumber;
  String? companyAddress;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.userId,
    this.companyCode,
    this.companyName,
    this.mobileNumber,
    this.companyAddress,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userId: json["user_id"],
    companyCode: json["company_code"] ?? "",
    companyName: json["company_name"] ?? "",
    mobileNumber: json["mobile_number"] ?? "",
    companyAddress: json["company_address"] ?? "",
    status: json["status"],
    createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime.now(),
    updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "company_code": companyCode,
    "company_name": companyName,
    "mobile_number": mobileNumber,
    "company_address": companyAddress,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
