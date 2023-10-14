import 'package:inventory/inventory.dart';

class Radiobutton extends StatelessWidget {
  final String name;

  final String stringname;

  final groupval;

  final onchanged;

  const Radiobutton({
    super.key,
    required this.name,
    required this.stringname,
    required this.groupval,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
            value: stringname,
            groupValue: groupval,
            onChanged: onchanged,
            fillColor: MaterialStateProperty.resolveWith((Set states) {
              if (states.contains(MaterialState.disabled)) {
                return purple.withOpacity(.32);
              }
              return purple;
            })),
        Text(
          name,
          style: TextStyle(
            // fontFamily: 'gilroy.semibold',
            fontSize: screenheight(context, dividedby: 55),
          ),
        )
      ],
    );
  }
}
