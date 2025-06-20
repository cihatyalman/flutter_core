import 'package:hive_flutter/hive_flutter.dart';

final cacheService = CacheService();

class CacheService {
  late Box box;
  final String cacheName = "project_name_cache";

  Future init() async {
    await Hive.initFlutter();
    box = await openBox();
  }

  Future<Box> openBox() async {
    return await Hive.openBox(cacheName);
  }

  Future deleteBox() async {
    try {
      await Hive.deleteBoxFromDisk(cacheName);
      box = await openBox();
    } catch (e) {
      return false;
    }
  }
}
