import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/getxcontroller/productcreatecontroller.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/model/createproductslistmodel.dart';
import 'package:inventory/scannerdesignation/scannerscreen.dart';
import 'package:inventory/src/home/barcodescanner.dart';
import 'package:inventory/widgets/customforcreate.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

import '../getxcontroller/assetsupdatecontroller.dart';
import '../getxcontroller/locationcontroller.dart';
import '../widgets/custom_dropdown.dart';

class CreateProduct extends StatefulWidget {
  final Datum? product;
  final String? locationname;
  const CreateProduct({
    super.key,
    this.product,
    this.locationname,
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
  @override
  void initState() {
    // TODO: implement initState
    createproduct.getCurrentLocation();
    createproduct.itemcode.clear();
    createproduct.qrcode.clear();
    createproduct.assetsname.clear();
    createproduct.sublocation.clear();
    createproduct.quantity.text = "1";
    createproduct.remark.clear();
    createproduct.qrcode.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    if (widget.product != null) {
      createproduct.itemcode.text = widget.product?.itemCode ?? "";
      createproduct.qrcode.text = widget.product?.productCode ?? "";
      createproduct.assetsname.text = widget.product?.asset ?? '';
      createproduct.quantity.text = widget.product?.quantity ?? "";
      createproduct.remark.text = widget.product?.remark ?? "";
      createproduct.sublocation.text = widget.product?.subLocation ?? "";
    }
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  List values = [
    "PC",
    "BUN",
    "ROL",
    "PAC",
    "BOX",
    "CAR",
    "SET",
    "BAG",
    "BUK",
    "FT2",
    "G",
    "DR",
    "PAA",
    "M",
    "SHT",
  ];

  String barcodeResult = '';

  Future<void> scanBarcode(BuildContext context) async {
    String? res = await SimpleBarcodeScanner.scanBarcode(
      context,
      barcodeAppBar: const BarcodeAppBar(
        enableBackButton: true,
        backButtonIcon: Icon(
          Icons.arrow_back_ios,
        ),
      ),
      isShowFlashIcon: true,
      cameraFace: CameraFace.back,
    );
    setState(() {
      createproduct.qrcode.text = res as String;
    });
  }

  String _selectedOption = 'QR Code';
  final ImagePicker _picker = ImagePicker();
  List<String> data = [];

  Future<void> _pickAndProcessImage() async {
    try {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.camera);
      if (pickedImage == null) return;

      print('Picked Image Path: ${pickedImage.path}');

      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: purple,
            toolbarWidgetColor: Colors.white,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Crop Image',
          ),
        ],
      );

      if (croppedFile == null) return;

      // Debug: Log cropped image path
      print('Cropped Image Path: ${croppedFile.path}');

      final inputImage = InputImage.fromFilePath(croppedFile.path);
      final textRecognizer = TextRecognizer();

      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      // data = recognizedText.text.split('\n');

      final regex = RegExp(r'[A-Z]{2}\d{2}[A-Z]{2}\d{4}');
      final matches = regex.allMatches(recognizedText.text);
      final results = matches.map((match) => match.group(0)).toList();
      if (results.isNotEmpty) {
        setState(() {
          // data = recognizedText.text.split('\n');
          createproduct.qrcode.text = results.join('\n');
        });
      } else {
        Fluttertoast.showToast(msg: "Number Plate Not Found Please Try Again.");
      }

      // setState(() {
      //   _recognizedText = recognizedText.text.isNotEmpty
      //       ? recognizedText.text
      //       : "No text found in the image.";
      // });

      // Close the text recognizer
      textRecognizer.close();
    } catch (e) {
      print("Error occurred: $e");
      Fluttertoast.showToast(msg: "Error occurred: $e");
      print('Error: $e');
    }
  }

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
          title: Column(
            children: [
              Text(
                widget.product != null ? "Edit Product" : "Create Product",
                style: TextStyle(
                    fontSize: 22,
                    // fontWeight: FontWeight.w600,
                    color: white),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => Card(
                    margin: const EdgeInsets.all(5),
                    shape: boarderad,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: ListTile(
                        title: Text(
                          createproduct.placeName.value,
                        ),
                        subtitle: Text(
                            "Latitude:${createproduct.position?.latitude}  Longitude:${createproduct.position?.longitude}"),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: boarderad,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Select Location',
                              style: TextStyle(
                                  // fontFamily: 'gilroy',
                                  fontSize:
                                      screenheight(context, dividedby: 50),
                                  color: lablecolor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          // const SizedBox(height: 10),
                          GetBuilder<LocatioController>(
                            builder: (locationController) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 8),
                              child: locationController
                                      .weblocation.data!.isEmpty
                                  ? Container(
                                      alignment: Alignment.centerLeft,
                                      height:
                                          screenheight(context, dividedby: 20),
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
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          'No Location',
                                          style: TextStyle(
                                              fontSize: screenheight(context,
                                                  dividedby: 45),
                                              fontFamily: 'gilroy.bold',
                                              color: Colors.grey.shade400),
                                        ),
                                      ),
                                    )
                                  : CustomDropDown(
                                      initialid: createproduct.locationid != ""
                                          ? createproduct.locationid
                                          : null,
                                      result:
                                          locationController.weblocation.data!,
                                      onSelection: (var value) {
                                        createproduct.locationid =
                                            value.toString();
                                        print(value.toString());
                                      },
                                    ),
                            ),
                          ),
                          CommonTextFieldCrete(
                            // validation: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Please enter item code';
                            //   }
                            //   return null;
                            // },
                            textname: "Item Code",
                            controller: createproduct.itemcode,
                            hintText: 'Enter Item Code',
                            isPasswordField: false,
                          ),
                          Row(
                            children: [
                              // Radio Button for Option 1
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    createproduct.qrcode.clear();
                                    setState(() {
                                      _selectedOption = 'QR Code';
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Radio<String>(
                                        value: 'QR Code',
                                        groupValue: _selectedOption,
                                        onChanged: (String? value) {
                                          createproduct.qrcode.clear();

                                          setState(() {
                                            _selectedOption = value!;
                                          });
                                        },
                                      ),
                                      Text('QR Code'),
                                    ],
                                  ),
                                ),
                              ),
                              // Radio Button for Option 2
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    createproduct.qrcode.clear();
                                    setState(() {
                                      _selectedOption = 'Number Plate';
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Radio<String>(
                                        value: 'Number Plate',
                                        groupValue: _selectedOption,
                                        onChanged: (String? value) {
                                          createproduct.qrcode.clear();

                                          setState(() {
                                            _selectedOption = value!;
                                          });
                                        },
                                      ),
                                      Text('Number Plate'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _selectedOption,
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
                                        return 'Please enter $_selectedOption';
                                      }
                                      return null;
                                    },
                                    controller: createproduct.qrcode,
                                    decoration: InputDecoration(
                                      fillColor: purple,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Colors.grey.shade500),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      // enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.grey.shade500),borderRadius: BorderRadius.circular(6)),
                                      // disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.grey.shade500),borderRadius: BorderRadius.circular(6)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Colors.grey.shade500),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 15),

                                      hintText: "Enter $_selectedOption",
                                      // counterText: widget.countertext,
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   width: 10,
                              // ),
                              _selectedOption == "QR Code"
                                  ? InkWell(
                                      onTap: () => scanBarcode(context),
                                      child: Icon(
                                        Icons.qr_code_2,
                                        size: 40,
                                      ))
                                  : InkWell(
                                      onTap: () => _pickAndProcessImage(),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 40,
                                      ))
                            ],
                          ),
                          CommonTextFieldCrete(
                            // validation: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Please enter asset name';
                            //   }
                            //   return null;....
                            // },
                            textname: "Name",
                            controller: createproduct.assetsname,
                            hintText: 'Enter Asset Name',
                            isPasswordField: false,
                          ),
                          CommonTextFieldCrete(
                            validation: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Sub Location';
                              }
                              return null;
                            },
                            textname: "Sub Location",
                            controller: createproduct.sublocation,
                            hintText: 'Enter Sub Location',
                            isPasswordField: false,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  child: CommonDropDown(
                                    textname: "UOM",
                                    initialValue: "PC",
                                    count: List.generate(
                                      values.length,
                                      (index) => DropdownMenuItem<String>(
                                          value: values[index],
                                          child: Text(values[index])),
                                    ).toList(),
                                    onchange: (p0) {
                                      createproduct.uom.text = p0.toString();
                                    },
                                  )
                                  // CommonTextFieldCrete(
                                  //   readonly: true,
                                  //   textname: "UOM",
                                  //   controller: uom,
                                  //   // countertext: "Pcs",
                                  //   hintText: 'Enter UOM',
                                  //   isPasswordField: false,
                                  // ),
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
                                                  image:
                                                      FileImage(profilepic!))),
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
                                await widget.product != null
                                    ? createproduct.editproduct(
                                        photo: profilepic,
                                        productId:
                                            widget.product?.id.toString() ?? '')
                                    : createproduct.creteproduct(
                                        photo: profilepic,
                                      );
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
              ],
            ),
          ),
        ),
      ),
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
