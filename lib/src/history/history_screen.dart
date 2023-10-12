import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/widgets/helper.dart';
import '../../widgets/customcolumn.dart';
// import '../home/home_controller.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic homeController = "";

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          'History',
          style: TextStyle(
              fontFamily: 'gilroy.bold',
              color: Colors.black,
              letterSpacing: 2,
              fontSize: screenheight(context, dividedby: 32)),
        ),
      ),
      body: homeController.historyqat.result == null
          ? Center(
              child: Text('No history'),
            )
          : ListView.builder(
              itemCount: homeController.historyqat.result.length,
              itemBuilder: (context, index) {
                dynamic result = homeController.historyqat.result[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    elevation: 3,
                    child: SizedBox(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          CustomColumnRow(
                            tag: 'Tag',
                            name: result.tagNumber,
                            tag2: 'Asset',
                            sname: result.asset,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomColumnRow(
                            tag: 'Actual Quantity',
                            name: result.qty,
                            tag2: 'Available Quantity',
                            sname: result.availableQty,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomColumnRow(
                            tag: 'Category',
                            name: result.category,
                            tag2: 'UOM',
                            sname: result.uom,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomColumnRow(
                            tag: 'Location',
                            name: result.location,
                            tag2: 'Sub location',
                            sname: result.subLocation,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomColumnRow(
                            tag: 'Item Code',
                            name: result.date,
                            tag2: 'Main Category',
                            sname: result.mainCategory,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    )),
                  ),
                );
              },
            ),
    );
  }
}
