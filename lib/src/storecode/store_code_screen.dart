import 'package:inventory/getxcontroller/storecontroller.dart';
import 'package:inventory/widgets/customforcreate.dart';
import '../../inventory.dart';

class StoreCode extends StatelessWidget {
  const StoreCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StoreController storeController = Get.put(StoreController());
    final _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 200,
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      shape: boarderad,
                      margin: EdgeInsets.zero,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Select your Company',
                                  style: TextStyle(
                                      fontFamily: 'gilroy.bold',
                                      fontSize:
                                          screenheight(context, dividedby: 30)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CommonTextFieldCrete(
                              validation: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter company code';
                                }
                                return null;
                              },
                              textname: "Enter Your Company Code",
                              controller: storeController.codecontroller,
                              hintText: 'Company Code',
                              isPasswordField: false,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              onPressed: () async {
                                if (storeController
                                    .codecontroller.text.isNotEmpty) {
                                  context.loaderOverlay.show();
                                  await storeController.storecode();
                                  storeController.codecontroller.clear();
                                }else{
                                  Fluttertoast.showToast(msg: "Please Enter Company code");
                                }
                                // Get.to(HomeScreen());
                              },
                              name: 'Select',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
