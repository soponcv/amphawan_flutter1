import 'dart:convert';

import 'package:amphawan/frontpage/main.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/dhamma/registerDhamma.dart';
import 'package:flutter/material.dart';
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
      var map = json.encode(_map);
      final response = await client.post(PathAPI().postRegister,
          headers: {"Content-Type": "application/json"}, body: map);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      var body = json.decode(response.body);
      if (body['status'] == 'true') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegDhamma(
              dhamma_id: int.parse(widget.cid),
              username: username,
            ),
          ),
        );
      }
    } else {
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
