// firebase_analytics:
// firebase_messaging:

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class FirebasePushService {
  final instance = FirebaseMessaging.instance;

  Future<String?> init() async {
    await instance.requestPermission();
    final token = await instance.getToken();
    instance.subscribeToTopic("all");
    print("[C_Instance_Token]: $token");
    onMessage();
    onMessageOpenedApp();
    onMessageBackground();
    return token;
  }

  onMessage() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        ScaffoldMessenger.of(navigatorKey.currentState!.context)
            .showSnackBar(_snackBar(message));
      },
    );
  }

  onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        ScaffoldMessenger.of(navigatorKey.currentState!.context)
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