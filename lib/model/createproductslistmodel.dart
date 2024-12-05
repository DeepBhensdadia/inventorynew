// To parse this JSON data, do
//
//     final createproducthistoryresponsemodel = createproducthistoryresponsemodelFromJson(jsonString);

import 'dart:convert';

Createproducthistoryresponsemodel createproducthistoryresponsemodelFromJson(
        String str) =>
    Createproducthistoryresponsemodel.fromJson(json.decode(str));

String createproducthistoryresponsemodelToJson(
        Createproducthistoryresponsemodel data) =>
    json.encode(data.toJson());

class Createproducthistoryresponsemodel {
  bool? success;
  String? message;
  List<Datum>? data;

  Createproducthistoryresponsemodel({
    this.success,
    this.message,
    this.data,
  });

  factory Createproducthistoryresponsemodel.fromJson(
          Map<String, dynamic> json) =>
      Createproducthistoryresponsemodel(
        success: json["success"],
        message: json["message"] ?? "",
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
  int? userId;
  int? companyId;
  String? sheetNumber;
  String? productDate;
  String? location;
  String? subLocation;
  String? itemCode;
  String? productCode;
  String? asset;
  String? photo;
  String? remark;
  String? mainCategory;
  String? category;
  String? quantity;
  String? uom;
  String? availableQuantity;
  int? status;
  int? isEdited;
  String? createdAt;
  DateTime? updatedAt;
  int? updateStatus;
  String? locationCode;
  String? locationName;

  Datum({
    this.id,
    this.userId,
    this.companyId,
    this.sheetNumber,
    this.productDate,
    this.location,
    this.subLocation,
    this.itemCode,
    this.productCode,
    this.asset,
    this.photo,
    this.remark,
    this.mainCategory,
    this.category,
    this.quantity,
    this.uom,
    this.availableQuantity,
    this.status,
    this.isEdited,
    this.createdAt,
    this.updatedAt,
    this.updateStatus,
    this.locationCode,
    this.locationName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? 0,
        companyId: json["company_id"] ?? 0,
        sheetNumber: json["sheet_number"] ?? "",
        productDate: json["product_date"] ?? "",
        location: json["location"] ?? "",
        subLocation: json["sub_location"] ?? "",
        itemCode: json["item_code"] ?? "",
        productCode: json["product_code"] ?? "",
        asset: json["asset"] ?? "",
        photo: json["photo"] ?? "",
        remark: json["remark"] ?? "",
        mainCategory: json["main_category"] ?? "",
        category: json["category"] ?? "",
        quantity: json["quantity"] ?? "",
        uom: json["uom"] ?? "",
        availableQuantity: json["available_quantity"] ?? "",
        status: json["status"] ?? 0,
        isEdited: json["is_edited"] ?? 0,
        createdAt: json["created_at"],
        updatedAt:
            DateTime.parse(json["updated_at"] ?? DateTime.now().toString()),
        updateStatus: json["update_status"] ?? "0",
        locationCode: json["location_code"] ?? "",
        locationName: json["location_name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "company_id": companyId,
        "sheet_number": sheetNumber,
        "product_date": productDate,
        "location": location,
        "sub_location": subLocation,
        "item_code": itemCode,
        "product_code": productCode,
        "asset": asset,
        "photo": photo,
        "remark": remark,
        "main_category": mainCategory,
        "category": category,
        "quantity": quantity,
        "uom": uom,
        "available_quantity": availableQuantity,
        "status": status,
        "is_edited": isEdited,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "update_status": updateStatus,
        "location_code": locationCode,
        "location_name": locationName,
      };
}
