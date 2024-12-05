import 'package:inventory/inventory.dart';
import '../model/createproductslistmodel.dart';

class CreateProductListController extends GetxController {
  Rx<Createproducthistoryresponsemodel> products = Createproducthistoryresponsemodel().obs;
  createproducthistoryapi() async {
    Get.context!.loaderOverlay.show();
    await WebRepository().createproducthistory().then((value) {
      if (value.data!.isNotEmpty) {
        products.value = value;
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
