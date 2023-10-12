import 'package:flutter/material.dart';
import 'package:inventory/inventory.dart';

class Custom_dashboard2 extends StatelessWidget {
  final String name1;
  final String name2;
  final String name3;

  const Custom_dashboard2({
    super.key,
    required this.name1,
    required this.name2,
    required this.name3,
  });

  // final String name5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              name1,
              style: TextStyle(
                  fontSize: screenheight(context, dividedby: 55),
                  fontFamily: 'gilroy.bold',
                  color: Colors.grey),
            ),
          ),
          SizedBox(
            height: screenheight(context, dividedby: 50),
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              name2,
              style: TextStyle(
                  fontSize: screenheight(context, dividedby: 55),
                  fontFamily: 'gilroy.bold',
                  color: Colors.grey),
            ),
          ),
          SizedBox(
            height: screenheight(context, dividedby: 50),
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              name3,
              style: TextStyle(
                  fontSize: screenheight(context, dividedby: 55),
                  fontFamily: 'gilroy.bold',
                  color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
