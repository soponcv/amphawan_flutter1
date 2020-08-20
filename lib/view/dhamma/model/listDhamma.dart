import 'package:amphawan/styles/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListDhamma1 {
  final String id;
  final String cid;
  final String subject;

  ListDhamma1({this.id, this.cid, this.subject});

  factory ListDhamma1.fromJson(Map<String, dynamic> json) {
    return ListDhamma1(
        id: json['id'] as String,
        cid: json['cid'] as String,
        subject: json['subject'] as String);
  }
}

class ListDhamma2 {
  final String id;
  final String cid;
  final String subject;

  ListDhamma2({this.id, this.cid, this.subject});

  factory ListDhamma2.fromJson(Map<String, dynamic> json) {
    return ListDhamma2(
        id: json['id'] as String,
        cid: json['cid'] as String,
        subject: json['subject'] as String);
  }
}

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
