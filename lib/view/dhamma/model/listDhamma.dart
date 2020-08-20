import 'package:amphawan/styles/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListDhamma1 {
  final String id;
  final String cid;
  final String subject;
  final String num_person;
  final String date_start;
  final String date_end;

  ListDhamma1(
      {this.id,
      this.cid,
      this.subject,
      this.num_person,
      this.date_start,
      this.date_end});

  factory ListDhamma1.fromJson(Map<String, dynamic> json) {
    return ListDhamma1(
      id: json['id'] as String,
      cid: json['cid'] as String,
      subject: json['subject'] as String,
      num_person: json['num_person'] as String,
      date_start: json['date_start'] as String,
      date_end: json['date_end'] as String,
    );
  }
}

class ListDhamma2 {
  final String id;
  final String cid;
  final String subject;
  final String num_person;
  final String date_start;
  final String date_end;

  ListDhamma2(
      {this.id,
      this.cid,
      this.subject,
      this.num_person,
      this.date_start,
      this.date_end});

  factory ListDhamma2.fromJson(Map<String, dynamic> json) {
    return ListDhamma2(
      id: json['id'] as String,
      cid: json['cid'] as String,
      subject: json['subject'] as String,
      num_person: json['num_person'] as String,
      date_start: json['date_start'] as String,
      date_end: json['date_end'] as String,
    );
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
