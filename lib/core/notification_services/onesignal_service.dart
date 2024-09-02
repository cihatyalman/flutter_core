// https://pub.dev/packages/onesignal_flutter
// https://documentation.onesignal.com/docs/flutter-sdk-setup

// ignore_for_file: avoid_print

import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../storage_services/cache_service.dart';

final oneSignalService = OneSignalService();

class OneSignalService {
  final onesignalId = "YOUR_ONESIGNAL_ID";

  Future<void> init() async {
    await OneSignal.shared.consentGranted(true);
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    await OneSignal.shared.setAppId(onesignalId);

    final accepted =
        await OneSignal.shared.promptUserForPushNotificationPermission();
    print("[C_OneSignal_Accepted]: $accepted");
    if (!accepted) return;

    OneSignal.shared.setSubscriptionObserver((changes) {
      print("[C_OneSignal_PlayerId]: ${changes.to.userId}");
      cacheService.box.put('playerId', changes.to.userId);
    });

    // Foreground
    OneSignal.shared.setNotificationWillShowInForegroundHandler((event) {
      print("[C_OneSignal_Foreground_Title]: ${event.notification.title}");
      print("[C_OneSignal_Foreground_Body]: ${event.notification.body}");
      print(
          "[C_OneSignal_Foreground_Data]: ${event.notification.additionalData}");

      event.complete(null);
      // event.complete(event.notification);
    });

    // Opened
    OneSignal.shared.setNotificationOpenedHandler((openedResult) {
      print("[C_OneSignal_Opened_Title]: ${openedResult.notification.title}");
      print("[C_OneSignal_Opened_Body]: ${openedResult.notification.body}");
      print(
          "[C_OneSignal_Opened_Data]: ${openedResult.notification.additionalData}");
    });
  }

  Future<void> setExternalUserId(String externalUserId) async {
    await removeExternalUserId();
    OneSignal.shared.setExternalUserId(externalUserId).then((results) {
      print("[C_OneSignal_UserId]: $results");
    }).catchError((error) {
      print("[C_OneSignal_UserId_Error]: $error");
    });
  }

  Future<void> removeExternalUserId() async {
    await OneSignal.shared.removeExternalUserId();
  }
}
