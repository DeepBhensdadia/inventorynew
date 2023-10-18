// To parse this JSON data, do
//
//     final historyresponsemodel = historyresponsemodelFromJson(jsonString);

import 'dart:convert';

Historyresponsemodel historyresponsemodelFromJson(String str) => Historyresponsemodel.fromJson(json.decode(str));

String historyresponsemodelToJson(Historyresponsemodel data) => json.encode(data.toJson());

class Historyresponsemodel {
  bool? success;
  String? message;
  List<HistoryProduct>? data;

  Historyresponsemodel({
    this.success,
    this.message,
    this.data,
  });

  factory Historyresponsemodel.fromJson(Map<String, dynamic> json) => Historyresponsemodel(
    success: json["success"],
    message: json["message"],
    data:json["data"] != null ? List<HistoryProduct>.from(json["data"].map((x) => HistoryProduct.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class HistoryProduct {
  int? id;
  int? productId;
  int? oldQty;
  int? newQty;
  int? userId;
  String? comment;
  String? photo;
  String? condition;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? companyId;
  String? sheetNumber;
  String? productDate;
  String? location;
  String? subLocation;
  String? itemCode;
  String? productCode;
  String? asset;
  String? remark;
  String? mainCategory;
  String? category;
  String? quantity;
  String? uom;
  String? availableQuantity;
  int? status;

  HistoryProduct({
    this.id,
    this.productId,
    this.oldQty,
    this.newQty,
    this.userId,
    this.comment,
    this.photo,
    this.condition,
    this.createdAt,
    this.updatedAt,
    this.companyId,
    this.sheetNumber,
    this.productDate,
    this.location,
    this.subLocation,
    this.itemCode,
    this.productCode,
    this.asset,
    this.remark,
    this.mainCategory,
    this.category,
    this.quantity,
    this.uom,
    this.availableQuantity,
    this.status,
  });

  factory HistoryProduct.fromJson(Map<String, dynamic> json) => HistoryProduct(
    id: json["id"],
    productId: json["product_id"],
    oldQty: json["old_qty"],
    newQty: json["new_qty"],
    userId: json["user_id"],
    comment: json["comment"],
    photo: json["photo"],
    condition: json["condition"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    companyId: json["company_id"],
    sheetNumber: json["sheet_number"],
    productDate: json["product_date"],
    location: json["location"],
    subLocation: json["sub_location"],
    itemCode: json["item_code"],
    productCode: json["product_code"],
    asset: json["asset"],
    remark: json["remark"],
    mainCategory: json["main_category"],
    category: json["category"],
    quantity: json["quantity"],
    uom: json["uom"],
    availableQuantity: json["available_quantity"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "old_qty": oldQty,
    "new_qty": newQty,
    "user_id": userId,
    "comment": comment,
    "photo": photo,
    "condition": condition,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "company_id": companyId,
    "sheet_number": sheetNumber,
    "product_date": productDate,
    "location": location,
    "sub_location": subLocation,
    "item_code": itemCode,
    "product_code": productCode,
    "asset": asset,
    "remark": remark,
    "main_category": mainCategory,
    "category": category,
    "quantity": quantity,
    "uom": uom,
    "available_quantity": availableQuantity,
    "status": status,
  };
}
