// Documents and Integration
// https://pub.dev/packages/qr_flutter
// *https://pub.dev/packages/qr_code_scanner

// android/app/build.gradle
//    minSdkVersion 20
// android/build.gradle
//    ext.kotlin_version = '1.5.10'
//    classpath 'com.android.tools.build:gradle:4.2.0'
// android/gradle/wrapper/gradle-wrapper.properties
//    distributionUrl=https\://services.gradle.org/distributions/gradle-6.9-all.zip

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRService {
  QrImage createQR(
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

  Future<String?> readQRPopUp(BuildContext context,
      [Widget Function(QRView qrCamera)? callback]) async {
    Barcode? barcode;
    final qrCamera = QRView(
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
    await showDialog(
      context: context,
      builder: (context) {
        return callback != null ? callback.call(qrCamera) : qrCamera;
      },
    );
    return barcode?.code;
  }

  Timer? timer;
  QRViewController? controller;
  QRView readQRCamera(void Function(Barcode? barcode) callback) {
    Barcode? barcode;
    Barcode? oldBarcode;
    return QRView(
      key: GlobalKey(debugLabel: 'QR'),
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderLength: 48,
        borderRadius: 12,
      ),
      onQRViewCreated: (controller) {
        this.controller = controller;
        controller.scannedDataStream.listen((scanData) {
          if (barcode == null) {
            barcode = scanData;
            if (barcode?.code != oldBarcode?.code) {
              callback.call(barcode);
              oldBarcode = barcode;
            }
            barcode = null;
            timer ??= Timer(
              const Duration(seconds: 3),
              () {
                oldBarcode = null;
                timer = null;
              },
            );
          }
        });
      },
    );
  }
}
