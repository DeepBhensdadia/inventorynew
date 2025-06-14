import 'package:get/get.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/model/statustypelistmodel.dart';

import '../../web_service/web_repository.dart';
import '../model/locationlistmodel.dart';
import '../model/productdetailsmodel.dart';
import '../../src/Asset/asset_screen.dart';

class ProductController extends GetxController {
  late Productsdetails assetDetails;
  TextEditingController assetnumber = TextEditingController();
  String locationid = "";
  detailsscreen() async {
    await WebRepository()
        .productdetailsapi(
            locationid: locationid, productcode: assetnumber.text)
        .then((value) {
      if (value.success == false) {
        Fluttertoast.showToast(msg: value.message ?? '');
      } else {
        assetDetails = value;
        print(jsonEncode(value));
        Get.to(const AssetScreen());
        locationid = value.data!.locations?.id.toString() ?? "";

        assetnumber.clear();
      }
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print(error);
    });
  }
}

class ProductControllerwithQr extends GetxController {
  ProductController productController = Get.put(ProductController());
  detailsscreen(String qrdata) async {
    Get.context?.loaderOverlay.show();
    await WebRepository()
        .productdetailswithQrapi(
            locationid: productController.locationid, productcode: qrdata)
        .then((value) {
      if (value.success == false) {
        Fluttertoast.showToast(msg: value.message ?? '');
        Get.context?.loaderOverlay.hide();
        // Get.back();
      } else {
        productController.assetDetails = value;
        print(jsonEncode(value));
        Get.to(const AssetScreen());
        productController.locationid =
            value.data!.locations?.id.toString() ?? "";
      }
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
