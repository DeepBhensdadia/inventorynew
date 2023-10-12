// To parse this JSON data, do
//
//     final productsdetails = productsdetailsFromJson(jsonString);

import 'dart:convert';

Productsdetails productsdetailsFromJson(String str) => Productsdetails.fromJson(json.decode(str));

String productsdetailsToJson(Productsdetails data) => json.encode(data.toJson());

class Productsdetails {
  bool? success;
  String? message;
  List<Product>? data;

  Productsdetails({
    this.success,
    this.message,
    this.data,
  });

  factory Productsdetails.fromJson(Map<String, dynamic> json) => Productsdetails(
    success: json["success"],
    message: json["message"],
    data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
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
  String? mainCategory;
  String? category;
  String? quantity;
  dynamic uom;
  dynamic availableQuantity;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

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
    this.mainCategory,
    this.category,
    this.quantity,
    this.uom,
    this.availableQuantity,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    userId: json["user_id"],
    companyId: json["company_id"],
    sheetNumber: json["sheet_number"],
    productDate: json["product_date"],
    location: json["location"],
    subLocation: json["sub_location"],
    itemCode: json["item_code"],
    productCode: json["product_code"],
    asset: json["asset"],
    mainCategory: json["main_category"],
    category: json["category"],
    quantity: json["quantity"],
    uom: json["uom"],
    availableQuantity: json["available_quantity"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
    "main_category": mainCategory,
    "category": category,
    "quantity": quantity,
    "uom": uom,
    "available_quantity": availableQuantity,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
