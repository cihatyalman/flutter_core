// ignore_for_file: empty_catches

import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

final cacheService = CacheService();

class CacheService {
  late Box box;
  final String cacheName = "project_name_cache";

  Future init() async {
    final dir = await getDir();
    await Hive.initFlutter(dir.path);
    box = await openBox(dir);
  }

  Future<Box> openBox(Directory dir) async {
    return await Hive.openBox(cacheName, path: dir.path);
  }

  Future deleteBox() async {
    try {
      final dir = await getDir();
      await Hive.deleteBoxFromDisk(cacheName);
      box = await openBox(dir);
    } catch (e) {}
  }

  Future<Directory> getDir() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    return Directory('${appDocumentDirectory.path}/database');
  }
}
