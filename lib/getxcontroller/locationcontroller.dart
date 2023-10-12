import 'package:get/get.dart';
import 'package:inventory/inventory.dart';

import '../../web_service/web_repository.dart';
import '../model/locationlistmodel.dart';

class LocatioController extends GetxController {
  late Locationlistcompany weblocation;
  Location() async {
    await WebRepository().homepagedata(comapnydetails()?.data?.id.toString() ?? "1").then((value) {
      weblocation = value;
      Get.off(const HomeScreen());
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
