import 'pref_service.dart';
import 'pref_object.dart';

final prefStore = PrefStore();

class PrefStore {
  final token = PrefObject(prefs: prefService.prefs, key: "token");
}
