import 'package:inventory/inventory.dart';

class CommonTextField extends StatefulWidget {
  final Widget prefixicon;

  const CommonTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPasswordField = true,
    required this.prefixicon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool isPasswordField = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        // color: Colors.blueGrey.withOpacity(0.3),
        border: Border.all(width: 2, color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: TextField(
        controller: widget.controller,
        obscureText: isPasswordField,
        decoration: InputDecoration(
          fillColor: purple,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          border: InputBorder.none,
          hintText: widget.hintText,
          prefixIcon: widget.prefixicon,
          suffixIcon: widget.isPasswordField
              ? CustomIconButton(
                  onPressed: (val) => setState(() => isPasswordField = val),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
