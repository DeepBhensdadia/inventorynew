import 'package:inventory/model/login_model.dart';
import '../inventory.dart';

class Drawer_Name extends StatelessWidget {
  const Drawer_Name({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Login loginDetailsFromLocalData =
    //     loginFromJson(SharedPref.get(prefKey: PrefKey.loginDetails)!);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(screenheight(context, dividedby: 50)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                child: Text(
                 "Ivapp",
                  style: TextStyle(
                      fontSize: screenheight(context, dividedby: 40),
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                  maxLines: 2,
                ),
              ),
            ]),
          ),
          const Divider(
            indent: 18,
            endIndent: 18,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
