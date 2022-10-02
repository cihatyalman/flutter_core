// Documents and Integration
// https://pub.dev/packages/qr_flutter
// *https://pub.dev/packages/qr_code_scanner

// In order to use this plugin, please update the Gradle, Kotlin and Kotlin Gradle Plugin.
// android/app/build.gradle
//    minSdkVersion 20
// android/build.gradle
//    ext.kotlin_version = '1.6.10'
//    classpath 'com.android.tools.build:gradle:7.1.2'
// android/gradle/wrapper/gradle-wrapper.properties
//    distributionUrl=https\://services.gradle.org/distributions/gradle-7.4-all.zip

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRService {
  Timer? timer;

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

  QRViewController? controller;
  QRView readQR(void Function(Barcode? barcode) callback) {
    Barcode? barcode;
    Barcode? oldBarcode;
    return QRView(
      key: GlobalKey(debugLabel: 'QR'),
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderLength: 48,
        borderRadius: 12,
      ),
      onQRViewCreated: (controller) async {
        this.controller = controller;
        await controller.resumeCamera();
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
