import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:flutter/material.dart';

class MainRegisterThree extends StatefulWidget {
  @override
  _MainRegisterThreeState createState() => _MainRegisterThreeState();
}

class _MainRegisterThreeState extends State<MainRegisterThree> {
  final _formKey = GlobalKey<FormState>();

  //Start-----Text Input
  TextEditingController _inputMeditation =
      TextEditingController(); //ท่านเคยฝึกสมาธิภาวนาหรือไม่ ถ้าเคยที่
  TextEditingController _inputJangwat = TextEditingController();
  TextEditingController _inputPractice =
      TextEditingController(); //วิธีที่เคยปฏิบัติ
  TextEditingController _inputNumber = TextEditingController();
  TextEditingController _inputInstructor = TextEditingController(); // ผู้ฝึกสอน
  TextEditingController _inputAmphawanNumber = TextEditingController();
  TextEditingController _inputLife = TextEditingController(); //ปัญหาชีวิต
  TextEditingController _inputAllure = TextEditingController(); //เหตุจูงใจ

  //End-----Text Input

  Widget formResgister() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: TextField(
                  controller: _inputMeditation,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "ท่านเคยฝึกสมาธิภาวนาหรือไม่ ถ้าเคยที่",
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
                  controller: _inputJangwat,
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
            Padding(padding: EdgeInsets.all(2)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.44,
              height: 50,
              child: TextField(
                  controller: _inputPractice,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "วิธีที่เคยปฏิบัติ",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(2)),
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 50,
              child: TextField(
                  maxLength: 3,
                  controller: _inputNumber,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "จำนวน(ครั้ง)",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
            Padding(padding: EdgeInsets.all(2)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.58,
              height: 50,
              child: TextField(
                  controller: _inputInstructor,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "ผู้ฝึกสอน",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(2)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              child: Text(
                'ท่านเคยเข้าปฏิบัติธรรมที่วัดอัมพวันหรือไม่ ถ้าเคย จำนวน',
                style: TextStyle(
                    fontFamily: FontStyles().fontFamily, fontSize: 15),
              ),
            ),
            Padding(padding: EdgeInsets.all(3)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 50,
              child: TextField(
                  maxLength: 3,
                  controller: _inputAmphawanNumber,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "ครั้ง",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(5)),
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: TextField(
                  controller: _inputLife,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "ข้าพเจ้าต้องการแก้ไขปัญหาชีวิตในเรื่อง",
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
                  controller: _inputAllure,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCECECE))),
                    labelText: "เหตุจูงใจที่มาปฏิบัติธรรม",
                    labelStyle: TextStyles().txtLableRegister,
                  )),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(10)),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.grey,
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SignUp()),
                  // );
                },
                child: Text(
                  'ยกเลิก',
                  style: TextStyle(
                      fontFamily: FontStyles().fontFamily,
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
              ),
              RaisedButton(
                color: Color(0xFF75B732),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SignUp()),
                  // );
                },
                child: Text(
                  'สมัคร',
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

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ลงทะเบียน',
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
                                        color: Color(0xFFF19539),
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
