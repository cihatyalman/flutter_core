// Documents and Integration
// https://pub.dev/packages/qr_flutter
// *https://pub.dev/packages/qr_code_scanner

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRService {
  static QrImage createQR(
    String data, {
    QrErrorBuilder? errorStateBuilder,
    double size = 200,
  }) {
    return QrImage(
      data: data,
      version: QrVersions.auto,
      size: size,
      gapless: false,
      errorStateBuilder: errorStateBuilder ??
          (context, error) {
            return Container(
              alignment: Alignment.center,
              width: size,
              height: size,
              child: Text(
                "[QR_ERROR]\n${error.toString()}",
                textAlign: TextAlign.center,
              ),
            );
          },
    );
  }

  static Future<String?> readQR(BuildContext context) async {
    Barcode? barcode;
    await showDialog(
      context: context,
      builder: (context) {
        return QRView(
          key: GlobalKey(debugLabel: 'QR'),
          overlay: QrScannerOverlayShape(
            borderColor: Colors.white,
            borderLength: 48,
            borderRadius: 12,
          ),
          onQRViewCreated: (controller) {
            controller.scannedDataStream.listen((scanData) {
              if (barcode == null) {
                barcode = scanData;
                Navigator.pop(context);
              }
            });
          },
        );
      },
    );
    return barcode?.code;
  }
}
