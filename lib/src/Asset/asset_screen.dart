import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/getxcontroller/assetsupdatecontroller.dart';
import 'package:inventory/getxcontroller/productcontroller.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/widgets/customforcreate.dart';

import '../../getxcontroller/locationcontroller.dart';
import '../../model/productdetailsmodel.dart';
import '../../widgets/custom_dropdown.dart';

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
      // File convertedFile = File(Selectedimage.path);
      if (profilepic.length == 3) {
        Fluttertoast.showToast(msg: "Only 3 Images select");
      } else {
        setState(() {
          profilepic.add(Selectedimage);
        });
      }

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
      // File convertedFile = File(Selectedimage.path);
      if (profilepic.length == 3) {
        Fluttertoast.showToast(msg: "Only 3 Images select");
      } else {
        setState(() {
          profilepic.add(Selectedimage);
        });
      }

      // Fluttertoast.showToast(msg: "Image Selected");
    } else {
      // Fluttertoast.showToast(msg: "Image Not Selected");
    }
  }

  ProductController homeController = Get.put(ProductController());
  AssetsUpdateController assetcontroller = Get.put(AssetsUpdateController());
  LocatioController locationController = Get.put(LocatioController());
  ProductController procontroller = Get.put(ProductController());

  List<XFile> profilepic = [];
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    assetcontroller.quantity.clear();
    assetcontroller.commet.clear();
    if (locationController.weblocation.data!.isNotEmpty) {
      procontroller.locationid =
          locationController.weblocation.data?.first.id.toString() ?? "";
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Product? product = homeController.assetDetails.data;
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl: product!.photos?.length == 0
                                    ? "$baseurlimage/default.png"
                                    : baseurlimage +
                                        (product.photos?[0].toString() ?? ""),
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
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Asset No :  ${product.assetno ?? ""}",
                                        maxLines: 5,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: subtitle,
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("${product.asset}",
                                        style: TextStyle(
                                            // overflow: TextOverflow.ellipsis,
                                            fontSize: screenwidth(context,
                                                dividedby: 10),
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Category :  ${product.category ?? ""}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: subtitle,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Location:  ${product.location ?? ""}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: subtitle,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Sub Location:  ${product.subLocation ?? ""}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: subtitle,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Serial No:  ${product.serial ?? ""}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: subtitle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // const Divider(
                          //   color: Colors.grey,
                          //   height: 50,
                          // ),
                          // Text(
                          //   "Available Quantity : ${product.quantity}",
                          //   style: const TextStyle(
                          //       fontSize: 20,
                          //       color: lablecolor,
                          //       fontWeight: FontWeight.w500),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  product.updateStatus == 1
                      ? (product.photos?.length ?? 0) > 1
                          ? Card(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              shape: boarderad,
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Photos",
                                        style: TextStyle(
                                            // fontFamily: 'gilroy',
                                            fontSize: screenheight(context,
                                                dividedby: 45),
                                            color: lablecolor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      height: 100,
                                      child: ListView.builder(
                                        itemCount: product.photos?.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: CachedNetworkImage(
                                            imageUrl: baseurlimage +
                                                (product.photos?[index]
                                                        .toString() ??
                                                    ""),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,

                                                  // colorFilter:
                                                  // ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                                ),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                image: const DecorationImage(
                                                  image: NetworkImage(
                                                      "$baseurlimage/default.png"),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox.shrink()
                      : Card(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          shape: boarderad,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                      SizedBox(
                                        height: 10,
                                      ),
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
                                                        color: Colors
                                                            .grey.shade600
                                                            .withOpacity(0.5),
                                                        blurRadius: 2,
                                                        spreadRadius: 0.2,
                                                        offset:
                                                            const Offset(1, 1)),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Text(
                                                    'No Location',
                                                    style: TextStyle(
                                                        fontSize: screenheight(
                                                            context,
                                                            dividedby: 45),
                                                        fontFamily:
                                                            'gilroy.bold',
                                                        color: Colors
                                                            .grey.shade400),
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
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // CommonTextFieldCrete(
                                //   // validation: (value) {
                                //   //   if (value!.isEmpty) {
                                //   //     return 'Please enter quantity';
                                //   //   }
                                //   //   return null;
                                //   // },
                                //   controller: assetcontroller.quantity,
                                //   countertext: "1",
                                //   textname: "Enter Updated Quantity",
                                //   hintText: 'Enter Updated Quantity',
                                //   isPasswordField: false,
                                // ),
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
                                profilepic.length != 0
                                    ? Container(
                                        height: 100,
                                        child: ListView.builder(
                                          itemCount: profilepic.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) => Row(
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
                                                                File(profilepic[
                                                                        index]
                                                                    .path)))),
                                                  )),
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      profilepic
                                                          .removeAt(index);
                                                    });
                                                  },
                                                  icon: const Icon(Icons.clear))
                                            ],
                                          ),
                                        ),
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
                                            locationid:
                                                procontroller.locationid,
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
