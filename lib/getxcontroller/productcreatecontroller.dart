import 'dart:io';

import 'package:inventory/inventory.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // For MediaType
import 'package:inventory/model/productstoreresponse.dart';

import 'package:loader_overlay/loader_overlay.dart';

import 'createproducthistorycontroller.dart';

class ProductCreateController extends GetxController {
  TextEditingController itemcode = TextEditingController();
  TextEditingController qrcode = TextEditingController();
  TextEditingController assetsname = TextEditingController();
  TextEditingController sublocation = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController remark = TextEditingController();
  TextEditingController uom = TextEditingController(text: "PC");

  String locationid = "";
  creteproduct({
    File? photo,
    String? productId,
  }) async {
    Get.context!.loaderOverlay.show();
    var parameter = {
      'user_id': saveUser()?.data?.id,
      'company_id': comapnydetails()?.data?.id,
      'item_code': itemcode.text,
      'product_code': qrcode.text,
      'asset': assetsname.text,
      'sub_location': sublocation.text,
      'quantity': quantity.text,
      'uom': uom.text,
      'remark': remark.text,
      'location': locationid
    };

    print(parameter);
    await WebRepository()
        .productCreateapi(parameter: parameter, imageFile: photo)
        .then((value) {
      Get.context!.loaderOverlay.hide();
      Fluttertoast.showToast(msg: value.message ?? "");
      if (value.message == "Saved Successfully") {
        itemcode.clear();
        qrcode.clear();
        assetsname.clear();
        sublocation.clear();
        quantity.clear();
        remark.clear();
        Get.back();
      }
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();

      print("error.....$error");
    });
  }

  editproduct({
    File? photo,
    required String productId,
  }) async {
    Get.context!.loaderOverlay.show();
    var parameter = {
      'product_id': productId,
      'user_id': saveUser()?.data?.id,
      'company_id': comapnydetails()?.data?.id,
      'item_code': itemcode.text,
      'product_code': qrcode.text,
      'asset': assetsname.text,
      'sub_location': sublocation.text,
      'quantity': quantity.text,
      'uom': uom.text,
      'remark': remark.text,
      'location': locationid
    };

    print(parameter);
    await WebRepository()
        .productCreateapi(parameter: parameter, imageFile: photo)
        .then((value) {
      Get.context!.loaderOverlay.hide();
      Fluttertoast.showToast(msg: value.message ?? "");
      Get.put(CreateProductListController()).createproducthistoryapi();
      if (value.message == "Saved Successfully") {
        itemcode.clear();
        qrcode.clear();
        assetsname.clear();
        sublocation.clear();
        quantity.clear();
        remark.clear();
        Get.back();
      }
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();

      print("error.....$error");
    });
  }
}
