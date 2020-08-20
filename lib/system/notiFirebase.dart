import 'dart:io';

import 'package:amphawan/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

void initFirebaseMessaging() {
  firebaseMessaging.configure(
    // onBackgroundMessage: (Map<String, dynamic> message) async {
    //   print("onMessage: $message");
    //   Map mapNotification = message["notification"];
    //   String title = mapNotification["title"];
    //   String body = mapNotification["body"];
    //   sendNotification(title: title, body: body);
    // },
    onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
      Map mapNotification = message["notification"];
      String title = mapNotification["title"];
      String body = mapNotification["body"];
      sendNotification(title: title, body: body);
    },

    onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
    },
    onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
    },
  );
  firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(
          sound: true, badge: true, alert: true, provisional: false));

  firebaseMessaging.onIosSettingsRegistered
      .listen((IosNotificationSettings settings) {
    print("Settings registered: $settings");
  });

  firebaseMessaging.getToken().then((String token) {
    assert(token != null);
    print("Token : $token");
  });
}

sendNotification({title, body}) async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails('10000',
      'FLUTTER_NOTIFICATION_CHANNEL', 'FLUTTER_NOTIFICATION_CHANNEL_DETAIL',
      importance: Importance.Max, priority: Priority.High);
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();

  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
      111, title, body, platformChannelSpecifics,
      payload: 'I just haven\'t Met You Yet');
}
