import 'package:hive_flutter/hive_flutter.dart';

class CacheObject {
  final Box<String?> box;
  final String key;
  CacheObject({required this.box, required this.key});

  String? get() => box.get(key);
  Future<void> set(String? value) async => await box.put(key, value);
  Future<void> delete() async => await box.delete(key);
}
