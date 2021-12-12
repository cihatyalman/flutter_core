
// firebase_analytics: 
// firebase_messaging: 

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await firebaseManager.pushService.init();
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   runApp(MyApp());
// }


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebasePushService {
  final instance = FirebaseMessaging.instance;

  Future init() async {
    await instance.requestPermission();
    final token = await instance.getToken();
    instance.subscribeToTopic("all");
    print("[C_Instance_Token]: $token");
  }
  
  onMessage(BuildContext context){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      ScaffoldMessenger.of(context).showSnackBar(_snackBar(message));
    });
  }
  onMessageOpenedApp(BuildContext context){
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      ScaffoldMessenger.of(context).showSnackBar(_snackBar(message));
    });
  }

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
