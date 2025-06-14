// To parse this JSON data, do
//
//     final productsdetails = productsdetailsFromJson(jsonString);

import 'dart:convert';

Productsdetails productsdetailsFromJson(String str) =>
    Productsdetails.fromJson(json.decode(str));

String productsdetailsToJson(Productsdetails data) =>
    json.encode(data.toJson());

class Productsdetails {
  bool? success;
  String? message;
  Product? data;

  Productsdetails({
    this.success,
    this.message,
    this.data,
  });

  factory Productsdetails.fromJson(Map<String, dynamic> json) =>
      Productsdetails(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Product.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Product {
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
  dynamic assetno;
  String? serial;
  String? photo;
  String? remark;
  String? mainCategory;
  String? category;
  String? quantity;
  String? uom;
  String? availableQuantity;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? updateStatus;
  List<String>? photos;
  Locations? locations;

  Product({
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
    this.assetno,
    this.serial,
    this.photo,
    this.remark,
    this.mainCategory,
    this.category,
    this.quantity,
    this.uom,
    this.availableQuantity,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.updateStatus,
    this.photos,
    this.locations,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        userId: json["user_id"],
        companyId: json["company_id"],
        sheetNumber: json["sheet_number"],
        productDate: json["product_date"],
        location: json["location_name"],
        subLocation: json["sub_location"],
        itemCode: json["item_code"],
        productCode: json["product_code"],
        asset: json["asset"],
        assetno: json["asset_no"],
        serial: json["serial"],
        photo: json["photo"],
        remark: json["remark"],
        mainCategory: json["main_category"],
        category: json["category"],
        quantity: json["quantity"],
        uom: json["uom"],
        availableQuantity: json["available_quantity"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        updateStatus: json["update_status"],
        photos: json["photos"] == null
            ? []
            : List<String>.from(json["photos"].map((x) => x)),
    locations:json["locations"] == null ? null : Locations.fromJson(json["locations"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "company_id": companyId,
        "sheet_number": sheetNumber,
        "product_date": productDate,
        "location_name": location,
        "sub_location": subLocation,
        "item_code": itemCode,
        "product_code": productCode,
        "asset": asset,
        "asset_no": assetno,
        "serial": serial,
        "photo": photo,
        "remark": remark,
        "main_category": mainCategory,
        "category": category,
        "quantity": quantity,
        "uom": uom,
        "available_quantity": availableQuantity,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "update_status": updateStatus,
        "photos": List<dynamic>.from(photos!.map((x) => x)),
    "locations": locations?.toJson(),
      };
}

class Locations {
  int? id;
  int? companyId;
  String? locationCode;
  String? locationName;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Locations({
    this.id,
    this.companyId,
    this.locationCode,
    this.locationName,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
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