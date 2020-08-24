import 'package:amphawan/styles/font_style.dart';
import 'package:flutter/material.dart';

Widget noData() {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        height: 40.0,
      ),
      Text(
        'ไม่มีข้อมูล',
        style: TextStyle(
            fontFamily: FontStyles().fontFamily,
            fontSize: 16,
            color: Colors.grey),
      ),
    ],
  );
}

Widget noConnect() {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        height: 40.0,
      ),
      Text(
        '- 404 Error -',
        style: TextStyle(
            fontFamily: FontStyles().fontFamily,
            fontSize: 16,
            color: Colors.grey),
      ),
    ],
  );
}
