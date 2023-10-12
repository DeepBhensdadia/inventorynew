import 'package:flutter/material.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/widgets/customforcreate.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        iconTheme: const IconThemeData(color: Colors.purple, size: 30),
        backgroundColor: Colors.white,
        elevation: 0.5,
        toolbarHeight: 60,
        title: const Text(
          "Create Product",
          style: TextStyle(
              // fontSize: 20,
              // fontWeight: FontWeight.w600,
              color: purple),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextFieldCrete(
                    textname: "Tag Number",
                    controller: email,
                    hintText: 'Enter Tag Number',
                    isPasswordField: false,
                  ),
                  CommonTextFieldCrete(
                    textname: "Location",
                    controller: email,
                    hintText: 'Enter Location',
                    isPasswordField: false,
                  ),
                  CommonTextFieldCrete(
                    textname: "Sub Location",
                    controller: email,
                    hintText: 'Enter Sub Location',
                    isPasswordField: false,
                  ),
                  CommonTextFieldCrete(
                    textname: "Item Code",
                    controller: email,
                    hintText: 'Enter Item Code',
                    isPasswordField: false,
                  ),
                  CommonTextFieldCrete(
                    textname: "Asset",
                    controller: email,
                    hintText: 'Enter Asset',
                    isPasswordField: false,
                  ),
                  CommonTextFieldCrete(
                    textname: "Quantity",
                    controller: email,
                    hintText: 'Enter Quantity',
                    isPasswordField: false,
                  ),
                  CommonTextFieldCrete(
                    textname: "UOM",
                    controller: email,
                    hintText: 'Enter UOM',
                    isPasswordField: false,
                  ),
                  CommonTextFieldCrete(
                    textname: "Status",
                    controller: email,
                    hintText: 'Enter Status',
                    isPasswordField: false,
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        name: 'Submit Form',
                        onPressed: () {
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
