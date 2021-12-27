import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FileService {
  Future<File?> getFile({List<String>? allowedExtensions}) async {
    final result = await FilePicker.platform.pickFiles(
      type: allowedExtensions != null ? FileType.custom : FileType.any,
      allowedExtensions: allowedExtensions,
    );
    return result?.files.single.path != null
        ? File(result!.files.single.path!)
        : null;
  }

  Future<List<File>?> getFiles({List<String>? allowedExtensions}) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: allowedExtensions != null ? FileType.custom : FileType.any,
      allowedExtensions: allowedExtensions,
    );
    return result != null ? result.paths.map((e) => File(e!)).toList() : null;
  }
}
