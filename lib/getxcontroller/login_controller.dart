import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:inventory/src/storecode/store_code_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../inventory.dart';
import '../model/login_credential.dart';
import '../model/login_model.dart';
import '../../shared_pref/shared_pref.dart';
import '../../web_service/web_repository.dart';
import 'locationcontroller.dart';

class LoginController extends GetxController {
  final WebRepository repository = WebRepository();
  LocatioController locationcontroll = Get.put(LocatioController());

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  late Login loginst;

  Future<void> login() async {
    await repository
        .login(
      LoginCredentials(
        email: email.text,
        password: password.text,
      ),
    )
        .then((login) async {
      if (login.data?.id == null) {
        Fluttertoast.showToast(msg: login.message.toString());
        Get.context!.loaderOverlay.hide();
        return;
      } else {
        Get.context!.loaderOverlay.hide();
        Fluttertoast.showToast(msg: login.message.toString());
        await SharedPref.save(
            value: jsonEncode(login.toJson()), prefKey: PrefKey.loginDetails);
        await SharedPref.save(
            value: jsonEncode(
              LoginCredentials(
                email: email.text,
                password: password.text,
              ),
            ),
            prefKey: PrefKey.logincred);
        Get.off(const StoreCode());
      }
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print("error...$error");
    });
  }

  Future<void> logincheck() async {
    await repository
        .login(
      LoginCredentials(
        email: logindetails()?.email,
        password: logindetails()?.password,
      ),
    )
        .then((login) async {
      if (login.data?.status == 1) {
        Fluttertoast.showToast(msg: login.message.toString());
        SharedPref.deleteAll();
        Get.deleteAll();
        Get.offAll(const LoginScreen());
        return;
      } else {
        print(jsonEncode(login));
        await SharedPref.save(
            value: jsonEncode(login.toJson()), prefKey: PrefKey.loginDetails);
      }
    }).onError((error, stackTrace) {
      print("error...$error");
    });
  }
}
