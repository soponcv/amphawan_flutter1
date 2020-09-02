import 'dart:convert';

import 'package:amphawan/frontpage/main.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SetSignIn extends StatefulWidget {
  final String username;
  final String password;
  final String email;

  SetSignIn({Key key, @required this.username, this.password, this.email})
      : super(key: key);

  @override
  _SetSignInState createState() => _SetSignInState();
}

class _SetSignInState extends State<SetSignIn> {
  @override
  void initState() {
    fetchSignIn(http.Client(), widget.username, widget.password, widget.email);
    super.initState();
  }

  //Start -- getShowData From DB
  fetchSignIn(http.Client client, user, pass, email) async {
    final response = await client.get(PathAPI().getMember + user);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      String passMd5 = md5.convert(utf8.encode(pass)).toString();
      if (body.toString() != '[]') {
        if (user == body[0]['username'] &&
            passMd5 == body[0]['password'] &&
            widget.email == null) {
          SetLogin().save(body[0]['username'], body[0]['name'],
              body[0]['lastname'], body[0]['email'], body[0]['status']);
          Navigator.pushReplacementNamed(
            context,
            '/frontpage',
          );
        } else if (user == body[0]['username'] &&
            email == body[0]['email'] &&
            widget.password == null) {
          SetLogin().save(body[0]['username'], body[0]['name'],
              body[0]['lastname'], body[0]['email'], body[0]['status']);
          Navigator.pop(context);
        }
      } else {
        _showDialogSignIn();
      }
    } else {
      _showDialogSignIn();
      throw Exception('Failed to load album');
    }
  }

  void _showDialogSignIn() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("! แจ้งเตือน",
              style: TextStyle(
                  fontFamily: FontStyles().fontFamily,
                  color: Colors.redAccent)),
          content: new Text("Username หรือ Password ของคุณไม่ถูกต้อง",
              style: TextStyle(
                fontFamily: FontStyles().fontFamily,
              )),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SetLogin {
  save(String username, String name, String lastname, String email,
      String status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('perUsername', username);
    prefs.setString('perName', name);
    prefs.setString('perLastName', lastname);
    prefs.setString('perEmail', email);
    prefs.setString('perStatus', status);
  }
}
