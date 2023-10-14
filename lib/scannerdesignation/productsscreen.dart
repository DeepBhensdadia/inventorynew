import 'package:flutter/foundation.dart';
import 'package:inventory/getxcontroller/locationcontroller.dart';
import 'package:inventory/getxcontroller/productcontroller.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/scannerdesignation/createinventory.dart';
import 'package:inventory/scannerdesignation/createproduct.dart';
import 'package:inventory/src/storecode/store_code_screen.dart';
import 'package:inventory/widgets/custom_dropdown.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                width: 15,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Card(
                  shape: boarderad,
                  elevation: 3,
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          radius: 25,
                          child: const Center(
                            child: Icon(Icons.person,
                                color: Colors.grey, size: 35),
                          )),
                      title:  Text("${saveUser()?.data?.name}" ?? "",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Scanner",
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
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Card(
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
                          child: data.isEmpty
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
                                    if (kDebugMode) {
                                      print(value.toString());
                                    }
                                  },
                                ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7),
                child: Card(
                  shape: boarderad,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(height: 20),
                        // Text(
                        //   'Create Inventory',
                        //   style: TextStyle(
                        //       fontSize: screenheight(context, dividedby: 50),
                        //       color: Colors.purple,fontWeight: FontWeight.w500),
                        // ),
                        // const SizedBox(height: 15),
                        // CustomButton(
                        //     name: 'Create Inventory',
                        //     onPressed: () async {
                        //       Get.to(const CreateInventory());
                        //     }),
                        // const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Create Product',
                              style: TextStyle(
                                  // fontFamily: 'gilroy',
                                  fontSize:
                                      screenheight(context, dividedby: 50),
                                  color: lablecolor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        CustomButton(
                            name: 'Create Product',
                            onPressed: () async {
                              Get.to(const CreateProduct());
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
    );
  }
}
