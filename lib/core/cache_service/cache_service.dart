import 'package:hive_flutter/hive_flutter.dart';

final cacheService = CacheService();

class CacheService {
  late Box box;

  Future init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('cache');
  }
}
