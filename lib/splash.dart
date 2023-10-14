import 'package:inventory/inventory.dart';
import 'src/storecode/store_code_screen.dart';
import 'package:inventory/getxcontroller/locationcontroller.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    checkInternet();
    super.initState();
  }
  LocatioController locationcontroll = Get.put(LocatioController());
  void checkInternet() async {
    // context.loaderOverlay.show();
    if (await InternetConnectionChecker().hasConnection) {
      Future.delayed(const Duration(seconds: 2), () async {
        if (SharedPref.get(prefKey: PrefKey.loginDetails) != null) {
          if (SharedPref.get(prefKey: PrefKey.companyDetails) != null) {
            // context.loaderOverlay.show();
            locationcontroll.Location();
            context.loaderOverlay.hide();
          } else {
            Get.off(const StoreCode());
            context.loaderOverlay.hide();
          }
        }else{
          Get.off(const LoginScreen());
        }
      });
    } else {
      SnackBar snackBar = const SnackBar(
        content: Text('No Internet'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      context.loaderOverlay.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
