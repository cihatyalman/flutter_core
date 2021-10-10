import 'dart:io';
import 'dart:typed_data';

class IFileManagementService {
  File? localFile(String filePath) {}
  Future<File?>? localFileWithController(String filePath) {}
  Future<File?>? writeFileFromString(String filePath, String dataString) {}
  Future<File?>? writeFileFromBytes(String filePath, Uint8List dataBytes) {}
  Future<String?>? readFileToString(String filePath) {}
  Future<Uint8List?>? readFileToBytes(String filePath) {}
}
