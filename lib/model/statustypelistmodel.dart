// To parse this JSON data, do
//
//     final statusTypeListModel = statusTypeListModelFromJson(jsonString);

import 'dart:convert';

StatusTypeListModel statusTypeListModelFromJson(String str) => StatusTypeListModel.fromJson(json.decode(str));

String statusTypeListModelToJson(StatusTypeListModel data) => json.encode(data.toJson());

class StatusTypeListModel {
  bool? success;
  String? message;
  List<StatusType>? data;

  StatusTypeListModel({
    this.success,
    this.message,
    this.data,
  });

  factory StatusTypeListModel.fromJson(Map<String, dynamic> json) => StatusTypeListModel(
    success: json["success"],
    message: json["message"],
    data: List<StatusType>.from(json["data"].map((x) => StatusType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class StatusType {
  int? id;
  String? name;

  StatusType({
    this.id,
    this.name,
  });

  factory StatusType.fromJson(Map<String, dynamic> json) => StatusType(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
