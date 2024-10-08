// Documents and Integration
// https://pub.dev/packages/awesome_notifications

// ignore_for_file: avoid_print

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

final awesomeNotificationService = AwesomeNotificationService();

class AwesomeNotificationService {
  final _noti = AwesomeNotifications();
  AwesomeNotifications get noti => _noti;

  void init() {
    _noti.initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          channelDescription: 'Notification Channel',
          defaultColor: Colors.teal, // primaryColor
          ledColor: Colors.white,
          playSound: true,
          channelShowBadge: true,
          importance: NotificationImportance.High,
        ),
      ],
    );

    _noti.isNotificationAllowed().then((isAllowed) {
      // Edit
      if (!isAllowed) {
        _noti.requestPermissionToSendNotifications();
      } else {
        listen();
      }
    });
  }

  void listen() {
    // Edit
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (ReceivedAction receivedAction) async {
        print("[C_notiListenAction]: $receivedAction");
        // if (receivedAction.buttonKeyPressed == "btn1") {
        //   print("[C_btn1]: Button 1 Clicked");
        // } else if (receivedAction.buttonKeyPressed == "btn2") {
        //   print("[C_btn2]: Button 2 Clicked");
        // }
      },
      onNotificationCreatedMethod:
          (ReceivedNotification receivedNotification) async {},
      onNotificationDisplayedMethod:
          (ReceivedNotification receivedNotification) async {},
      onDismissActionReceivedMethod: (ReceivedAction receivedAction) async {
        print("[C_notiListenDismissed]: $receivedAction");
      },
    );
  }

  int create({
    int? id,
    String? title,
    required String? body,
    String? groupKey,
    NotificationLayout layout = NotificationLayout.Default,
    String? largeIcon,
    String? bigPicture,
    Color? color,
    List<NotificationActionButton>? buttons,
    DateTime? showDate,
  }) {
    id ??= DateTime.now().millisecondsSinceEpoch.remainder(100000);
    _noti.createNotification(
      content: NotificationContent(
        channelKey: 'basic_channel',
        id: id,
        title: title,
        body: body,
        groupKey: groupKey,
        color: color,
        largeIcon: largeIcon,
        bigPicture: bigPicture,
        notificationLayout:
            bigPicture != null ? NotificationLayout.BigPicture : layout,
      ),
      actionButtons: buttons,
      schedule: showDate == null
          ? null
          : NotificationCalendar.fromDate(date: showDate),
    );
    return id;
  }
}
