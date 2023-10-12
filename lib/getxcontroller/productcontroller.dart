import 'package:get/get.dart';
import 'package:inventory/inventory.dart';

import '../../web_service/web_repository.dart';
import '../model/locationlistmodel.dart';
import '../model/productdetailsmodel.dart';
import '../../src/Asset/asset_screen.dart';

class ProductController extends GetxController {
  late Productsdetails assetDetails;
  TextEditingController assetnumber = TextEditingController(text: "B10021451");
  String locationid = "";
  detailsscreen() async {
    await WebRepository()
        .productdetailsapi(
            locationid: locationid, productcode: assetnumber.text)
        .then((value) {
     if(value.data!.isNotEmpty){
       assetDetails = value;
       Get.context!.loaderOverlay.hide();
       print(jsonEncode(value));
       Get.to(const AssetScreen());
       Get.context!.loaderOverlay.hide();
     }else{
       Fluttertoast.showToast(msg: "Data is not available..");
       Get.context!.loaderOverlay.hide();
     }
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}

class ProductControllerwithQr extends GetxController {
  late Productsdetails assetDetails;
  String locationid = "";
  detailsscreen(String qrdata) async {
    await WebRepository()
        .productdetailswithQrapi(locationid: locationid, productcode: qrdata)
        .then((value) {
      if (value.data!.isNotEmpty) {
        assetDetails = value;
        Get.context!.loaderOverlay.hide();
        print(jsonEncode(value));
        Get.to(const AssetScreen());
      } else {
        Fluttertoast.showToast(msg: "Data is not available..");
      }
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
