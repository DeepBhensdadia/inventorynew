import 'package:inventory/inventory.dart';
import '../../widgets/customforcreate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    context.loaderOverlay.hide();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      shape: boarderad,
                      elevation: 5,
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: screenheight(context, dividedby: 32),
                                  fontFamily: 'gilroy.bold'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CommonTextFieldCrete(
                              validation: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              },
                              textname: "Email",
                              controller: loginController.email,
                              hintText: 'Enter Email',
                              isPasswordField: false,
                              prefixicon: const Icon(Icons.person, color: purple),
                            ),
                            CommonTextFieldCrete(
                              validation: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              textname: "password",
                              controller: loginController.password,
                              hintText: 'Password',
                              prefixicon: const Icon(
                                Icons.lock,
                                color: purple,
                              ),
                            ),
                            SizedBox(
                              height: screenheight(context, dividedby: 20),
                            ),
                            CustomButton(
                              name: 'Login',
                              onPressed: () {
                     if(_formKey.currentState!.validate()){
                       context.loaderOverlay.show();

                       loginController.login();
                       // loginController.email.clear();
                       // loginController.password.clear();
                     }
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
          ),
        ),
      ),
    );
  }
}
