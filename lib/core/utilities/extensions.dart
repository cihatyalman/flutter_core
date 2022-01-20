import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

extension NavigatorKeyExtension on GlobalKey<NavigatorState> {
  MediaQueryData get mediaQuery => MediaQuery.of(currentContext!);
  ThemeData get theme => Theme.of(currentContext!);

  double dynamicWidth(double value) =>
      MediaQuery.of(currentContext!).size.width * value;
  double dynamicHeight(double value) =>
      MediaQuery.of(currentContext!).size.height * value;
}

extension StringExtension on String {
  Uint8List? toBytesFromBase64() {
    try {
      return base64Decode(this);
    } catch (e) {
      return null;
    }
  }

  Uint8List? toBytesFromString() {
    try {
      return Uint8List.fromList(utf8.encode(this));
    } catch (e) {
      return null;
    }
  }

  DateTime? toLocalDate() {
    try {
      final datetime = DateTime.tryParse(this);
      return datetime?.toLocal();
    } catch (e) {
      return null;
    }
  }

  DateTime? toDateTimeFromTimestamp() {
    try {
      return (length > 10 || int.tryParse(this) == null)
          ? null
          : DateTime.fromMillisecondsSinceEpoch(int.parse(this) * 1000);
    } catch (e) {
      return null;
    }
  }
}

extension ByteExtension on Uint8List {
  Image get toImageFromBytes => Image.memory(this);
  String get toStringFromBytes => utf8.decode(this);
  String get toBase64FromBytes => base64Encode(this);
}

extension DateTimeExtension on DateTime {
  String get toISOString => toUtc().toIso8601String();
  String toTimestamp() {
    final timestamp = millisecondsSinceEpoch.toString();
    return timestamp.substring(0, timestamp.length - 3);
  }
}
