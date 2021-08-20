import 'dart:io';

import 'dart:typed_data';

import '../abstract/i_file_manager_base.dart';

class FileManagerBase implements IFileManagerBase{
  final String _rootDir = "/storage/emulated/0";    // Android directory
  final String _appDir;
  FileManagerBase([this._appDir="/Download"]):
  assert(_appDir.startsWith("/"));

  _validationPath(String filePath){
    assert(filePath != null);
    assert(filePath.isNotEmpty);
    assert(filePath.startsWith("/"));
    assert(filePath.endsWith(".txt") || filePath.endsWith(".png") 
    || filePath.endsWith(".jpg") || filePath.endsWith(".cybox"));
  }

  File localFile(String filePath){
    _validationPath(filePath);

    final Directory dir = Directory("$_rootDir$_appDir");
    return File("${dir.path}$filePath");
  }

  Future<File> localFileWithController(String filePath) async {
    _validationPath(filePath);

    final Directory dir = Directory("$_rootDir$_appDir");
    bool dirExists = await dir.exists();
    if(!dirExists)
      await dir.create(recursive: true);
    return File("${dir.path}$filePath");
  }

  Future<File> writeFileFromString(String filePath,String dataString) async {
    _validationPath(filePath);
    try {
      final File file = await localFileWithController(filePath);
      return await file.writeAsString(dataString);
    } 
    catch (e) {
      print("Hata: $e");
      return null;
    }
  }

  Future<String> readFileToString(String filePath) async {
    _validationPath(filePath);
    try {
      final File file = await localFileWithController(filePath);
      String contents = await file.readAsString();
      return contents;
    } 
    catch (e) {
      print("Hata: $e");
      return null;
    }
  }

  Future<File> writeFileFromBytes(String filePath,Uint8List dataBytes) async {
    _validationPath(filePath);
    try {
      final File file = await localFileWithController(filePath);
      return await file.writeAsBytes(dataBytes);
    } 
    catch (e) {
      print("Hata: $e");
      return null;
    }
  }

  Future<Uint8List> readFileToBytes(String filePath) async {
    _validationPath(filePath);
    try {
      final File file = await localFileWithController(filePath);
      Uint8List contents = await file.readAsBytes();
      return contents;
    } 
    catch (e) {
      print("Hata: $e");
      return null;
    }
  }

}
