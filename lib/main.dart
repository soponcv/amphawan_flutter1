import 'package:amphawan/frontpage/main.dart';
import 'package:amphawan/system/notification.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

// void main() => runApp(MyApp());

Future<void> main() async {
  // ---start------- ให้แอพทำงานเบื้องหลัง หลังจากปิดแอพไปแล้ว
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager.initialize(callbackDispatcher,
      isInDebugMode:
          true); //to true if still in testing lev turn it to false whenever you are launching the app
  await Workmanager.registerPeriodicTask("5", simplePeriodicTask,
      existingWorkPolicy: ExistingWorkPolicy.replace,
      frequency: Duration(minutes: 15), //when should it check the link
      initialDelay:
          Duration(seconds: 5), //duration before showing the notification
      constraints: Constraints(
        networkType: NetworkType.connected,
      ));
  // ---end------- ให้แอพทำงานเบื้องหลัง หลังจากปิดแอพไปแล้ว
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'amphawan',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: frontpage(),
    );
  }
}
