import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inventory/getxcontroller/productcreatecontroller.dart';
import 'package:inventory/inventory.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerScreendesignation extends StatefulWidget {
  const ScannerScreendesignation({super.key});
  @override
  State<ScannerScreendesignation> createState() =>
      _ScannerScreendesignationState();
}

class _ScannerScreendesignationState extends State<ScannerScreendesignation> {
  ProductCreateController controllerqrwork = Get.put(ProductCreateController());
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Widget _buildQrView(BuildContext context) {
    var scanArea = screenwidth(context, dividedby: 1.5);
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Color(0xffA44D80),
          borderRadius: 5,
          // borderLength:  screenwidth(context,dividedby: 1.5),
          borderWidth: 2,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      log(scanData.code.toString());
      HapticFeedback.vibrate();
      setState(() {
        result = scanData;
        if (result != null) {
          controllerqrwork.qrcode.text = result?.code ?? "";
          controller.stopCamera();
          Get.back();
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildQrView(context),
    );
  }
}
