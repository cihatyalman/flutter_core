import 'dart:io';

import 'dart:typed_data';

class IFileManagerBase{
    // ignore: missing_return
    File localFile(String filePath){}
    // ignore: missing_return
    Future<File> localFileWithController(String filePath){}
    // ignore: missing_return
    Future<File> writeFileFromString(String filePath,String dataString){}
    // ignore: missing_return
    Future<File> writeFileFromBytes(String filePath,Uint8List dataBytes){}
    // ignore: missing_return
    Future<String> readFileToString(String filePath){}
    // ignore: missing_return
    Future<Uint8List> readFileToBytes(String filePath){}
}