import 'package:inventory/inventory.dart';
import 'package:inventory/scannerdesignation/productsscreen.dart';
import 'package:inventory/src/storecode/store_code_screen.dart';
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
    controller.locationid =
        locationController.weblocation.data?.first.id.toString() ?? "";
    super.initState();
  }

  LocatioController locationController = Get.put(LocatioController());
  ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    context.loaderOverlay.hide();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: _globalKey,
      drawer: const Drawer(child: DrawerStaff()),
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const ProductsScreen());
              },
              icon: const Icon(Icons.add_circle_outline))
        ],
        iconTheme: const IconThemeData(color: Colors.purple, size: 30),
        backgroundColor: Colors.white,
        elevation: 0.5,
        toolbarHeight: 60,
        title: const SizedBox(
          width: 100,
          child: Image(
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 3,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        radius: 25),
                    title: Text(saveUser()?.data?.name ?? "",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("+91 ${saveUser()?.data?.mobileNumber}" ?? "",
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
                            color: Colors.purple,
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
                                  SharedPref.deleteSpecific(prefKey: PrefKey.companyDetails);
                                  Get.offAll(const StoreCode());
                                },
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                      fontSize:
                                          screenheight(context, dividedby: 50),
                                      fontFamily: 'gilroy.bold',
                                      color: Colors.purple),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                      fontSize:
                                          screenheight(context, dividedby: 50),
                                      fontFamily: 'gilroy.bold',
                                      color: Colors.purple),
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
                                  color: Colors.grey.shade600.withOpacity(0.5),
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
                                fontSize: screenheight(context, dividedby: 50),
                                color: Colors.purple,
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
                                height: screenheight(context, dividedby: 20),
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
                                  borderRadius: BorderRadius.circular(10),
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
                                result: locationController.weblocation.data!,
                                onSelection: (var value) {
                                  // controller.locationid = value.toString();
                                  print(value.toString());
                                },
                              ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 3,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: controller.assetnumber,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          hintText: 'Enter Your Asset No.',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: screenheight(context, dividedby: 55)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Colors.orange),
                              gapPadding: 0,
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                              name: 'Submit',
                              onPressed: () async {
                                context.loaderOverlay.show();
                                await controller.detailsscreen();
                              })
                        ],
                      ),

                      Divider(
                        thickness: 2,
                        height: 40,
                        color: Colors.grey.shade300,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                              name: 'Scan QR',
                              onPressed: () async {
                                Get.to(const ScannerScreen());
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
