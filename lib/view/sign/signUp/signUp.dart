import 'dart:convert';

import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/register/mainRegister.dart';
import 'package:amphawan/view/sign/signUp/model/postData.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String u = 'false', e = 'false';

  //Start-----Text Input
  TextEditingController _inputName = TextEditingController();
  TextEditingController _inputLastName = TextEditingController();
  TextEditingController _inputUsername = TextEditingController();
  TextEditingController _inputPassword = TextEditingController();
  TextEditingController _inputEmail = TextEditingController();
  //End-----Text Input

  @override
  void initState() {
    super.initState();
  }

// Make Data to Map
  _perData() {
    Map _map = {};
    String name = _inputName.text;
    String lastName = _inputLastName.text;
    String username = _inputUsername.text;
    String password = _inputPassword.text;
    String email = _inputEmail.text;
    _map.addAll({
      "name": name,
      "lastName": lastName,
      "username": username,
      "password": password,
      "email": email,
      "type_sign": "i"
    });

    var body = json.encode(_map);
    print(body);
    postDRegister(http.Client(), body, _map); // Send Data To API(PHP)
  }

  Future<String> postDRegister(http.Client client, jsonMap, Map map) async {
    final response = await client.post(PathAPI().checkPostMember,
        headers: {"Content-Type": "application/json"}, body: jsonMap);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var body = json.decode(response.body);
    setState(() {
      u = body['usernameCheck'];
      e = body['emailCheck'];
      if (e == 'false' && u == 'false') {
        setState(() {
          Fluttertoast.showToast(
              msg: "Email และ Username นี้ ถูกใช้งานแล้ว",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      } else if (e == 'false') {
        setState(() {
          Fluttertoast.showToast(
              msg: "Email นี้ ถูกใช้งานแล้ว",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      } else if (u == 'false') {
        setState(() {
          Fluttertoast.showToast(
              msg: "Username นี้ ถูกใช้งานแล้ว",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PostSignUp(
                    map: map,
                  )),
        );
      }
    });
  }

  Widget usernameResgister() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.only(right: 2, left: 2),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 50,
                  child: TextFormField(
                    controller: _inputName,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "ชื่อ",
                      labelStyle: TextStyles().txtLableRegister,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'กรุณากรอกข้อมูล';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.all(2.1)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 50,
                  child: TextFormField(
                    controller: _inputLastName,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "นามสกุล",
                      labelStyle: TextStyles().txtLableRegister,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'กรุณากรอกข้อมูล';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: TextFormField(
                controller: _inputUsername,
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                style: TextStyle(fontFamily: FontStyles().fontFamily),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCECECE))),
                  labelText: "Username",
                  labelStyle: TextStyles().txtLableRegister,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'กรุณากรอกข้อมูล';
                  }
                  return null;
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(2)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: TextFormField(
                controller: _inputPassword,
                cursorColor: Colors.black,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                style: TextStyle(fontFamily: FontStyles().fontFamily),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCECECE))),
                  labelText: "Password",
                  labelStyle: TextStyles().txtLableRegister,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'กรุณากรอกข้อมูล';
                  }
                  return null;
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(2)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: TextFormField(
                controller: _inputEmail,
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontFamily: FontStyles().fontFamily),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCECECE))),
                  labelText: "Email",
                  labelStyle: TextStyles().txtLableRegister,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'กรุณากรอกข้อมูล';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xFF52B64F),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _perData();
                    }
                  },
                  child: Text(
                    'ลงทะเบียน',
                    style: TextStyles().txtBottomLogin,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ลงทะเบียนสมาชิก',
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
        color: Color(0xFFEDF0F8),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(5)),
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.all(5)),
                            usernameResgister(),
                            Padding(padding: EdgeInsets.all(5)),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
