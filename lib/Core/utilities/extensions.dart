import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  double dynamicWidth(double value) => MediaQuery.of(this).size.width * value;
  double dynamicHeight(double value) => MediaQuery.of(this).size.height * value;
}

extension StringExtension on String {
  Uint8List get toBytesFromString => Uint8List.fromList(utf8.encode(this));
  Uint8List get toBytesFromBase64 => base64Decode(this);
  DateTime? get toDatetime => (this.length > 10 || int.tryParse(this) == null)
      ? null
      : DateTime.fromMillisecondsSinceEpoch(int.parse(this) * 1000);
}

extension Uint8ListExtension on Uint8List {
  Image get toImageFromBytes => Image.memory(this);
  String get toStringFromBytes => utf8.decode(this);
  String get toBase64FromBytes => base64Encode(this);
}

extension DateTimeExtension on DateTime {
  String get toTimestamp {
    var t = this.millisecondsSinceEpoch.toString();
    return t.substring(0, t.length - 3);
  }
}
