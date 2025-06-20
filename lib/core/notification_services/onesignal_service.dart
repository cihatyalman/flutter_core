// https://pub.dev/packages/onesignal_flutter
// https://documentation.onesignal.com/docs/flutter-sdk-setup

// ignore_for_file: avoid_print

import 'package:onesignal_flutter/onesignal_flutter.dart';

final oneSignalService = OneSignalService();

class OneSignalService {
  final onesignalId = "YOUR_ONESIGNAL_ID";

  Future<void> init() async {
    // OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    // OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    await OneSignal.consentRequired(false);
    OneSignal.initialize(onesignalId);

    OneSignal.Notifications.clearAll();

    final accepted = await OneSignal.Notifications.requestPermission(true);
    print("[C_OneSignal_Accepted]: $accepted");
    if (!accepted) return;
    await OneSignal.consentGiven(true);

    OneSignal.User.pushSubscription.addObserver((stateChanges) {
      print("[C_PlayerId]: ${OneSignal.User.pushSubscription.id}");
    });

    // Foreground
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      print("[C_OneSignal_Foreground_Title]: ${event.notification.title}");
      print("[C_OneSignal_Foreground_Body]: ${event.notification.body}");
      print(
          "[C_OneSignal_Foreground_Data]: ${event.notification.additionalData}");

      event.preventDefault();
    });

    // Opened
    OneSignal.Notifications.addClickListener((openedResult) {
      print("[C_OneSignal_Opened_Title]: ${openedResult.notification.title}");
      print("[C_OneSignal_Opened_Body]: ${openedResult.notification.body}");
      print(
          "[C_OneSignal_Opened_Data]: ${openedResult.notification.additionalData}");

      // mainStore.notiData = openedResult.notification.additionalData;
    });
  }

  Future<void> setExternalUserId(String externalUserId) async {
    await removeExternalUserId();
    await OneSignal.login(externalUserId);
  }

  Future<void> removeExternalUserId() async {
    await OneSignal.logout();
  }
}
