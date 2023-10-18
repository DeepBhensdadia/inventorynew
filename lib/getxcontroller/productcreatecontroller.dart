
import 'dart:io';

import 'package:inventory/inventory.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // For MediaType
import 'package:inventory/model/productstoreresponse.dart';

import 'package:loader_overlay/loader_overlay.dart';

class ProductCreateController extends GetxController {
  TextEditingController itemcode = TextEditingController();
  TextEditingController qrcode = TextEditingController();
  TextEditingController assetsname = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController remark = TextEditingController();

creteproduct({
   File? photo,
  }) async {

    Get.context!.loaderOverlay.show();
    var parameter = {
      'user_id': saveUser()?.data?.id,
      'company_id': comapnydetails()?.data?.id,
      'item_code': itemcode.text,
      'product_code': qrcode.text,
      'asset': assetsname.text,
      'quantity': quantity.text,
      'uom': 'Pcs',
      'remark': remark.text
    };
    await WebRepository().productCreateapi(parameter: parameter, imageFile: photo).then((value) {
      Get.context!.loaderOverlay.hide();
      Fluttertoast.showToast(msg: value.message ?? "");
      if (value.message == "Saved Successfully") {
        Get.back();
      }
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();

      print("error.....$error");
    });
  }
}




