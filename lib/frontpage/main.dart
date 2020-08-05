import 'package:amphawan/frontpage/home.dart';
import 'package:amphawan/frontpage/menu.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:flutter/material.dart';

class frontpage extends StatefulWidget {
  @override
  _frontpageState createState() => _frontpageState();
}

class _frontpageState extends State<frontpage> {
  TextStyle textBottomBar =
      TextStyle(fontFamily: FontStyles().fontFamily, color: Colors.grey);
  String fontfamily = FontStyles().fontFamily;

  int _selectedIndex = 0;
  final widgetOptions = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    ListMenu(),
  ];

  @override
  void initState() {
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
                style: TextStyle(fontSize: 12, fontFamily: 'Kanit')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text(
              'กิจกรรม',
              style: TextStyle(fontSize: 12, fontFamily: 'Kanit'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.white,
            ),
            title: Text('ปฎิบัติธรรม',
                style: TextStyle(fontSize: 12, fontFamily: 'Kanit')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            title: Text('สื่อธรรมะ',
                style: TextStyle(fontSize: 12, fontFamily: 'Kanit')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('เมนูอื่น ๆ',
                style: TextStyle(fontSize: 12, fontFamily: 'Kanit')),
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
