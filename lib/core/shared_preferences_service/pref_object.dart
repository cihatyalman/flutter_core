import 'package:shared_preferences/shared_preferences.dart';

class PrefObject {
  final SharedPreferences prefs;
  final String key;
  PrefObject({required this.prefs, required this.key});

  String? get() => prefs.getString(key);
  Future<void> set(String? value) async =>
      await prefs.setString(key, value ?? "");
  Future<void> delete() async => await prefs.remove(key);
}
