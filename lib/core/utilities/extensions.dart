import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

extension NavigatorKeyExtension on GlobalKey<NavigatorState> {
  NavigatorState get state => this.currentState!;
  MediaQueryData get mediaQuery => MediaQuery.of(this.currentState!.context);
  ThemeData get theme => Theme.of(this.currentState!.context);
  TextTheme get textTheme => Theme.of(this.currentState!.context).textTheme;

  double dynamicWidth(double value) =>
      MediaQuery.of(this.currentState!.context).size.width * value;
  double dynamicHeight(double value) =>
      MediaQuery.of(this.currentState!.context).size.height * value;
}

extension StringExtension on String {
  Uint8List get toBytesFromString => Uint8List.fromList(utf8.encode(this));
  Uint8List get toBytesFromBase64 => base64Decode(this);
}

extension ByteExtension on Uint8List {
  Image get toImageFromBytes => Image.memory(this);
  String get toStringFromBytes => utf8.decode(this);
  String get toBase64FromBytes => base64Encode(this);
}
