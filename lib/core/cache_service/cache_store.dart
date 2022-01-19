import 'cache_service.dart';
import 'cache_object.dart';

final cacheStore = CacheStore();

class CacheStore {
  final token = CacheObject(box: cacheService.box, key: "token");
}
