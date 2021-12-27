// Documents and Integration
// https://pub.dev/packages/image_picker

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CameraService {
  final double? maxWidth;
  final double? maxHeight;

  CameraService({
    this.maxWidth,
    this.maxHeight,
  });

  final _picker = ImagePicker();

  Future<File?> getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      preferredCameraDevice: CameraDevice.rear,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );

    return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<List<File>?> getMultiImage() async {
    final pickedFile = await _picker.pickMultiImage(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );

    return pickedFile != null
        ? pickedFile.map((e) => File(e.path)).toList()
        : null;
  }
}
