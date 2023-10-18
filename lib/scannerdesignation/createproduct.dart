import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/getxcontroller/productcreatecontroller.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/scannerdesignation/scannerscreen.dart';
import 'package:inventory/widgets/customforcreate.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({
    super.key,
  });

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  File? profilepic;
  Future<void> pickcoverimagecamera() async {
    XFile? Selectedimage = await ImagePicker().pickImage(
      imageQuality: 10,
      source: ImageSource.camera,
    );

    if (Selectedimage != null) {
      File convertedFile = File(Selectedimage.path);
      setState(() {
        profilepic = convertedFile;
      });

      // Fluttertoast.showToast(msg: "Image Selected");
    } else {
      // Fluttertoast.showToast(msg: "Image Not Selected");
    }
  }

  Future<void> pickcoverimagegallary() async {
    XFile? Selectedimage = await ImagePicker().pickImage(
      imageQuality: 10,
      source: ImageSource.gallery,
    );

    if (Selectedimage != null) {
      File convertedFile = File(Selectedimage.path);
      setState(() {
        profilepic = convertedFile;
      });

      // Fluttertoast.showToast(msg: "Image Selected");
    } else {
      // Fluttertoast.showToast(msg: "Image Not Selected");
    }
  }

  ProductCreateController createproduct = Get.put(ProductCreateController());
  TextEditingController uom = TextEditingController(text: "Pcs");
  @override
  void initState() {
    // TODO: implement initState
    createproduct.qrcode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            actions: const [],
            iconTheme: const IconThemeData(color: white, size: 30),
            backgroundColor: purple,
            elevation: 5,
            toolbarHeight: 60,
            title: const Text(
              "Create Product",
              style: TextStyle(
                  fontSize: 22,
                  // fontWeight: FontWeight.w600,
                  color: white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              shape: boarderad,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextFieldCrete(
                          validation: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter item code';
                            }
                            return null;
                          },
                          textname: "Item Code",
                          controller: createproduct.itemcode,
                          hintText: 'Enter Item Code',
                          isPasswordField: false,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:   Text(
                            "QR Code",
                            style: TextStyle(
                              // fontFamily: 'gilroy',
                                fontSize:
                                screenheight(context, dividedby: 55),
                                color: lablecolor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                  // color: Colors.blueGrey.withOpacity(0.3),
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter product code';
                                    }
                                    return null;
                                  },
                                  controller: createproduct.qrcode,
                                  decoration: InputDecoration(
                                    fillColor: purple,
                                    border: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(width: 1, color: Colors.grey.shade500),
                                        borderRadius: BorderRadius.circular(6)),
                                    // enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.grey.shade500),borderRadius: BorderRadius.circular(6)),
                                    // disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.grey.shade500),borderRadius: BorderRadius.circular(6)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(width: 1, color: Colors.grey.shade500),
                                        borderRadius: BorderRadius.circular(6)),
                                    contentPadding:
                                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),

                                    hintText: "Enter Product Code",
                                    // counterText: widget.countertext,
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            InkWell(
                                onTap: () {
                                  Get.to(ScannerScreendesignation());
                                },
                                child: Icon(
                                  Icons.qr_code_2,
                                  size: 40,
                                ))
                          ],
                        ),
                        CommonTextFieldCrete(
                          validation: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter asset name';
                            }
                            return null;
                          },
                          textname: "Name",
                          controller: createproduct.assetsname,
                          hintText: 'Enter Asset Name',
                          isPasswordField: false,
                        ),
                        Row(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CommonTextFieldCrete(
                                validation: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter quantity';
                                  }
                                  return null;
                                },
                                textname: "Quantity",
                                controller: createproduct.quantity,
                                hintText: 'Enter Quantity',
                                isPasswordField: false,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: CommonTextFieldCrete(
                                readonly: true,
                                textname: "UOM",
                                controller: uom,
                                // countertext: "Pcs",
                                hintText: 'Enter UOM',
                                isPasswordField: false,
                              ),
                            ),
                          ],
                        ),
                        CommonTextFieldCrete(
                          textname: "Remark",
                          controller: createproduct.remark,
                          hintText: 'Enter Remark',
                          isPasswordField: false,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Upload Photo",
                                style: TextStyle(
                                    // fontFamily: 'gilroy',
                                    fontSize:
                                        screenheight(context, dividedby: 50),
                                    color: lablecolor,
                                    fontWeight: FontWeight.w500),
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.resolveWith(
                                              (states) => EdgeInsets.zero),
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => purple)),
                                  onPressed: () {
                                    pickgallarycamera();
                                  },
                                  child: Icon(Icons.camera_alt_outlined))
                            ],
                          ),
                        ),
                        profilepic != null
                            ? Row(
                                children: [
                                  Card(
                                      elevation: 3,
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(profilepic!))),
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          profilepic = null;
                                        });
                                      },
                                      icon: Icon(Icons.clear))
                                ],
                              )
                            : SizedBox.shrink(),
                        SizedBox(
                          height: 8,
                        ),
                        CustomButton(
                          name: 'Save And Continue',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await createproduct.creteproduct(
                                  photo: profilepic);
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Future<String> pickPhotoAndConvertToBase64(dynamic photo) async {
    if (photo != null) {
      final bytes = await photo.readAsBytes();
      final base64Image = base64Encode(bytes);
      return base64Image;
    }
    return "";
  }

  pickgallarycamera() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 195,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Change option".tr,
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff909196).withOpacity(1)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    Get.back();
                    pickcoverimagecamera();
                  },
                  child: Container(
                    height: 40,
                    child: Row(
                      children: [
                        Center(
                            child: Icon(Icons.camera_alt,
                                color: Color(0xff909196).withOpacity(1))),
                        const SizedBox(
                          width: 18,
                        ),
                        Center(
                            child: Text("Camera".tr,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Get.back();

                    pickcoverimagegallary();
                  },
                  child: Container(
                    height: 40,
                    child: Row(
                      children: [
                        Center(
                            child: Icon(Icons.image_rounded,
                                color: Color(0xff909196).withOpacity(1))),
                        SizedBox(
                          width: 18,
                        ),
                        Center(
                          child: Text(
                            "Gallery".tr,
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    child: Row(
                      children: [
                        Center(
                          child: Icon(
                            Icons.cancel,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Center(
                          child: Text(
                            "Close".tr,
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
