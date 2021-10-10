import 'dart:io';
import 'dart:typed_data';

import '../abstract/i_file_management_service.dart';

class FileManagementService implements IFileManagementService {
  final String _rootDir = "/storage/emulated/0"; // Android directory
  final String _appDir;
  FileManagementService([this._appDir = "/Download"])
      : assert(_appDir.startsWith("/"));

  _validationPath(String filePath) {
    assert(filePath.isNotEmpty);
    assert(filePath.startsWith("/"));
    assert(filePath.endsWith(".txt") || filePath.endsWith(".png") ||
        filePath.endsWith(".jpg") || filePath.endsWith(".ciyabox"));
  }

  File? localFile(String filePath) {
    try {
      _validationPath(filePath);

      final Directory dir = Directory("$_rootDir$_appDir");
      return File("${dir.path}$filePath");
    } catch (e) {
      print("[ERROR]: $e");
      return null;
    }
  }

  Future<File?> localFileWithController(String filePath) async {
    try {
      _validationPath(filePath);

      final Directory dir = Directory("$_rootDir$_appDir");
      bool dirExists = await dir.exists();
      if (!dirExists) await dir.create(recursive: true);
      return File("${dir.path}$filePath");
    } catch (e) {
      print("[ERROR]: $e");
      return null;
    }
  }

  Future<File?> writeFileFromString(String filePath, String dataString) async {
    try {
      _validationPath(filePath);

      final file = await localFileWithController(filePath);
      return await file?.writeAsString(dataString);
    } catch (e) {
      print("[ERROR]: $e");
      return null;
    }
  }

  Future<String?> readFileToString(String filePath) async {
    try {
      _validationPath(filePath);

      final file = await localFileWithController(filePath);
      return await file?.readAsString();
    } catch (e) {
      print("[ERROR]: $e");
      return null;
    }
  }

  Future<File?> writeFileFromBytes(String filePath, Uint8List dataBytes) async {
    try {
      _validationPath(filePath);

      final file = await localFileWithController(filePath);
      return await file?.writeAsBytes(dataBytes);
    } catch (e) {
      print("[ERROR]: $e");
      return null;
    }
  }

  Future<Uint8List?> readFileToBytes(String filePath) async {
    try {
      _validationPath(filePath);

      final file = await localFileWithController(filePath);
      return await file?.readAsBytes();
    } catch (e) {
      print("[ERROR]: $e");
      return null;
    }
  }
}
