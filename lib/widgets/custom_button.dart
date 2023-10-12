import 'package:flutter/cupertino.dart';
import 'package:inventory/inventory.dart';

class CustomButton extends StatelessWidget {
  final String name;

  const CustomButton({Key? key, required this.onPressed, required this.name})
      : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenwidth(context, dividedby: 2.5),

      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(colors: [
            Color(0xffA44D80),
            Color(0xff75689E),
          ])),
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
    );
  }
}
