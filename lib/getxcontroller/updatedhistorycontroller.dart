import 'dart:convert';

import 'package:get/get.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/model/historyupdatequntityresponse.dart';
import 'package:inventory/web_service/web_repository.dart';

class ProductUpdatedHistoryController extends GetxController {
  late Historyresponsemodel history;
  historyapi() async {
    Get.context!.loaderOverlay.show();
    await WebRepository()
        .quntityupdatedhistory()
        .then((value) {
      if (value.data!.isNotEmpty) {
        history = value;
        Get.to(HistoryScreen());

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