import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory/const.dart';
import 'package:inventory/getxcontroller/updatedhistorycontroller.dart';
import 'package:inventory/model/historyupdatequntityresponse.dart';
import 'package:inventory/web_service/web_repository.dart';

import '../../widgets/custom_button.dart';
import 'edithistory.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    ProductUpdatedHistoryController historyController =
        Get.put(ProductUpdatedHistoryController());

    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: purple,
          title: const Text(
            'History',
            style: TextStyle(color: white, fontSize: 22),
          ),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: historyController.history.value.data?.length,
            itemBuilder: (context, index) {
              HistoryProduct? product =
                  historyController.history.value.data?[index];
              String cretedate = DateFormat('dd/MM/yyyy HH:mm').format(
                  DateTime.parse(product?.createdAt.toString() ??
                      DateTime.now().toString()));
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Card(
                  // margin: EdgeInsets.all(20),
                  shape: boarderad,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: CachedNetworkImage(
                                imageUrl:
                                    baseurlimage + product!.photo.toString(),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,

                                      // colorFilter:
                                      // ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                    ),
                                  ),
                                ),
                                // placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          "$baseurlimage/default.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(" ${product.asset}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("Item Code :  ${product.itemCode}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: subtitle,
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Product Code :  ${product.productCode}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: subtitle,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Location:  ${product.location}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: subtitle,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Remark:  ${product.remark}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: subtitle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Text(
                                "Available Quantity : ${product.quantity}",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: lablecolor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Text(
                                textAlign: TextAlign.end,
                                "${cretedate}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Visibility(
                                visible: product.isEdited == 1 ? true : false,
                                child: Expanded(
                                    child: Text(
                                  "Edited",
                                  style: TextStyle(
                                      color: purple,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ))),
                            Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.resolveWith(
                                              (states) => EdgeInsets.zero),
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => lablecolor)),
                                  onPressed: () {
                                    Get.to(EditProduct(product: product));
                                  },
                                  child: Text("Edit")),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
