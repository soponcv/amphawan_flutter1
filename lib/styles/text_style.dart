import 'package:amphawan/styles/font_style.dart';
import 'package:flutter/material.dart';

class TextStyles {
  //Text Main Menu
  TextStyle appBar = TextStyle(fontFamily: FontStyles().fontFamily);
  //Titel Bar
  TextStyle titleBar = TextStyle(
      fontFamily: FontStyles().fontFamily,
      fontSize: 18,
      color: Color(0xFF4D890E));
  //Login
  TextStyle txtLogin = TextStyle(
      fontFamily: FontStyles().fontFamily, fontSize: 16, color: Colors.white);
  TextStyle txtLoginGoogle = TextStyle(
      fontFamily: FontStyles().fontFamily, fontSize: 16, color: Colors.black);
  TextStyle txtLableLogin =
      TextStyle(fontFamily: FontStyles().fontFamily, color: Colors.green);
  TextStyle txtBottomLogin = TextStyle(
      fontFamily: FontStyles().fontFamily, color: Colors.white, fontSize: 18);
  TextStyle txtBottomRegister = TextStyle(
      fontFamily: FontStyles().fontFamily, color: Colors.black, fontSize: 18);

  //FormRegister
  TextStyle txtLableRegister = TextStyle(
      fontFamily: FontStyles().fontFamily, color: Colors.black, fontSize: 16);

  //Infromation
  TextStyle txtInfor2 = TextStyle(
      fontFamily: FontStyles().fontFamily,
      color: Color(0xFF7F9525),
      fontSize: 16);
  TextStyle txtInfor2_a = TextStyle(
      fontFamily: FontStyles().fontFamily, color: Colors.black, fontSize: 16);

  TextStyle txt_appBar =
      TextStyle(fontFamily: FontStyles().fontFamily, fontSize: 16);
  TextStyles() : super();
}
