// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:inventory/const.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// class BarcodeScannerScreen extends StatefulWidget {
//   @override
//   _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
// }
//
// class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
//   final MobileScannerController controller = MobileScannerController();
//
//   @override
//   void dispose() {
//     controller.dispose(); // Dispose only when the screen is closed
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         iconTheme: IconThemeData(color: white),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.flash_on,
//               color: white,
//             ),
//             onPressed: () => controller.toggleTorch(),
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.flip_camera_ios,
//               color: white,
//             ),
//             onPressed: () => controller.switchCamera(),
//           ),
//         ],
//       ),
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           MobileScanner(
//             controller: controller,
//             onDetect: (barcode) {
//               if (barcode.barcodes.isNotEmpty) {
//                 String scannedCode = barcode.barcodes.first.rawValue ?? "";
//                Get.back(result: scannedCode);
//               }
//             },
//           ),
//           Container(
//             height: 200,
//             width: 200,
//             decoration:
//                 BoxDecoration(border: Border.all(color: purple, width: 2),borderRadius: BorderRadius.circular(10)
//                 ),
//           )
//         ],
//       ),
//     );
//   }
// }
