import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:inventory/model/historyupdatequntityresponse.dart';

import '../../const.dart';
import '../../getxcontroller/locationcontroller.dart';
import '../../getxcontroller/productcontroller.dart';
import '../../getxcontroller/updatedhistorycontroller.dart';
import '../../web_service/web_repository.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/customforcreate.dart';
import '../../widgets/helper.dart';

class EditProduct extends StatefulWidget {
  final HistoryProduct product;
  const EditProduct({super.key, required this.product});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();

  TextEditingController quantity = TextEditingController();
  LocatioController locationController = Get.put(LocatioController());
  ProductController procontroller = Get.put(ProductController());
  @override
  void initState() {
    if (locationController.weblocation.data!.isNotEmpty) {
      procontroller.locationid =
          locationController.weblocation.data?.first.id.toString() ?? "";
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    String cretedate = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(
        widget.product.createdAt.toString() ?? DateTime.now().toString()));


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
          'Edit Item',
          style: TextStyle(color: white, fontSize: 22),
        ),
      ),
      body: Column(
        children: [
          Padding(
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
                                baseurlimage + widget.product.photo.toString(),
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
                            // placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                  image:
                                      NetworkImage("$baseurlimage/default.png"),
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
                              Text(" ${widget.product.asset}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("Item Code :  ${widget.product.itemCode}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: subtitle,
                                      fontWeight: FontWeight.w400)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Product Code :  ${widget.product.productCode}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: subtitle,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Location:  ${widget.product.location}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: subtitle,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Remark:  ${widget.product.remark}",
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
                            "Available Quantity : ${widget.product.quantity}",
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Form(
              key: _formKey,
              child: Card(
                shape: boarderad,
                elevation: 3,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Select Location',
                            style: TextStyle(
                              // fontFamily: 'gilroy',
                                fontSize: screenheight(context,
                                    dividedby: 50),
                                color: lablecolor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),

                      Container(
                        // padding: const EdgeInsets.all(5.0),
                        child: locationController
                            .weblocation.data!.isEmpty
                            ? Container(
                          alignment: Alignment.centerLeft,
                          height: screenheight(context,
                              dividedby: 20),
                          // width: screenwidth(context, dividedby: 1),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade600
                                      .withOpacity(0.5),
                                  blurRadius: 2,
                                  spreadRadius: 0.2,
                                  offset: const Offset(1, 1)),
                            ],
                            borderRadius:
                            BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20),
                            child: Text(
                              'No Location',
                              style: TextStyle(
                                  fontSize: screenheight(
                                      context,
                                      dividedby: 45),
                                  fontFamily: 'gilroy.bold',
                                  color: Colors.grey.shade400),
                            ),
                          ),
                        )
                            : CustomDropDown(
                          result: locationController
                              .weblocation.data!,
                          onSelection: (var value) {
                            procontroller.locationid =
                                value.toString();
                            print(value.toString());
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      CommonTextFieldCrete(
                        focusnood: focusNode,
                        keyboardtype: TextInputType.number,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Edited Quantity';
                          }
                          return null;
                        },
                        textname: "Enter Edited Quantity",
                        controller: quantity,
                        hintText: 'Enter Edited Quantity',
                        isPasswordField: false,
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                          name: 'Submit',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              focusNode.unfocus();
                              Get.put(ProductUpdatedHistoryController())
                                  .historyeditapi(
                                      quantity: quantity.text,
                                      productid:
                                          widget.product.productId.toString());
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
