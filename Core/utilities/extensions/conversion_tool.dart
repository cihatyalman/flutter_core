import 'dart:convert';
import 'dart:typed_data';

import '../../entities/i_base_entity.dart';
import 'package:flutter/material.dart';

extension StringExtension on String{
  Uint8List get toBytesFromString => Uint8List.fromList(utf8.encode(this));
  Uint8List get toBytesFromListString {
    List<String> stringList = this.substring(1,this.length-1).split(",");
    List<int> intList = List.generate(stringList.length, (index) => int.tryParse(stringList[index]));
    return Uint8List.fromList(intList);
  }
}

extension Uint8ListExtension on Uint8List{
  Image get toImageFromBytes => Image.memory(this);
  String get toStringFromBytes => utf8.decode(this);
}

extension ListExtension on List<IBaseEntity>{
  List<Map> get toMapList => List.generate(this.length, (index) => this[index].toMap());
}
