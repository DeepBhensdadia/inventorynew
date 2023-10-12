import 'package:inventory/inventory.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    context.loaderOverlay.hide();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png",height: 100,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 5,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign',
                            style: TextStyle(
                                fontSize: screenheight(context, dividedby: 32),
                                fontFamily: 'gilroy.bold'),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                color: Colors.purple,
                                width: 3,
                              ),
                            )),
                            child: Text(
                              ' In',
                              style: TextStyle(
                                fontSize: screenheight(context, dividedby: 32),
                                fontFamily: 'gilroy.bold',
                              ),
                            ),
                          ),
                        ],
                      ),
SizedBox(height: 45,),
                      CommonTextField(
                        controller: loginController.email,
                        hintText: 'Enter Email',
                        isPasswordField: false,
                        prefixicon: const Icon(Icons.person, color: Colors.purple),
                      ),
                      SizedBox(
                        height: screenheight(context, dividedby: 40),
                      ),
                      CommonTextField(
                        controller: loginController.password,
                        hintText: 'Password',
                        prefixicon: const Icon(
                          Icons.lock,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(
                        height: screenheight(context, dividedby: 20),
                      ),
                      CustomButton(
                        name: 'Login',
                        onPressed: () {
                          context.loaderOverlay.show();

                          loginController.login();
                          loginController.email.clear();
                          loginController.password.clear();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
