import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:flutter/material.dart';

class DetailDhamma extends StatefulWidget {
  final int cid;
  final String topic;
  DetailDhamma({Key key, @required this.cid, this.topic}) : super(key: key);
  @override
  _DetailDhammaState createState() => _DetailDhammaState();
}

class _DetailDhammaState extends State<DetailDhamma> {
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
