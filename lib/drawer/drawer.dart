import 'package:inventory/inventory.dart';
import '../src/about.dart';
import '../src/contect.dart';
import '../widgets/Drawer_name.dart';
import '../widgets/drawer_widget.dart';

class DrawerStaff extends StatefulWidget {
  const DrawerStaff({Key? key}) : super(key: key);

  @override
  State<DrawerStaff> createState() => _DrawerStaffState();
}

class _DrawerStaffState extends State<DrawerStaff> {
  // final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: screenheight(context, dividedby: 12),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 3),
              shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.grey.shade400,
            ),
          ),
        ),
        SizedBox(
          height: screenheight(context, dividedby: 35),
        ),
        const Drawer_Name(),
        Drawer_Widget(
            name: 'Home',
            onTap: () {
              Navigator.pop(context);
            }),
        Drawer_Widget(
            name: 'About',
            onTap: () {
              context.loaderOverlay.show();
              Future.delayed(const Duration(milliseconds: 500),
                  () => Get.to(() => const About_Screen()));
            }),
        Drawer_Widget(
            name: 'History',
            onTap: () async {
              Get.to(HistoryScreen());
              // context.loaderOverlay.show();
              // await homeController.Historyqat();
            }),
        Drawer_Widget(
            name: 'Contact',
            onTap: () {
              context.loaderOverlay.show();
              Future.delayed(const Duration(milliseconds: 500),
                  () => Get.to(() => const Contect_Screen()));
            }),
        Drawer_Widget(
            name: 'Log Out',
            onTap: () {
              SharedPref.deleteAll();
              context.loaderOverlay.show();
              Future.delayed(const Duration(milliseconds: 500),
                  () => Get.offAll(() => const LoginScreen()));
            }),
      ],
    );
  }
}
