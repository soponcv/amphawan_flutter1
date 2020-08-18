import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:flutter/material.dart';

class DeatilActivity extends StatefulWidget {
  final String topic;
  DeatilActivity({Key key, @required this.topic}) : super(key: key);
  @override
  _DeatilActivityState createState() => _DeatilActivityState();
}

class _DeatilActivityState extends State<DeatilActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.topic,
          style: TextStyles().titleBar,
        ),
        shape: CustomShapeBorder(),
        backgroundColor: Color(0xFFDFF1CD),
        iconTheme: IconThemeData(
          color: Color(0xFF4D890E), //change your color here
        ),
      ),
      body: Container(
        height: 1000,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg/bg.png'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }
}
