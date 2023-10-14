import 'package:flutter/cupertino.dart';
import 'package:inventory/inventory.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Color? colorsname;

  const CustomButton({Key? key, required this.onPressed, required this.name, this.colorsname = lablecolor})
      : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: double.infinity,
        decoration:  BoxDecoration(
          color: colorsname,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xffA44D80),
          //     Color(0xff75689E),
          //   ],
          // ),
        ),
        child: CupertinoButton(
          padding: const EdgeInsets.all(8),
          onPressed: onPressed,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
