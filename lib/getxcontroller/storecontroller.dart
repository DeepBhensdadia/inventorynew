import 'package:flutter/foundation.dart';
import 'package:inventory/inventory.dart';

import 'package:inventory/getxcontroller/locationcontroller.dart';

class StoreController extends GetxController {
  final WebRepository repository = WebRepository();
  TextEditingController codecontroller = TextEditingController();

  // late StoreCode storecodedata;
  final LocatioController locationcontroll = Get.put(LocatioController());

  storecode() async {
    await WebRepository()
        .companydetaisapi(codecontroller.text)
        .then((value) async {
      Get.context!.loaderOverlay.hide();
      if (kDebugMode) {
        print(jsonEncode(value));
      }
      if (value.data?.id != null) {
        await SharedPref.save(
            value: jsonEncode(value.toJson()), prefKey: PrefKey.companyDetails);
        saveUser()?.data?.roleDesignation != "1"
            ? locationcontroll.Location()
            : locationcontroll.Location2();
      } else {
        Fluttertoast.showToast(msg: "Invalid Comapny Code");
      }
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print(".....$error");
    });
  }
}
