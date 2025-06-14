import 'package:flutter/cupertino.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/getxcontroller/updatedhistorycontroller.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/scannerdesignation/productsscreen.dart';
import 'package:inventory/src/Asset/asset_screen.dart';
import 'package:inventory/src/home/barcodescanner.dart';
import 'package:inventory/src/storecode/store_code_screen.dart';
import 'package:inventory/widgets/customforcreate.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
import '../../drawer/drawer.dart';
import '../../widgets/custom_dropdown.dart';
import 'package:inventory/getxcontroller/locationcontroller.dart';
import 'package:inventory/getxcontroller/productcontroller.dart';
import '../scanner/scanner_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    logincontroller.logincheck();
    super.initState();
  }

  LoginController logincontroller = Get.put(LoginController());
  ProductController procontroller = Get.put(ProductController());
  ProductControllerwithQr controllerqrwork = Get.put(ProductControllerwithQr());
  ProductUpdatedHistoryController historycontroller =
      Get.put(ProductUpdatedHistoryController());
  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  String barcodeResult = '';

  Future<void> scanBarcode(BuildContext context) async {
    // String qrcode = await Get.to(BarcodeScannerScreen());
    String? res = await SimpleBarcodeScanner.scanBarcode(
      context,
      barcodeAppBar: const BarcodeAppBar(
        enableBackButton: true,
        backButtonIcon: Icon(Icons.arrow_back_ios),
      ),

      isShowFlashIcon: true,
      cameraFace: CameraFace.back,
    );
    if(res != "-1") {
      controllerqrwork.detailsscreen(res ?? "");
    }
  }

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
        // aspectRatioPresets: [
        //   CropAspectRatioPreset.square,
        //   CropAspectRatioPreset.ratio3x2,
        //   CropAspectRatioPreset.original,
        //   CropAspectRatioPreset.ratio4x3,
        //   CropAspectRatioPreset.ratio16x9,
        // ],
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
        controllerqrwork.detailsscreen(results.join('\n'));
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
    context.loaderOverlay.hide();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        key: _globalKey,
        // drawer: const Drawer(child: DrawerStaff()),
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Confirm Logout",
                          style: TextStyle(fontSize: 25, color: Colors.red)),
                      content: Text('Are you sure you want to logout?'),
                      actions: [
                        Container(
                          decoration: BoxDecoration(
                            color: lablecolor,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color(0xffA44D80),
                            //     Color(0xff75689E),
                            //   ],
                            // ),
                          ),
                          child: CupertinoButton(
                            minSize: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Cancel",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: lablecolor,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Color(0xffA44D80),
                            //     Color(0xff75689E),
                            //   ],
                            // ),
                          ),
                          child: CupertinoButton(
                            minSize: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            onPressed: () {
                              SharedPref.deleteAll();
                              Get.deleteAll();
                              Get.offAll(() => const LoginScreen());
                            },
                            child: Text(
                              "Logout",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.logout)),
            // IconButton(
            //     onPressed: () {
            //       Get.to(const ProductsScreen());
            //     },
            //     icon: const Icon(Icons.add_circle_outline))
          ],
          iconTheme: const IconThemeData(color: white, size: 30),
          backgroundColor: purple,
          elevation: 5,
          toolbarHeight: 60,
          title: Row(
            children: [
              Image.asset(
                  height: 35,
                  width: 35,
                  "assets/images/WhatsApp Image 2023-10-13 at 12.44.38 PM.png"),
              const SizedBox(
                width: 20,
              ),
              const Text(
                "Tag my assets",
                style: TextStyle(
                    fontSize: 22,
                    // fontWeight: FontWeight.w600,
                    color: white),
              ),
            ],
          ),
        ),
        body: GetBuilder<LocatioController>(
          builder: (locationController) => SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    shape: boarderad,
                    elevation: 3,
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                            child: const Center(
                              child: Icon(Icons.person,
                                  color: Colors.grey, size: 35),
                            ),
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            radius: 25),
                        title: Text(saveUser()?.data?.name ?? "",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                saveUser()?.data?.roleDesignation == "2"
                                    ? "Auditor"
                                    : "Admin",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                            // Text("${saveUser()?.data?.email}" ?? "",
                            //     style: TextStyle(
                            //         fontSize: 14, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    shape: boarderad,
                    elevation: 3,
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListTile(
                        visualDensity: VisualDensity.compact,
                        onTap: () {
                          logincontroller.pdfurlcheck();
                        },
                        title: Text("AUTHORIZATION LETTER",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        trailing: Text("VIEW",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: lablecolor)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    shape: boarderad,
                    margin: EdgeInsets.zero,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(height: 20),
                          Text(
                            'Current Selected Company',
                            style: TextStyle(
                                fontSize: screenheight(context, dividedby: 50),
                                color: lablecolor,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              AlertDialog dialog = AlertDialog(
                                title: Text('Do You Want To Change Company',
                                    style: TextStyle(
                                      fontSize:
                                          screenheight(context, dividedby: 50),
                                      fontFamily: 'gilroy.bold',
                                    )),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      SharedPref.deleteSpecific(
                                          prefKey: PrefKey.companyDetails);
                                      Get.offAll(const StoreCode());
                                    },
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                          fontSize: screenheight(context,
                                              dividedby: 50),
                                          fontFamily: 'gilroy.bold',
                                          color: purple),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                          fontSize: screenheight(context,
                                              dividedby: 50),
                                          fontFamily: 'gilroy.bold',
                                          color: purple),
                                    ),
                                  ),
                                ],
                              );

                              showDialog(
                                context: context,
                                builder: (context) => dialog,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          Colors.grey.shade600.withOpacity(0.5),
                                      blurRadius: 2,
                                      spreadRadius: 0.2,
                                      offset: const Offset(1, 1)),
                                ],
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' ${comapnydetails()?.data?.companyName}',
                                        // 'Generation Next \n Althan,Surat',
                                        style: TextStyle(
                                            fontSize: screenheight(context,
                                                dividedby: 50),
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                        maxLines: 2,
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down,
                                        size: 30,
                                      ),
                                    ]),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
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
                            CommonTextFieldCrete(
                              focusnood: focusNode,
                              validation: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter asset number';
                                }
                                return null;
                              },
                              textname: "Enter Asset No.",
                              controller: procontroller.assetnumber,
                              hintText: 'Enter Your Assets No.',
                              isPasswordField: false,
                            ),
                            const SizedBox(height: 30),
                            CustomButton(
                                name: 'Submit',
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    focusNode.unfocus();
                                    // Get.to(AssetScreen());
                                    context.loaderOverlay.show();
                                    await procontroller.detailsscreen();
                                  }
                                }),
                            Divider(
                              thickness: 2,
                              height: 40,
                              color: Colors.grey.shade300,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                      colorsname: purple,
                                      name: 'Scan QR',
                                      onPressed: () => scanBarcode(context)),
                                ),
                                Expanded(
                                  child: CustomButton(
                                      colorsname: purple,
                                      name: 'Number Plate',
                                      onPressed: () => _pickAndProcessImage()),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 2,
                              height: 40,
                              color: Colors.grey.shade300,
                            ),
                            CustomButton(
                                name: 'History',
                                onPressed: () async {
                                  await historycontroller.historyapi();
                                  Get.to(HistoryScreen());
                                }),
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
      ),
    );
  }
}
