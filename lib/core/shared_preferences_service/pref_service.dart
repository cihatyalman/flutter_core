import 'package:shared_preferences/shared_preferences.dart';

final prefService = PrefService();

class PrefService {
  late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
