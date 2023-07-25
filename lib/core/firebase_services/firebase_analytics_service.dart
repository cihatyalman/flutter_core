import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  final instance = FirebaseAnalytics.instance;

  /// Tüm ekran görüntülenmelerini loglar
  void screenView({required String screenName}) {
    instance.logScreenView(screenName: screenName);
  }
}
