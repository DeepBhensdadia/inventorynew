import 'package:inventory/inventory.dart';

class CommonTextFieldCrete extends StatefulWidget {
  final Widget? prefixicon;

  const CommonTextFieldCrete({
    Key? key,
     this.controller,
     this.hintText,
     this.textname,
    this.isPasswordField = true,
     this.prefixicon,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final String? textname;
  final bool isPasswordField;

  @override
  State<CommonTextFieldCrete> createState() => _CommonTextFieldCreteState();
}

class _CommonTextFieldCreteState extends State<CommonTextFieldCrete> {
  bool isPasswordField = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           widget.textname ?? "",
            style: TextStyle(
              // fontFamily: 'gilroy',
                fontSize: screenheight(context, dividedby: 55),
                color: Colors.purple,fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              // color: Colors.blueGrey.withOpacity(0.3),
              border: Border.all(width: 1, color: Colors.black.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TextField(
              controller: widget.controller,
              obscureText: isPasswordField,
              decoration: InputDecoration(
                fillColor: Colors.purple,
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
          ),
        ],
      ),
    );
  }
}