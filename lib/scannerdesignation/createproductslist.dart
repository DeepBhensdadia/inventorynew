import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory/const.dart';
import 'package:inventory/getxcontroller/createproducthistorycontroller.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/model/createproductslistmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CreatesProductListScreen extends StatefulWidget {
  const CreatesProductListScreen({Key? key}) : super(key: key);

  @override
  State<CreatesProductListScreen> createState() =>
      _CreatesProductListScreenState();
}

class _CreatesProductListScreenState extends State<CreatesProductListScreen> {
  @override
  Widget build(BuildContext context) {
    CreateProductListController productListController =
        Get.put(CreateProductListController());

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [

        ],
        backgroundColor: purple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Created Products',
              style: TextStyle(color: white, fontSize: 22),
            ),
            Padding(
              padding: const EdgeInsets.only(right:20.0,),
              child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(width: 2,color: white)),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      productListController.products.data?.length.toString() ?? "",
                      style: TextStyle(color: white, fontSize: 16),
                    ),
                  ),
              ),
            )

          ],
        ),
      ),
      body: ListView.builder(
        itemCount: productListController.products.data?.length,
        itemBuilder: (context, index) {
          Datum? product = productListController.products.data?[index];
         String cretedate =  DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(product?.createdAt.toString() ?? DateTime.now().toString()));
          return Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
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
                            imageUrl: baseurlimage + product!.photo.toString(),
                            imageBuilder: (context, imageProvider) => Container(
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
                            errorWidget: (context, url, error) => Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      "${baseurlimage}/default.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${product.asset}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Item Code :  ${product.itemCode}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: subtitle,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Product Code :  ${product.productCode}",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: subtitle,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Location:  ${product.location}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: subtitle,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Remark:  ${product.remark}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: subtitle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
