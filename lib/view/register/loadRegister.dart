import 'dart:convert';

import 'package:amphawan/frontpage/main.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/dhamma/registerDhamma.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoadRegister extends StatefulWidget {
  final String cid;
  final bool status;
  LoadRegister({Key key, @required this.cid, this.status}) : super(key: key);
  @override
  _LoadRegisterState createState() => _LoadRegisterState();
}

class _LoadRegisterState extends State<LoadRegister> {
  @override
  void initState() {
    super.initState();
    postDRegister(http.Client());
  }

  Future<String> postDRegister(http.Client client) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username;
    setState(() {
      username = prefs.getString('perUsername');
    });
    Map _map = {
      "cid": widget.cid,
      "username": username,
    };
    if (widget.cid != '0') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegDhamma(
            dhamma_id: int.parse(widget.cid),
            username: username,
          ),
        ),
      );
    } else {
      setState(() {
        Fluttertoast.showToast(
            msg: "บันทึกข้อมูล เสร็จสิ้น",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => frontpage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
