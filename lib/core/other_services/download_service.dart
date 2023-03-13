// Documents and Integration
// https://pub.dev/packages/path_provider
// https://pub.dev/packages/flutter_downloader
// https://pub.dev/packages/crypto

import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

final downloadService = DownloadService();

class DownloadService {
  late Directory dir;

  void init() async {
    await FlutterDownloader.initialize(debug: true);
    FlutterDownloader.registerCallback(callback);
    dir = await getTemporaryDirectory();
  }

  static void callback(String? id, DownloadTaskStatus? status, int? progress) {}

  Future<String> _createFolder({String? folderName}) async {
    if (folderName == null) {
      return dir.path;
    }
    final subDir = Directory("${dir.path}/$folderName");
    if (!(await subDir.exists())) {
      await subDir.create();
    }
    return subDir.path;
  }

  String _convertSHA1({required String text}) {
    return sha1.convert(utf8.encode(text)).toString();
  }

  Future<String?> download(
      {required String url, String? folder, String? fileName}) async {
    final savedDir = await _createFolder(folderName: folder);
    final id = await FlutterDownloader.enqueue(
      url: url,
      savedDir: savedDir,
      fileName: fileName ?? _convertSHA1(text: url),
      showNotification: false,
      openFileFromNotification: false,
    );
    return id;
  }

  Future<File?> getFile(
      {required String url, String? folder, String? fileName}) async {
    final file =
        File("${dir.path}/$folder/${fileName ?? _convertSHA1(text: url)}");
    if (await file.exists()) {
      return file;
    }
    return null;
  }
}
