import 'dart:io';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
  TextEditingController statustype = TextEditingController();

  Position? position;
  RxString placeName = "".obs;
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled.");
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location permissions are denied.");
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print("Location permissions are permanently denied.");
      return;
    }
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("Latitude: ${position?.latitude}, Longitude: ${position?.longitude}");

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    Placemark place = placemarks[0];
    placeName.value =
        "${place.locality}, ${place.administrativeArea}, ${place.country}";
  }

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
      "user_id": saveUser()?.data?.id.toString(),
      "status": statustype.text,
      "longitude": position?.longitude,
      "latitude": position?.latitude
      // "longitude": "72.8311° E",
      // "latitude": "21.1702° N"
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
