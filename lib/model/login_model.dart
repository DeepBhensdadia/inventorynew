// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  bool? success;
  Data? data;
  String? message;

  Login({
    this.success,
    this.data,
    this.message,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        success: json["success"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : Data(),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  String? token;
  String? name;
  int? id;
  String? mobileNumber;
  String? roleDesignation;
  int? status;
  int? isallowedtoedit;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.token,
    this.name,
    this.id,
    this.mobileNumber,
    this.roleDesignation,
    this.status,
    this.email,
    this.isallowedtoedit,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        name: json["name"],
        id: json["id"],
        mobileNumber: json["mobile_number"],
        roleDesignation: json["role_designation"],
        status: json["status"],
        email: json["email"],
        isallowedtoedit: json["is_allowed_to_edit"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "id": id,
        "mobile_number": mobileNumber,
        "role_designation": roleDesignation,
        "status": status,
        "email": email,
        "is_allowed_to_edit": isallowedtoedit,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
