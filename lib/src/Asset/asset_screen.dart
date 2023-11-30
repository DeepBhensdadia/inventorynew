import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/getxcontroller/assetsupdatecontroller.dart';
import 'package:inventory/getxcontroller/productcontroller.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/widgets/customforcreate.dart';

import '../../model/productdetailsmodel.dart';

class AssetScreen extends StatefulWidget {
  const AssetScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  Future<void> pickcoverimagecamera() async {
    XFile? Selectedimage = await ImagePicker().pickImage(
      imageQuality: 25,
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
      imageQuality: 25,
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

  ProductController homeController = Get.put(ProductController());
  AssetsUpdateController assetcontroller = Get.put(AssetsUpdateController());
  File? profilepic;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    assetcontroller.quantity.clear();
    assetcontroller.commet.clear();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Product? product = homeController.assetDetails.data?.first;
    return SafeArea(
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: const [],
            iconTheme: const IconThemeData(color: white, size: 30),
            backgroundColor: purple,
            elevation: 5,
            toolbarHeight: 60,
            title: const Text(
              "Assets Details",
              style: TextStyle(
                  fontSize: 22,
                  // fontWeight: FontWeight.w600,
                  color: white),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    margin: const EdgeInsets.all(20),
                    shape: boarderad,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CachedNetworkImage(
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
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${product.asset}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("Item Code :  ${product.itemCode}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: subtitle,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Category :  ${product.category}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: subtitle,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Location:  ${product.location}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: subtitle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 50,
                          ),
                          Text(
                            "Available Quantity : ${product.quantity}",
                            style: const TextStyle(
                                fontSize: 20,
                                color: lablecolor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  product.updateStatus == 1
                      ? const SizedBox.shrink()
                      : Card(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          shape: boarderad,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CommonTextFieldCrete(
                                  validation: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter quantity';
                                    }
                                    return null;
                                  },
                                  controller: assetcontroller.quantity,
                                  textname: "Enter Updated Quantity",
                                  hintText: 'Enter Updated Quantity',
                                  isPasswordField: false,
                                ),
                                CommonTextFieldCrete(
                                  // validation: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Please enter remark';
                                  //   }
                                  //   return null;
                                  // },
                                  controller: assetcontroller.commet,
                                  textname: "Enter Remark",
                                  hintText: 'Enter remark',
                                  isPasswordField: false,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Upload Photo",
                                        style: TextStyle(
                                            // fontFamily: 'gilroy',
                                            fontSize: screenheight(context,
                                                dividedby: 50),
                                            color: lablecolor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              padding: MaterialStateProperty
                                                  .resolveWith((states) =>
                                                      EdgeInsets.zero),
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith(
                                                          (states) => purple)),
                                          onPressed: () {
                                            pickgallarycamera();
                                          },
                                          child: const Icon(
                                              Icons.camera_alt_outlined))
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
                                                        image: FileImage(
                                                            profilepic!))),
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  profilepic = null;
                                                });
                                              },
                                              icon: const Icon(Icons.clear))
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomButton(
                                    name: 'Update',
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await assetcontroller.updatequantity(
                                          assetid: product.id.toString(),
                                            photo: profilepic);
                                      }
                                    }),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
          )),
    );
  }

  pickgallarycamera() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
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
                          color: const Color(0xff909196).withOpacity(1)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    Get.back();
                    pickcoverimagecamera();
                  },
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Center(
                            child: Icon(Icons.camera_alt,
                                color: const Color(0xff909196).withOpacity(1))),
                        const SizedBox(
                          width: 18,
                        ),
                        Center(
                            child: Text("Camera".tr,
                                style: const TextStyle(
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
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Center(
                            child: Icon(Icons.image_rounded,
                                color: const Color(0xff909196).withOpacity(1))),
                        const SizedBox(
                          width: 18,
                        ),
                        Center(
                          child: Text(
                            "Gallery".tr,
                            style: const TextStyle(
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
                const SizedBox(
                  height: 7,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        const Center(
                          child: Icon(
                            Icons.cancel,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Center(
                          child: Text(
                            "Close".tr,
                            style: const TextStyle(
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
                const SizedBox(
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
// ${homeController.assetDetails?.result?.location}
