import 'package:get/get.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/scannerdesignation/productsscreen.dart';

import '../../web_service/web_repository.dart';
import '../model/locationlistmodel.dart';
import '../model/statustypelistmodel.dart';

class LocatioController extends GetxController {
  late Locationlistcompany weblocation;
  Location() async {
    await WebRepository().homepagedata(comapnydetails()?.data?.id.toString() ?? "1").then((value) {
      weblocation = value;
      update();
      Get.off(const HomeScreen());
    }).onError((error, stackTrace) {
      print(error);
    });
  }
  Location2() async {
    await WebRepository().homepagedata(comapnydetails()?.data?.id.toString() ?? "1").then((value) {
      weblocation = value;
      update();
      Get.off(const ProductsScreen());
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  RxList<StatusType> statustypelist = <StatusType>[].obs;

  statustypelistapi() async {
    await WebRepository()
        .statusTypeList(
    )
        .then((value) {
      if(value.success == false){
        Fluttertoast.showToast(msg: value.message ?? '');
      }else {
        statustypelist.value = value.data ?? [];
      }
      Get.context!.loaderOverlay.hide();

    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print(error);
    });
  }

}
