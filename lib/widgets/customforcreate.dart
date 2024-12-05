import 'package:inventory/inventory.dart';

class CommonTextFieldCrete extends StatefulWidget {
  final Widget? prefixicon;

  final String? Function(String?)? validation;

  final TextInputType? keyboardtype;

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
    this.focusnood,
    this.keyboardtype,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final String? textname;
  final String? countertext;
  final bool isPasswordField;
  final bool readonly;
  final FocusNode? focusnood;

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
              // initialValue: widget.countertext ?? "",
              focusNode: widget.focusnood,
              readOnly: widget.readonly,
              controller: widget.controller,
              obscureText: isPasswordField,
              validator: widget.validation,
              keyboardType: widget.keyboardtype,
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

class CommonDropDown extends StatefulWidget {
  final List<DropdownMenuItem<String>>? count;

  final void Function(String?)? onchange;

  final String? Function(String?)? validator;
  final String? initialValue;
  final String? textname;

  const CommonDropDown(
      {super.key,
      this.count,
      this.onchange,
      this.validator,
      this.initialValue,
      this.textname});

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
            decoration: BoxDecoration(
              // color: Colors.blueGrey.withOpacity(0.3),
              border: Border.all(width: 1, color: Colors.black38),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: DropdownButtonFormField<String>(
              iconSize: 0,
              validator: widget.validator,
              onChanged: widget.onchange,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              ),
              decoration: InputDecoration(
                // enabled: false,
                isDense: true,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                floatingLabelAlignment: FloatingLabelAlignment.center,
              ),
              style: TextStyle(color: Colors.black, fontSize: 16),
              value: widget.initialValue,
              items: widget.count,
            ),
          ),
        ],
      ),
    );
  }
}
