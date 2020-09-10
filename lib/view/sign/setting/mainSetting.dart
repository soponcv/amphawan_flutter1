import 'dart:convert';

import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/register/mainRegister.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String type = 'i';
  TextStyle _txt = TextStyle(
      fontFamily: FontStyles().fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.normal);
  TextStyle _txtSiggOut = TextStyle(
      fontFamily: FontStyles().fontFamily, fontSize: 18, color: Colors.white);

  // start---------------- Get Data From DATABASES
  Future fetchSign(http.Client client) async {
    String username;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('perUsername');
    });
    final response = await client.get(PathAPI().getMember + username);
    var map = json.decode(response.body);
    setState(() {
      type = map[0]['type_sign'];
    });
  }
  // end---------------- Get Data From DATABASES

  @override
  void initState() {
    fetchSign(http.Client());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ตั้งค่า',
          style: TextStyles().titleBar,
        ),
        shape: CustomShapeBorder(),
        backgroundColor: Color(0xFFDFF1CD),
        iconTheme: IconThemeData(
          color: Color(0xFF4D890E), //change your color here
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg/bg.png'), fit: BoxFit.cover),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(5)),
              FlatButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.vpn_key,
                      size: 30,
                      color: Color(0xFF67B762),
                    ),
                    Text(
                      ' เปลี่ยนรหัสผ่าน',
                      style: _txt,
                    )
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainRegister(
                        cid: 'edit',
                        txtTitle: 'แก้ไขข้อมูล',
                        txtDetail: '',
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 30,
                      color: Color(0xFF67B762),
                    ),
                    Text(' แก้ไขข้อมูล', style: _txt)
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    height: 100,
                    child: Column(
                      children: [
                        Container(
                          height: 20,
                          child: Text(
                            'CityVariety Corporation Co.,Ltd. © 2020',
                            style: TextStyle(
                                fontFamily: FontStyles().fontFamily,
                                fontSize: 14,
                                color: Colors.grey[400]),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'You Login With : ',
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: FontStyles().fontFamily),
                              ),
                              FaIcon(
                                FontAwesomeIcons.facebookSquare,
                                color: type == 'g'
                                    ? Colors.blue[200]
                                    : Colors.grey[400],
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              FaIcon(
                                FontAwesomeIcons.line,
                                color: type == 'l'
                                    ? Colors.green[200]
                                    : Colors.grey[400],
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              FaIcon(
                                FontAwesomeIcons.googlePlusSquare,
                                color: type == 'g'
                                    ? Colors.red[200]
                                    : Colors.grey[400],
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              FaIcon(
                                FontAwesomeIcons.envelopeSquare,
                                color: type == 'i'
                                    ? Colors.amber[200]
                                    : Colors.grey[400],
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: 40,
                            color: Colors.amber,
                            child: RaisedButton(
                              color: Colors.redAccent,
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.exit_to_app,
                                    color: Colors.white,
                                  ),
                                  Text(' ออกจากระบบ', style: _txtSiggOut)
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
