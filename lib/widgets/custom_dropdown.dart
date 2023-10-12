import 'package:flutter/material.dart';
import 'package:inventory/model/locationlistmodel.dart';
export '../../widgets/helper.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {Key? key, required this.result, required this.onSelection})
      : super(key: key);

  final List<Datum> result;
  final void Function(String?) onSelection;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  void initState() {
    // TODO: implement initState
    valueNotifier = ValueNotifier<String>(widget.result.first.locationCode ?? "");
    super.initState();
  }

  late final ValueNotifier<String> valueNotifier;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade600.withOpacity(0.5),
              blurRadius: 2,
              spreadRadius: 0.2,
              offset: const Offset(1, 1)),
        ],
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, value, child) => DropdownButton<String>(
            isExpanded: true,
            underline: Container(),
            value: value,
            items: widget.result
                .map<DropdownMenuItem<String>>(
                  (element) => DropdownMenuItem<String>(
                    value: element.locationCode,
                    child: Text(
                        '${element.locationName} ${element.locationCode}'),
                  ),
                )
                .toList(),
            onChanged: (value) {
              widget.onSelection(value);
              valueNotifier.value = widget.result
                  .where((element) => element.locationCode!.contains(value!))
                  .toList()[0]
                  .locationCode!;
            },
          ),
        ),
      ),
    );
  }
}
