import 'package:flutter/material.dart';
import 'package:inventory/model/comapanydetailsmodel.dart';
import 'package:inventory/model/locationlistmodel.dart';
import 'package:inventory/model/login_model.dart';
import 'shared_pref/shared_pref.dart';

class Url {
  static String url = 'http://www.tagmyassets.com/ivappnew/api';

  static String login = '$url/app_login';
  static String Asset_details = '$url/app_get_asset_details';
  static String updatedhistory = '$url/app_user_update_quantity_history';
  static String update_xx = '$url/app_update_quantity';
  static String update_byid = '$url/app_update_quantity_by_id';
  static String getcompany = '$url/get_company';
  static String companycode = '$url/get_location';
  static String companylogin = '$url/company_login';
  static String companydashboard = '$url/company_dashboard';
}

const Color purple = Color(0xffA84777);
const Color lablecolor = Color(0xff4778A9);
const Color greencolor = Color(0xff78A947);
const Color subtitle = Colors.black45;
const Color white = Colors.white;

Login? saveUser() {
  Login? saveuser = SharedPref.get(prefKey: PrefKey.loginDetails) != null
      ? loginFromJson(SharedPref.get(prefKey: PrefKey.loginDetails)!)
      : null;
  return saveuser;
}

Companydetails? comapnydetails() {
  Companydetails? saveuser = SharedPref.get(prefKey: PrefKey.companyDetails) != null
      ? companydetailsFromJson(SharedPref.get(prefKey: PrefKey.companyDetails)!)
      : null;
  return saveuser;
}

List<Productsdetailsforest> data = [
Productsdetailsforest(locationCode: "1001",locationName: "Warehouse"),
Productsdetailsforest(locationCode: "1000",locationName: "Store"),
];

class Productsdetailsforest {
  int? id;
  int? companyId;
  String locationCode;
  String locationName;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Productsdetailsforest({
    this.id,
    this.companyId,
   required this.locationCode,
   required this.locationName,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

}

final ShapeBorder boarderad =  RoundedRectangleBorder(
borderRadius: BorderRadius.circular(8.0),
);