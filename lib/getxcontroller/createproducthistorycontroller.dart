import 'dart:convert';

import 'package:get/get.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/model/historyupdatequntityresponse.dart';
import 'package:inventory/scannerdesignation/createproductslist.dart';
import 'package:inventory/web_service/web_repository.dart';

import '../model/createproductslistmodel.dart';

class CreateProductListController extends GetxController {
  late Createproducthistoryresponsemodel products;
  createproducthistoryapi() async {
    Get.context!.loaderOverlay.show();
    await WebRepository().createproducthistory().then((value) {
      if (value.data!.isNotEmpty) {
        products = value;
        Get.to(CreatesProductListScreen());
      } else {
        Fluttertoast.showToast(msg: "Data is not available..");
      }
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print(error);
    });
  }
}