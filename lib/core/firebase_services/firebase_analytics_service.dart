import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  static final FirebaseAnalyticsService _instance =
      FirebaseAnalyticsService._internal();
  factory FirebaseAnalyticsService() => _instance;
  FirebaseAnalyticsService._internal();

  final instance = FirebaseAnalytics.instance;

  /// Tüm ekran görüntülenmelerini loglar
  void screenView({required String screenName}) {
    instance.logScreenView(screenName: screenName);
  }

  // Example
  // void contentView(String contentName, int? role) {
  //   instance.logEvent(name: contentName, parameters: {"role": role});
  // }
}
