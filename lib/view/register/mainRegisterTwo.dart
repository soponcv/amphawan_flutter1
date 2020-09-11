import 'dart:convert';

import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/register/mainRegisterThree.dart';
import 'package:amphawan/view/register/model/listResgister.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MainRegisterTwo extends StatefulWidget {
  final String cid;
  final String txtTitle;
  final String txtDetail;
  MainRegisterTwo({Key key, @required this.cid, this.txtTitle, this.txtDetail})
      : super(key: key);
  @override
  _MainRegisterTwoState createState() => _MainRegisterTwoState();
}

class _MainRegisterTwoState extends State<MainRegisterTwo> {
  final _formKey = GlobalKey<FormState>();
  String username;
  String detail;
  bool stu = false;
  Map _map = {};

  //Start-----Text Input
  TextEditingController _inputNameBrother = TextEditingController(); //พ่อ
  TextEditingController _inputLastNameBrother = TextEditingController();
  TextEditingController _inputNameMather = TextEditingController(); //แมั
  TextEditingController _inputLastNameMather = TextEditingController();
  TextEditingController _inputNameHusband = TextEditingController(); //ผัว
  TextEditingController _inputLastNameHusband = TextEditingController();
  TextEditingController _inputNameWife = TextEditingController(); //เมีย
  TextEditingController _inputLastNameWife = TextEditingController();
  // // ติดต่อฉุกเฉิน
  TextEditingController _inputEmergency =
      TextEditingController(); //ชื่อ ฉุกเฉิน
  TextEditingController _inputReEmergency =
      TextEditingController(); //ความสัมพันธ์ ฉุกเฉิน
  TextEditingController _inputEmAddress = TextEditingController();
  TextEditingController _inputEmPhone = TextEditingController();
  //End-----Text Input

  String inputNameBrother;
  String inputLastNameBrother;
  String inputNameMather;
  String inputLastNameMather;
  String inputNameHusband;
  String inputLastNameHusband;
  String inputNameWife;
  String inputLastNameWife;
  String inputEmergency;
  String inputReEmergency;
  String inputEmAddress;
  String inputEmPhone;

  @override
  void initState() {
    detail = widget.txtDetail;
    // ----- SET VALUE ------
    super.initState();
    fetchRegister(http.Client());
  }

  //Start -- getShowData From DB
  fetchRegister(http.Client client) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('perUsername');
    });

    final response = await client.get(PathAPI().getMember + username);
    List<dynamic> userMap = jsonDecode(response.body);
    setState(() {
      _inputNameBrother.text = userMap[0]['nameBrother'];
      _inputLastNameBrother.text = userMap[0]['lastNameBrother'];
      _inputNameMather.text = userMap[0]['nameMather'];
      _inputLastNameMather.text = userMap[0]['lastNameMather'];
      _inputNameHusband.text = userMap[0]['nameHusband'];
      _inputLastNameHusband.text = userMap[0]['lastNameHusband'];
      _inputNameWife.text = userMap[0]['nameWife'];
      _inputLastNameWife.text = userMap[0]['lastNameWife'];
      _inputEmergency.text = userMap[0]['emergency'];
      _inputReEmergency.text = userMap[0]['reEmergency'];
      _inputEmAddress.text = userMap[0]['emAddress'];
      _inputEmPhone.text = userMap[0]['emPhone'];
    });
  }

  _perData() {
    inputNameBrother = _inputNameBrother.text;
    inputLastNameBrother = _inputLastNameBrother.text;
    inputNameMather = _inputNameMather.text;
    inputLastNameMather = _inputLastNameMather.text;
    inputNameHusband = _inputNameHusband.text;
    inputLastNameHusband = _inputLastNameHusband.text;
    inputNameWife = _inputNameWife.text;
    inputLastNameWife = _inputLastNameWife.text;
    inputEmergency = _inputEmergency.text;
    inputReEmergency = _inputReEmergency.text;
    inputEmAddress = _inputEmAddress.text;
    inputEmPhone = _inputEmPhone.text;

    Map _map = ({
      "username": username,
      "iNameBrother": inputNameBrother,
      "iLastNameBrother": inputLastNameBrother,
      "iNameMather": inputNameMather,
      "iLastNameMather": inputLastNameMather,
      "iNameHusband": inputNameHusband,
      "iLastNameHusband": inputLastNameHusband,
      "iNameWife": inputNameWife,
      "iLastNameWife": inputLastNameWife,
      "iEmergency": inputEmergency,
      "iReEmergency": inputReEmergency,
      "iEmAddress": inputEmAddress,
      "iEmPhone": inputEmPhone,
    });

    var body = json.encode(_map);
    // return map;
    postDRegister(http.Client(), body); // Send Data To API(PHP)
  }

  Future<String> postDRegister(http.Client client, jsonMap) async {
    final response = await client.post(PathAPI().updateMember2,
        headers: {"Content-Type": "application/json"}, body: jsonMap);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var body = json.decode(response.body);
    if (body['status'] == 'true') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainRegisterThree(
                  cid: widget.cid == 'edit' ? '0' : widget.cid,
                  txtTitle: widget.txtTitle,
                  txtDetail: detail,
                )),
      );
    } else {
      _showDialogError();
    }
  }

  void _showDialogError() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("! Error",
              style: TextStyle(
                  fontFamily: FontStyles().fontFamily,
                  color: Colors.redAccent)),
          content: new Text("มีปัญหาในการบันทึกข้อมูล",
              style: TextStyle(
                fontFamily: FontStyles().fontFamily,
              )),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget formResgister() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.44,
                height: 50,
                child: TextFormField(
                    controller: _inputNameBrother,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "ชื่อบิดา",
                      labelStyle: TextStyles().txtLableRegister,
                    )),
              ),
              Padding(padding: EdgeInsets.all(2)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.44,
                height: 50,
                child: TextFormField(
                    controller: _inputLastNameBrother,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "นามสกุล",
                      labelStyle: TextStyles().txtLableRegister,
                    )),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(2)),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.44,
                height: 50,
                child: TextFormField(
                    controller: _inputNameMather,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "ชื่อมารดา",
                      labelStyle: TextStyles().txtLableRegister,
                    )),
              ),
              Padding(padding: EdgeInsets.all(2)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.44,
                height: 50,
                child: TextFormField(
                    controller: _inputLastNameMather,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "นามสกุล",
                      labelStyle: TextStyles().txtLableRegister,
                    )),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(2)),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.44,
                height: 50,
                child: TextFormField(
                    controller: _inputNameHusband,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "ชื่อสามี",
                      labelStyle: TextStyles().txtLableRegister,
                    )),
              ),
              Padding(padding: EdgeInsets.all(2)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.44,
                height: 50,
                child: TextFormField(
                    controller: _inputLastNameHusband,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "นามสกุล",
                      labelStyle: TextStyles().txtLableRegister,
                    )),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(2)),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.44,
                height: 50,
                child: TextFormField(
                    controller: _inputNameWife,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "ชื่อภรรยา",
                      labelStyle: TextStyles().txtLableRegister,
                    )),
              ),
              Padding(padding: EdgeInsets.all(2)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.44,
                height: 50,
                child: TextFormField(
                    controller: _inputLastNameWife,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "นามสกุล",
                      labelStyle: TextStyles().txtLableRegister,
                    )),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ผู้ติดต่อกรณีฉุกเฉิน ',
                  style: TextStyle(
                      fontFamily: FontStyles().fontFamily, color: Colors.grey),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: 1,
                  color: Colors.grey,
                )
              ]),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                height: 50,
                child: TextFormField(
                    controller: _inputEmergency,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "ชื่อผู้ติดต่อฉุกเฉิน",
                      labelStyle: TextStyles().txtLableRegister,
                    )),
              ),
              Padding(padding: EdgeInsets.all(2)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.33,
                height: 50,
                child: TextFormField(
                    controller: _inputReEmergency,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "เกี่ยวข้องเป็น",
                      labelStyle: TextStyles().txtLableRegister,
                    )),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(2)),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: TextFormField(
                    controller: _inputEmAddress,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.streetAddress,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "ที่อยู่",
                      labelStyle: TextStyles().txtLableRegister,
                    )),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(2)),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: TextFormField(
                    maxLength: 10,
                    controller: _inputEmPhone,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontFamily: FontStyles().fontFamily),
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCECECE))),
                      labelText: "เบอร์ติดต่อ",
                      labelStyle: TextStyles().txtLableRegister,
                    )),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(10)),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xFFF3A65A),
                  onPressed: () {
                    // ---------
                    _perData();
                  },
                  child: Text(
                    'ถัดไป',
                    style: TextStyle(
                        fontFamily: FontStyles().fontFamily,
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _boxDetail() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      child: Text(
        detail,
        style: TextStyle(
            fontFamily: FontStyles().fontFamily,
            fontSize: 14,
            color: Color(0xFF4D890E)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.txtTitle != '' ? widget.txtTitle : 'ลงทะเบียนปฏิบัติธรรม',
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
              detail != '' ? _boxDetail() : Padding(padding: EdgeInsets.all(0)),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(5)),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF19539),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontStyles().fontFamily),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                color: Color(0xFFF19539),
                                height: 1,
                              ),
                              Container(
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF19539),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontStyles().fontFamily),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                color: Color(0xFFEDF0F8),
                                height: 1,
                              ),
                              Container(
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Color(0xFFEDF0F8),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontStyles().fontFamily),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(3)),
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Center(
                                  child: Text(
                                    'ข้อมูลส่วนตัว',
                                    style: TextStyle(
                                        color: Color(0xFFF19539),
                                        fontFamily: FontStyles().fontFamily),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                              ),
                              Container(
                                child: Center(
                                  child: Text(
                                    'ข้อมูลผู้เกี่ยวข้อง',
                                    style: TextStyle(
                                        color: Color(0xFFF19539),
                                        fontFamily: FontStyles().fontFamily),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                              ),
                              Container(
                                child: Center(
                                  child: Text(
                                    'ข้อมูลปฏิบัติธรรม',
                                    style: TextStyle(
                                        color: Color(0xFFEDF0F8),
                                        fontFamily: FontStyles().fontFamily),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.all(5)),
                            formResgister(),
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
