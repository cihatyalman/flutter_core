// Documents and Integration
// https://pub.dev/packages/image_picker
// https://pub.dev/packages/flutter_image_compress
// *https://pub.dev/packages/image_cropper

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CameraService {
  final int quality;
  final double maxWidth;
  final double maxHeight;
  final double ratioX;
  final double ratioY;

  CameraService({
    this.quality = 100,
    this.maxWidth = 1080,
    this.maxHeight = 1920,
    this.ratioX = 1,
    this.ratioY = 1,
  });

  final _picker = ImagePicker();

  Future<File?> getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      preferredCameraDevice: CameraDevice.rear,
      imageQuality: quality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<List<File>?> getMultiImage() async {
    final pickedFile = await _picker.pickMultiImage(
      imageQuality: quality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
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

// #region Crop
  Future<File?> getCropImage(File file) async {
    return await ImageCropper.cropImage(
      sourcePath: file.path,
      androidUiSettings: const AndroidUiSettings(
        toolbarTitle: 'Fotoğraf Düzenleyici',
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: true,
        hideBottomControls: true,
        showCropGrid: false,
      ),
      iosUiSettings: const IOSUiSettings(title: 'Fotoğraf Düzenleyici'),
      aspectRatio: CropAspectRatio(ratioX: ratioX, ratioY: ratioY),
      // aspectRatioPresets: Platform.isAndroid
      //     ? [
      //         CropAspectRatioPreset.original,
      //         CropAspectRatioPreset.square,
      //         CropAspectRatioPreset.ratio3x2,
      //         CropAspectRatioPreset.ratio4x3,
      //         CropAspectRatioPreset.ratio16x9,
      //       ]
      //     : [
      //         CropAspectRatioPreset.original,
      //         CropAspectRatioPreset.square,
      //         CropAspectRatioPreset.ratio3x2,
      //         CropAspectRatioPreset.ratio4x3,
      //         CropAspectRatioPreset.ratio5x3,
      //         CropAspectRatioPreset.ratio5x4,
      //         CropAspectRatioPreset.ratio7x5,
      //         CropAspectRatioPreset.ratio16x9
      //       ],
    );
  }
// #endregion

// #region Compress
  Future<File> autoCompressFile(File file, {int maxByte = 1048576}) async {
    File tempFile = file;
    int quality = this.quality;
    while (quality > 1) {
      int length = (await tempFile.length());
      if (length < maxByte) break;
      quality -= 1;
      tempFile = (await compressFileFromFile(file, quality: quality))!;
    }
    return tempFile;
  }

  String _getTargetPath(String path, int quality) {
    final type = path.split('.').last;
    final base = path.split('/');
    base.removeAt(base.length - 1);
    return "${base.join('/')}/${DateTime.now().millisecondsSinceEpoch}.$type";
  }

  Future<File?> compressFileFromFile(File file,
      {String? targetPath, int quality = 100}) async {
    targetPath ??= _getTargetPath(file.path, quality);
    return await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: quality,
    );
  }

  Future<Uint8List?> compressByteFromFile(File file,
      {int quality = 100}) async {
    return await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      quality: quality,
    );
  }

  Future<Uint8List> compressByteFromByte(Uint8List list,
      {int quality = 100}) async {
    return await FlutterImageCompress.compressWithList(
      list,
      quality: quality,
    );
  }

  Future<Uint8List?> compressByteFromAsset(String assetName,
      {int quality = 100}) async {
    return await FlutterImageCompress.compressAssetImage(
      assetName,
      quality: quality,
    );
  }
// #endregion

  CameraService copyWith({
    int? quality,
    double? maxWidth,
    double? maxHeight,
    double? ratioX,
    double? ratioY,
  }) {
    return CameraService(
      quality: quality ?? this.quality,
      maxWidth: maxWidth ?? this.maxWidth,
      maxHeight: maxHeight ?? this.maxHeight,
      ratioX: ratioX ?? this.ratioX,
      ratioY: ratioY ?? this.ratioY,
    );
  }
}
