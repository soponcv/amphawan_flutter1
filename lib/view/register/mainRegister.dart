import 'dart:convert';

import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/register/mainRegisterTwo.dart';
import 'package:flutter/material.dart';

class MainRegister extends StatefulWidget {
  final String cid;
  final String txtTitle;
  final String txtDetail;
  MainRegister({Key key, @required this.cid, this.txtTitle, this.txtDetail})
      : super(key: key);
  @override
  _MainRegisterState createState() => _MainRegisterState();
}

class _MainRegisterState extends State<MainRegister> {
  final _formKey = GlobalKey<FormState>();

  //Start-----Text Input
  TextEditingController _inputName = TextEditingController();
  TextEditingController _inputLastName = TextEditingController();
  TextEditingController _inputAge = TextEditingController();
  TextEditingController _inputIdCard = TextEditingController();
  TextEditingController _inputPhone = TextEditingController();
  TextEditingController _inputDisease = TextEditingController(); //โรคประจำตัว
  TextEditingController _inputMind = TextEditingController(); //สุขภาพจิต
  //บ้านเลขที่
  TextEditingController _inputBNum = TextEditingController();
  TextEditingController _inputBMoo = TextEditingController();
  TextEditingController _inputBSoy = TextEditingController();
  TextEditingController _inputBRoad = TextEditingController();
  TextEditingController _inputBTambon = TextEditingController();
  TextEditingController _inputBAmpher = TextEditingController();
  TextEditingController _inputBJangwat = TextEditingController();
  TextEditingController _inputBZip = TextEditingController();
  //End-----Text Input

  // Make Data to Map
  _perData() {
    String inputName = _inputName.text;
    String inputLastName = _inputLastName.text;
    String inputAge = _inputAge.text;
    String inputIdCard = _inputIdCard.text;
    String inputPhone = _inputPhone.text;
    String inputDisease = _inputDisease.text;
    String inputMind = _inputMind.text;
    String inputBNum = _inputBNum.text;
    String inputBMoo = _inputBMoo.text;
    String inputBSoy = _inputBSoy.text;
    String inputBRoad = _inputBRoad.text;
    String inputBTambon = _inputBTambon.text;
    String inputBAmpher = _inputBAmpher.text;
    String inputBJangwat = _inputBJangwat.text;
    String inputBZip = _inputBZip.text;
    Map map = {
      "iName": inputName,
      "iLastName": inputLastName,
      "iAge": inputAge,
      "iIdCard": inputIdCard,
      "iPhone": inputPhone,
      "iDisease": inputDisease,
      "iMind": inputMind,
      "iBNum": inputBNum,
      "iBMoo": inputBMoo,
      "iBSoy": inputBSoy,
      "iBRoad": inputBRoad,
      "iBTambon": inputBTambon,
      "iBAmpher": inputBAmpher,
      "iBJangwat": inputBJangwat,
      "iBZip": inputBZip,
    };
    // var body = json.encode(map);
    return map;
    // postDRegister(http.Client(), body); // Send Data To API(PHP)
  }

  Widget formResgister() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.44,
              height: 50,
              child: TextField(
                  controller: _inputName,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "ชื่อ",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
            Padding(padding: EdgeInsets.all(2)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.44,
              height: 50,
              child: TextField(
                  controller: _inputLastName,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "สกุล",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(2)),
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              height: 50,
              child: TextField(
                  maxLength: 2,
                  controller: _inputAge,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "อายุ",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
            Padding(padding: EdgeInsets.all(2)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.73,
              height: 50,
              child: TextField(
                  maxLength: 13,
                  controller: _inputIdCard,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "หมายเลขบัตรประชาชน (13 หลัก)",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(2)),
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.31,
              height: 50,
              child: TextField(
                  controller: _inputBNum,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "บ้านเลขที่",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
            Padding(padding: EdgeInsets.all(2)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 50,
              child: TextField(
                  maxLength: 2,
                  controller: _inputBMoo,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "หมู่ที่",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
            Padding(padding: EdgeInsets.all(2)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              height: 50,
              child: TextField(
                  controller: _inputBSoy,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "ตรอก/ซอย",
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
              child: TextField(
                  controller: _inputBRoad,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "ถนน",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
            Padding(padding: EdgeInsets.all(2)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.44,
              height: 50,
              child: TextField(
                  controller: _inputBTambon,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "ตำบล",
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
              child: TextField(
                  controller: _inputBAmpher,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "อำเภอ",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
            Padding(padding: EdgeInsets.all(2)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.44,
              height: 50,
              child: TextField(
                  controller: _inputBJangwat,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "จังหวัด",
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
              child: TextField(
                  maxLength: 5,
                  controller: _inputBZip,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "รหัสไปรษณีย์",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
            Padding(padding: EdgeInsets.all(2)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.44,
              height: 50,
              child: TextField(
                  maxLength: 10,
                  controller: _inputPhone,
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
        Padding(padding: EdgeInsets.all(2)),
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: TextField(
                  controller: _inputDisease,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "โรคประจำตัว",
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
              child: TextField(
                  controller: _inputMind,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "ปัญหาสุขภาพจิต(ถ้ามี)",
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
                  // _perData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainRegisterTwo(
                              cid: widget.cid,
                              txtTitle: widget.txtTitle,
                              txtDetail: detail,
                              map: _perData(),
                            )),
                  );
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
    );
  }

  String detail;

  @override
  void initState() {
    detail = widget.txtDetail;
    super.initState();
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
                                        color: Color(0xFFEDF0F8),
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
