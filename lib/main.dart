import 'package:amphawan/frontpage/main.dart';
import 'package:amphawan/view/dhamma/registerDhamma.dart';
import 'package:amphawan/view/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'amphawan',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Welcome(),
      routes: {
        "/frontpage": (_) => new frontpage(),
      },
    );
  }
}
