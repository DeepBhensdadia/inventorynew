import 'package:inventory/getxcontroller/updatedhistorycontroller.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/scannerdesignation/productsscreen.dart';
import 'package:inventory/src/Asset/asset_screen.dart';
import 'package:inventory/src/storecode/store_code_screen.dart';
import 'package:inventory/widgets/customforcreate.dart';
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
    // logincontroller.logincheck();
    if (locationController.weblocation.data!.isNotEmpty) {
      procontroller.locationid =
          locationController.weblocation.data?.first.id.toString() ?? "";
    }
    super.initState();
  }

  LocatioController locationController = Get.put(LocatioController());
  LoginController logincontroller = Get.put(LoginController());
  ProductController procontroller = Get.put(ProductController());
  ProductUpdatedHistoryController historycontroller =
      Get.put(ProductUpdatedHistoryController());
  final _formKey = GlobalKey<FormState>();
FocusNode focusNode = FocusNode();
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
                  SharedPref.deleteAll();
                  Get.deleteAll();
                  Get.offAll(() => const LoginScreen());
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
                        onTap: () {},
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
                             Text( saveUser()?.data?.roleDesignation == "2" ? "Auditor" : "Admin",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Select Location',
                                style: TextStyle(
                                    // fontFamily: 'gilroy',
                                    fontSize:
                                        screenheight(context, dividedby: 50),
                                    color: lablecolor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            // padding: const EdgeInsets.all(5.0),
                            child: locationController.weblocation.data!.isEmpty
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
                                    result:
                                        locationController.weblocation.data!,
                                    onSelection: (var value) {
                                      procontroller.locationid = value.toString();
                                      print(value.toString());
                                    },
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
                            CustomButton(
                                colorsname: purple,
                                name: 'Scan QR',
                                onPressed: () async {
                                  Get.to(const ScannerScreen());
                                }),
                            Divider(
                              thickness: 2,
                              height: 40,
                              color: Colors.grey.shade300,
                            ),
                            CustomButton(
                                name: 'History',
                                onPressed: () async {
                                  await historycontroller.historyapi();
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
