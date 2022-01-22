// firebase_analytics:
// firebase_messaging:

// https://pub.dev/packages/firebase_messaging
// https://firebase.flutter.dev/docs/messaging/overview/
// https://firebase.flutter.dev/docs/messaging/usage/

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../utilities/console.dart';
import '../utilities/mixins/context_mixin.dart';

class FirebasePushService with ContextMixin{
  final instance = FirebaseMessaging.instance;

  Future<String?> init() async {
    await instance.requestPermission();
    final token = await instance.getToken();
    instance.subscribeToTopic("all");
    Console.printSuccess("[C_Instance_Token]: $token");
    onMessage();
    onMessageOpenedApp();
    onMessageBackground();
    return token;
  }

  onMessage() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        ScaffoldMessenger.of(currentContext)
            .showSnackBar(_snackBar(message));
      },
    );
  }

  onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        ScaffoldMessenger.of(currentContext)
            .showSnackBar(_snackBar(message));
      },
    );
  }

  onMessageBackground() {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {}

  SnackBar _snackBar(RemoteMessage data) {
    return SnackBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      content: SizedBox(
        height: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              data.data["title"],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(data.data["body"]),
          ],
        ),
      ),
    );
  }
}
