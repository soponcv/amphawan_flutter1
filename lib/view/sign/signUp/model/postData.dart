import 'dart:convert';

import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/register/mainRegister.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PostSignUp extends StatefulWidget {
  final Map map;
  PostSignUp({Key key, @required this.map}) : super(key: key);
  @override
  _PostSignUpState createState() => _PostSignUpState();
}

class _PostSignUpState extends State<PostSignUp> {
  Map _map = {};
  @override
  void initState() {
    _map.addAll(widget.map);
    print(_map);
    saveUser(widget.map['username']);
    var body = json.encode(_map);
    postDRegister(http.Client(), body);
    super.initState();
  }

  Future<String> postDRegister(http.Client client, jsonMap) async {
    final response = await client.post(PathAPI().postMember,
        headers: {"Content-Type": "application/json"}, body: jsonMap);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      print(jsonMap);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainRegister(
            cid: null,
            txtTitle: 'ลงทะเบียนสมาชิก',
            txtDetail: '',
          ),
        ),
      );
    });
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

saveUser(String user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final value = user;
  prefs.setString('myUsername', value);
  print('saved $value');
}
