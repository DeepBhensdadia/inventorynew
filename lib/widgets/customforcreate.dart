import 'package:inventory/inventory.dart';

class CommonTextFieldCrete extends StatefulWidget {
  final Widget? prefixicon;

  final String? Function(String?)? validation;

  const CommonTextFieldCrete({
    Key? key,
    this.controller,
    this.hintText,
    this.textname,
    this.countertext,
    this.isPasswordField = true,
    this.readonly = false,
    this.prefixicon,
    this.validation,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final String? textname;
  final String? countertext;
  final bool isPasswordField;
  final bool readonly;

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
                color: lablecolor,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            // padding: const EdgeInsets.symmetric(horizontal: 10.0),
            // decoration: BoxDecoration(
            //   // color: Colors.blueGrey.withOpacity(0.3),
            //   border: Border.all(width: 1, color: Colors.grey.withOpacity(0.8)),
            //   borderRadius: BorderRadius.circular(6.0),
            // ),
            child: TextFormField(
              // autofocus: true,
              readOnly: widget.readonly,
              controller: widget.controller,
              obscureText: isPasswordField,
              validator: widget.validation,
              decoration: InputDecoration(
                fillColor: purple,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(6)),
                // enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.grey.shade500),borderRadius: BorderRadius.circular(6)),
                // disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.grey.shade500),borderRadius: BorderRadius.circular(6)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(6)),
                // focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.grey.shade500),borderRadius: BorderRadius.circular(6)),
                // errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.grey.shade500),borderRadius: BorderRadius.circular(6)),
                hintText: widget.hintText,
                // counterText: widget.countertext,
                prefixIcon: widget.prefixicon,
                suffixIcon: widget.isPasswordField
                    ? CustomIconButton(
                        onPressed: (val) =>
                            setState(() => isPasswordField = val),
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
