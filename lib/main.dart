import 'package:flutter/services.dart';
import 'package:inventory/inventory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayOpacity: .9,
      overlayColor: Colors.grey.withOpacity(0.2),
      useDefaultLoading: false,
      overlayWidget: Center(
          child: LoadingAnimationWidget.fourRotatingDots(
              color: purple, size: 80)),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inventory App',
        // getPages: getPages,
        // initialRoute: Routes.splash,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade200,
          primarySwatch: Colors.blue,
        ),
        home: const Splash_Screen(),
      ),
    );
  }
}
// 9810559631
