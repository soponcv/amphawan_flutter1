import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:flutter/material.dart';

class PlaySound extends StatefulWidget {
  @override
  _PlaySoundState createState() => _PlaySoundState();
}

class _PlaySoundState extends State<PlaySound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'สื่อธรรมะ',
          style: TextStyles().titleBar,
        ),
        shape: CustomShapeBorder(),
        backgroundColor: Color(0xFFDFF1CD),
        iconTheme: IconThemeData(
          color: Color(0xFF4D890E), //change your color here
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg/bg.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
