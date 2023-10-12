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

const Color purple = Colors.purple;

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