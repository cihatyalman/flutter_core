// Documents and Integration
// https://pub.dev/packages/image_picker
// https://pub.dev/packages/flutter_image_compress

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class CameraService {
  int? quality;
  CameraService({this.quality = 100});

  final _picker = ImagePicker();

  Future<File?> getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      preferredCameraDevice: CameraDevice.rear,
      imageQuality: quality,
    );

    return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<List<File>?> getMultiImage() async {
    final pickedFile = await _picker.pickMultiImage(imageQuality: quality);

    return pickedFile != null
        ? pickedFile.map((e) => File(e.path)).toList()
        : null;
  }

  Future<File?> getVideo(ImageSource source, {Duration? maxDuration}) async {
    final pickedFile = await _picker.pickVideo(
      source: source,
      preferredCameraDevice: CameraDevice.rear,
      maxDuration: maxDuration,
    );

    return pickedFile != null ? File(pickedFile.path) : null;
  }

// #region Compress

  Future<Uint8List?> compressByteFromFile(File file,
      {int quality = 100}) async {
    var result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      quality: quality,
    );
    return result;
  }

  Future<File?> compressFileFromFile(File file, String targetPath,
      {int quality = 100}) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: quality,
    );

    return result;
  }

  Future<Uint8List?> compressByteFromAsset(String assetName,
      {int quality = 100}) async {
    var result = await FlutterImageCompress.compressAssetImage(
      assetName,
      quality: quality,
    );

    return result;
  }

  Future<Uint8List> compressByteFromByte(Uint8List list,
      {int quality = 100}) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      quality: quality,
    );

    return result;
  }
// #endregion
}
