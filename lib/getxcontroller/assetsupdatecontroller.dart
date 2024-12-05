import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/const.dart';
import 'package:inventory/web_service/web_repository.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AssetsUpdateController extends GetxController {
  TextEditingController commet = TextEditingController();
  TextEditingController quantity = TextEditingController();
  // TextEditingController quantity = TextEditingController();

  updatequantity({
    required String assetid,
    required String locationid,
    List<XFile>? photo,
  }) async {
    Get.context!.loaderOverlay.show();
    Map<String, dynamic> parameter = {
      "comment": commet.text,
      "condition": "missing",
      "location_id": locationid,
      // "quantity": quantity.text,
      "user_id": saveUser()?.data?.id.toString(),
    };

    await WebRepository()
        .quantityupdate(id: assetid, parameter: parameter, imageFile: photo)
        .then((value) {
      Get.context!.loaderOverlay.hide();
      Fluttertoast.showToast(msg: value.massage ?? "");
      Get.back();
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print("error.....$error");
    });
  }
}
