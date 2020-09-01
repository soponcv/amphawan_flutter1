import 'package:amphawan/main.dart';
import 'package:amphawan/system/notiFirebase.dart';
import 'package:amphawan/view/activity/mainActivity.dart';
import 'package:amphawan/view/dhamma/mainDhamma.dart';
import 'package:amphawan/frontpage/home.dart';
import 'package:amphawan/view/media/mainMedia.dart';
import 'package:amphawan/frontpage/menu.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class frontpage extends StatefulWidget {
  @override
  _frontpageState createState() => _frontpageState();
}

class _frontpageState extends State<frontpage> {
  String message;
  String channelId = "1000";
  String channelName = "FLUTTER_NOTIFICATION_CHANNEL";
  String channelDescription = "FLUTTER_NOTIFICATION_CHANNEL_DETAIL";

  TextStyle textBottomBar =
      TextStyle(fontFamily: FontStyles().fontFamily, color: Colors.grey);
  String fontfamily = FontStyles().fontFamily;

  int _selectedIndex = 0;
  final widgetOptions = [
    HomePage(),
    ActivityPage(
      main: 1,
    ),
    DhammaPage(
      main: 1,
    ),
    MediaPage(main: 1),
    ListMenu(),
  ];

  @override
  void initState() {
    message = "No message.";

    var initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) {
      print("onDidReceiveLocalNotification called.");
    });
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) {
      // when user tap on notification.
      print("onSelectNotification called.");
      setState(() {
        message = payload;
      });
    });
    initFirebaseMessaging();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        elevation: 0.0,
        child: new Icon(Icons.person_outline),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4.0,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('หน้าหลัก',
                style: TextStyle(fontSize: 12, fontFamily: 'K2D')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text(
              'กิจกรรม',
              style: TextStyle(fontSize: 12, fontFamily: 'K2D'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.white,
            ),
            title: Text('ปฎิบัติธรรม',
                style: TextStyle(fontSize: 12, fontFamily: 'K2D')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            title: Text('สื่อธรรมะ',
                style: TextStyle(fontSize: 12, fontFamily: 'K2D')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('เมนูอื่น ๆ',
                style: TextStyle(fontSize: 12, fontFamily: 'K2D')),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: textBottomBar,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
