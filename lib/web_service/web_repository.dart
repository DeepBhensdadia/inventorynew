import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:inventory/inventory.dart';
import 'package:inventory/model/assetupdateresponse.dart';
import 'package:inventory/model/comapanydetailsmodel.dart';
import 'package:inventory/model/createproductslistmodel.dart';
import 'package:inventory/model/locationlistmodel.dart';
import 'package:inventory/model/login_credential.dart';
import 'package:inventory/model/productdetailsmodel.dart';
import 'package:inventory/model/login_model.dart';
import 'package:inventory/model/productstoreresponse.dart';
import '../model/historyupdatequntityresponse.dart';

// const String baseurl = "http://192.168.29.248:8000/api";
// const String baseurlimage =
//     "http://192.168.29.248:8000/assets/uploads/media/";
const String baseurl = "https://horn7.com/ivapp/public/api";
const String baseurlimage =
    "https://horn7.com/ivapp/public/assets/uploads/media/";

class WebRepository {
  var headers = {'Content-Type': 'application/json'};

  Future<Login> login(LoginCredentials credentials) async {
    http.Response response = await WebService.postRequest(
      url: "$baseurl/login",
      body: credentials.toJson(),
    );
    return loginFromJson(response.body);
  }

  Future<Companydetails> companydetaisapi(String companyid) {
    String url =
        '$baseurl/company?company_code=$companyid&user_id=${saveUser()?.data?.id}';
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

  Future<Productsdetails> productdetailsapi({
    required String locationid,
    required String productcode,
  }) {
    String url =
        '$baseurl/Productbyitemcode?company_id=${comapnydetails()?.data?.id}&location=$locationid&itemcode=$productcode&user_id=${saveUser()?.data?.id}';
    return http
        .get(
      Uri.parse(url),
    )
        .then((http.Response response) {
      return productsdetailsFromJson(response.body);
    });
  }

  Future<Productsdetails> productdetailswithQrapi({
    required String locationid,
    required String productcode,
  }) {
    String url =
        '$baseurl/ProductbyQrcode?company_id=${comapnydetails()?.data?.id}&location=$locationid&product_code=$productcode&user_id=${saveUser()?.data?.id}';
    return http
        .get(
      Uri.parse(url),
    )
        .then((http.Response response) {
      return productsdetailsFromJson(response.body);
    });
  }

  Future<Historyresponsemodel> quntityupdatedhistory() {
    String url = '$baseurl/qtyhistory';
    // String url = '$baseurl/qtyhistory&user_id=${saveUser()?.data?.id}';
    return http
        .get(
      Uri.parse(url),
    )
        .then((http.Response response) {
      return historyresponsemodelFromJson(response.body);
    });
  }

  Future<Createproducthistoryresponsemodel> createproducthistory() {
    String url =
        '$baseurl/product_create_history?user_id=${saveUser()?.data?.id}';
    return http
        .get(
      Uri.parse(url),
    )
        .then((http.Response response) {
      return createproducthistoryresponsemodelFromJson(response.body);
    });
  }

  Future<Assetresponsemodel> quantityupdate({
    required Map<String, dynamic> parameter,
    required String id,
    File? imageFile,
  }) async {
    String url = '$baseurl/QtyUpdateByid/$id';

    var request = http.MultipartRequest('POST', Uri.parse(url));

    for (var entry in parameter.entries) {
      request.fields[entry.key] = entry.value.toString();
    }

    if (imageFile != null) {
      var imageStream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();

      var multipartFile = http.MultipartFile('photo', imageStream, length,
          filename: imageFile.path.split('/').last);

      request.files.add(multipartFile);
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 422) {
      String responseBody = await response.stream.bytesToString();
      debugPrint(json.encode(responseBody));
      return assetresponsemodelFromJson(responseBody);
    } else {
      throw Exception('Failed to upload the image and data');
    }
  }

  Future<Productstoreresponsemodel> productCreateapi({
    required Map<String, dynamic> parameter,
    File? imageFile, // Add a parameter for the image file
  }) async {
    String url = '$baseurl/Product_store';

    var request = http.MultipartRequest('POST', Uri.parse(url));

    for (var entry in parameter.entries) {
      request.fields[entry.key] = entry.value.toString();
    }

    if (imageFile != null) {
      var imageStream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();

      var multipartFile = http.MultipartFile('photo', imageStream, length,
          filename: imageFile.path.split('/').last);

      request.files.add(multipartFile);
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 422) {
      String responseBody = await response.stream.bytesToString();
      debugPrint(json.encode(responseBody));
      return productstoreresponsemodelFromJson(responseBody);
    } else {
      throw Exception('Failed to upload the image and data');
    }
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
