// To parse this JSON data, do
//
//     final pdfIdModel = pdfIdModelFromJson(jsonString);

import 'dart:convert';

PdfIdModel pdfIdModelFromJson(String str) => PdfIdModel.fromJson(json.decode(str));

String pdfIdModelToJson(PdfIdModel data) => json.encode(data.toJson());

class PdfIdModel {
  String? message;
  String? filePath;
  // UsersData? data;

  PdfIdModel({
    this.message,
    this.filePath,
    // this.data,
  });

  factory PdfIdModel.fromJson(Map<String, dynamic> json) => PdfIdModel(
    message: json["message"].toString(),
    filePath: json["file_path"].toString(),
    // data: json["Data"] == null ? null : UsersData.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "file_path": filePath,
    // "Data": data?.toJson(),
  };
}

class UsersData {
  int? id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  dynamic companyId;
  String? passwordShow;
  dynamic token;
  int? isAdmin;
  int? status;
  int? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  UsersData({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.companyId,
    this.passwordShow,
    this.token,
    this.isAdmin,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    companyId: json["company_id"],
    passwordShow: json["password_show"],
    token: json["token"],
    isAdmin: json["is_admin"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "company_id": companyId,
    "password_show": passwordShow,
    "token": token,
    "is_admin": isAdmin,
    "status": status,
    "is_deleted": isDeleted,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
