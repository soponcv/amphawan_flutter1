import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/text_dhamma.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/view/dhamma/dhammaOne.dart';
import 'package:amphawan/view/dhamma/dhammaThree.dart';
import 'package:amphawan/view/dhamma/dhammaTwo.dart';
import 'package:flutter/material.dart';

class DhammaPage extends StatefulWidget {
  @override
  _DhammaPageState createState() => _DhammaPageState();
}

class _DhammaPageState extends State<DhammaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'สมัครปฏิบัติธรรม',
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              dhammaOne(context),
              Padding(padding: EdgeInsets.all(5)),
              dhammaTwo(context),
              Padding(padding: EdgeInsets.all(5)),
              dhammaThree(context),
              Padding(padding: EdgeInsets.all(15)),
            ],
          ),
        ),
      ),
    );
  }
}
