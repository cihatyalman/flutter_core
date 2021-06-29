import 'dart:convert';
import 'dart:typed_data';

import '../../entities/i_base_entity.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  Uint8List get toBytesFromString => Uint8List.fromList(utf8.encode(this));
  Uint8List get toBytesFromBase64 => base64Decode(this);

  String get toEnglishAlphabet => this
      .replaceAll("ç", "c")
      .replaceAll("ğ", "g")
      .replaceAll("ı", "i")
      .replaceAll("ö", "o")
      .replaceAll("ş", "s")
      .replaceAll("ü", "u");
}

extension Uint8ListExtension on Uint8List {
  Image get toImageFromBytes => Image.memory(this);
  String get toStringFromBytes => utf8.decode(this);
  String get toBase64FromBytes => base64Encode(this);
}

extension ListExtension on List<IBaseEntity> {
  List<Map> get toMapList =>
      List.generate(this.length, (index) => this[index].toMap());
}

extension ColorExtension on Color {
  Color changeRGB({int red, int green, int blue}) {
    Color tempColor = this;
    if (red != null && red >= 0 && red <= 255)
      tempColor = tempColor.withRed(red);
    if (green != null && green >= 0 && green <= 255)
      tempColor = tempColor.withGreen(green);
    if (blue != null && blue >= 0 && blue <= 255)
      tempColor = tempColor.withBlue(blue);
    return tempColor;
  }
}
