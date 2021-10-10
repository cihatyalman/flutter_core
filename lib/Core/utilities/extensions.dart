import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get getMediaQuery => MediaQuery.of(this);
  ThemeData get getTheme => Theme.of(this);

  double dynamicWidth(double value) => MediaQuery.of(this).size.width * value;
  double dynamicHeight(double value) => MediaQuery.of(this).size.height * value;
}

extension StringExtension on String {
  Uint8List get toBytesFromString => Uint8List.fromList(utf8.encode(this));
  Uint8List get toBytesFromBase64 => base64Decode(this);

  String get toEnglishAlphabet => this
      .replaceAll("ç", "c").replaceAll("Ç", "C")
      .replaceAll("ğ", "g").replaceAll("Ğ", "G")
      .replaceAll("ı", "i").replaceAll("İ", "I")
      .replaceAll("ö", "o").replaceAll("Ö", "O")
      .replaceAll("ş", "s").replaceAll("Ş", "S")
      .replaceAll("ü", "u").replaceAll("Ü", "U");
}

extension Uint8ListExtension on Uint8List {
  Image get toImageFromBytes => Image.memory(this);
  String get toStringFromBytes => utf8.decode(this);
  String get toBase64FromBytes => base64Encode(this);
}
