import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:inventory/inventory.dart';

import 'package:inventory/model/comapanydetailsmodel.dart';
import 'package:inventory/model/locationlistmodel.dart';
import 'package:inventory/model/login_credential.dart';
import 'package:inventory/model/productdetailsmodel.dart';
import 'package:inventory/model/login_model.dart';


const String baseurl = "http://192.168.29.248:8000/api";

class WebRepository {
  Future<Login> login(LoginCredentials credentials) async {
    http.Response response = await WebService.postRequest(
      url: "$baseurl/login",
      body: credentials.toJson(),
    );

    return loginFromJson(response.body);
  }

  Future<Companydetails> companydetaisapi(String companyid) {
    String url = '$baseurl/company/$companyid';
    return http
        .get(
      Uri.parse(url),
    )
        .then((http.Response response) {
      return companydetailsFromJson(response.body);
    });
  }

  Future<Locationlistcompany> homepagedata(String companyid) {
    String url = '$baseurl/locationlist?company_id=$companyid';
    return http
        .get(
      Uri.parse(url),
    )
        .then((http.Response response) {
      return locationlistcompanyFromJson(response.body);
    });
  }

  Future<Productsdetails> productdetailsapi({required String locationid,required String productcode,}) {
    String url = '$baseurl/Productbyitemcode?company_id=${comapnydetails()?.data?.id}&location=115&itemcode=$productcode';
    return http
        .get(
      Uri.parse(url),
    )
        .then((http.Response response) {
      return productsdetailsFromJson(response.body);
    });
  }
  Future<Productsdetails> productdetailswithQrapi({required String locationid,required String productcode,}) {
    String url = '$baseurl/ProductbyQrcode?company_id=${comapnydetails()?.data?.id}&location=115&product_code=$productcode';
    return http
        .get(
      Uri.parse(url),
    )
        .then((http.Response response) {
      return productsdetailsFromJson(response.body);
    });
  }

}
// http://tagmyassets.com/ivapp/api/app_login
// [POST]
// email=ivapp@gmail.com
// password=123456789
//
//
// http://tagmyassets.com/ivapp/api/app_get_asset_details
// [POST]
// tag_number=1234
// main_category=W
//
// tag_number=1234
// main_category=S
//
//
// http://tagmyassets.com/ivapp/api/app_user_update_quantity_history
// [POST]
// user_id=1
