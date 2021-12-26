// Documents and Integration
// https://pub.dev/packages/image_picker

import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class CameraService {
  final double? maxWidth;
  final double? maxHeight;

  CameraService({
    this.maxWidth,
    this.maxHeight,
  });

  final _picker = ImagePicker();

  Future<Uint8List?> getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      preferredCameraDevice: CameraDevice.rear,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );

    return pickedFile != null ? await pickedFile.readAsBytes() : null;
  }

  Future<List<Uint8List>?> getMultiImage() async {
    final pickedFile = await _picker.pickMultiImage(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );

    return pickedFile != null
        ? await Future.wait(
            pickedFile.map((e) => e.readAsBytes()).toList(),
          )
        : null;
  }
}
