import 'dart:async';
import 'dart:convert';

import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/register/mainRegister.dart';
import 'package:amphawan/view/sign/main_login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class CheckSignInDhamma extends StatefulWidget {
  final String cid;
  final String txtTitle;
  final String txtDetail;
  CheckSignInDhamma(
      {Key key, @required this.cid, this.txtTitle, this.txtDetail})
      : super(key: key);
  @override
  _CheckSignInDhammaState createState() => _CheckSignInDhammaState();
}

class _CheckSignInDhammaState extends State<CheckSignInDhamma> {
  String signed = '';
  bool registed = false;
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _check();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("! คุณเคยสมัครการปฏิบัติธรรมนี้แล้ว",
              style: TextStyle(
                  fontFamily: FontStyles().fontFamily,
                  color: Colors.redAccent,
                  fontSize: 16)),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop(true);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  _check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      signed = prefs.getString('perUsername');
    });
    if (signed != null) {
      fetchSuccess(http.Client(), signed);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainLogin(),
        ),
      );
    }
  }

  // start---------------- Get Data From DATABASES
  fetchSuccess(http.Client client, String username) async {
    Map _map = {
      "dhamma_id": widget.cid,
      "username": username,
    };
    var jsonMap = json.encode(_map);
    print(_map);
    final response = await client.post(PathAPI().getPerRegister,
        headers: {"Content-Type": "application/json"}, body: jsonMap);
    print(response.body.toString());
    var display = json.decode(response.body);
    String dis = display.toString();
    print("dis = " + dis);
    if (dis == '{status: false}') {
      setState(() {
        registed = true;
        print(registed);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainRegister(
                cid: widget.cid,
                txtTitle: widget.txtTitle,
                txtDetail: widget.txtDetail),
          ),
        );
      });
    } else {
      setState(() {
        registed = false;
        print(registed);
        // _showDialog();
        Fluttertoast.showToast(
            msg: "ไม่สามารถสมัครได้ เนื่องจากคุณได้สมัครแล้ว",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pop(context);
      });
    }
    if (registed == true) {
    } else {}
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
