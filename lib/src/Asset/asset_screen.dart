import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/getxcontroller/productcontroller.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/widgets/customforcreate.dart';

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

  // ProductController homeController = Get.put(ProductController());
  File? profilepic;
  // final String data;
  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.all(20),
                  shape: boarderad,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        "assets/images/iphone_11_PNG42.png",
                                      ))),
                              height: 80,
                              width: 80,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Iphone 14 pro",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Item Code : I1234567",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: subtitle,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Category : Mobile",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: subtitle,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Location: Store",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: subtitle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 50,
                        ),
                        Text(
                          "Available Quantity : 120",
                          style: TextStyle(
                              fontSize: 20,color: lablecolor, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  shape: boarderad,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CommonTextFieldCrete(
                          textname: "Enter Updated Quantity",
                          hintText: 'Enter Updated Quantity',
                          isPasswordField: false,
                        ),
                        CommonTextFieldCrete(
                          textname: "Enter Remark",
                          hintText: 'Enter remark',
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
                            name: 'Update',
                            onPressed: () async {
                              // await assetController.updatedata();
                            }),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
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
// ${homeController.assetDetails?.result?.location}
