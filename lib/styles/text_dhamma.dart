import 'package:amphawan/styles/font_style.dart';
import 'package:flutter/material.dart';

class TextDhamma {
  //Text Topic
  TextStyle txtTopic = TextStyle(
      fontFamily: FontStyles().fontFamily, color: Colors.black, fontSize: 15);

  //Text 'เต็ม'
  TextStyle txtFull = TextStyle(
      fontFamily: FontStyles().fontFamily,
      color: Color(0xFFB9582C),
      fontSize: 15);

  //Text Topic for activity
  TextStyle txtTopicActivity = TextStyle(
      fontFamily: FontStyles().fontFamily,
      color: Color(0xFFB49C48),
      fontSize: 18);
}
