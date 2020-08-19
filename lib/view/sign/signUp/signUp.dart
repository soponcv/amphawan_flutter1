import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/view/register/mainRegister.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  //Start-----Text Input
  TextEditingController _inputName = TextEditingController();
  TextEditingController _inputLastName = TextEditingController();
  TextEditingController _inputUsername = TextEditingController();
  TextEditingController _inputPassword = TextEditingController();
  TextEditingController _inputEmail = TextEditingController();

  //End-----Text Input
  Widget usernameResgister() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.only(right: 2, left: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
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
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(2.1)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
                height: 50,
                child: TextField(
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
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(10)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: TextField(
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
            ),
          ),
          Padding(padding: EdgeInsets.all(2)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: TextField(
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
            ),
          ),
          Padding(padding: EdgeInsets.all(2)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: TextField(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainRegister(
                              txtTitle: 'ลงทะเบียนสมาชิก',
                              txtDetail: '',
                            )),
                  );
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
    );
  }

  // Widget formResgister() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: <Widget>[
  //       Row(
  //         children: <Widget>[
  //           SizedBox(
  //             width: MediaQuery.of(context).size.width * 0.44,
  //             height: 50,
  //             child: TextField(
  //                 controller: _inputName,
  //                 cursorColor: Colors.black,
  //                 keyboardType: TextInputType.text,
  //                 style: TextStyle(fontFamily: FontStyles().fontFamily),
  //                 decoration: InputDecoration(
  //                   border: OutlineInputBorder(
  //                       borderSide: BorderSide(color: Color(0xFFCECECE))),
  //                   labelText: "ชื่อ",
  //                   labelStyle: TextStyles().txtLableRegister,
  //                 )),
  //           ),
  //           Padding(padding: EdgeInsets.all(2)),
  //           SizedBox(
  //             width: MediaQuery.of(context).size.width * 0.44,
  //             height: 50,
  //             child: TextField(
  //                 controller: _inputLastName,
  //                 cursorColor: Colors.black,
  //                 keyboardType: TextInputType.text,
  //                 style: TextStyle(fontFamily: FontStyles().fontFamily),
  //                 decoration: InputDecoration(
  //                   border: OutlineInputBorder(
  //                       borderSide: BorderSide(color: Color(0xFFCECECE))),
  //                   labelText: "สกุล",
  //                   labelStyle: TextStyles().txtLableRegister,
  //                 )),
  //           ),
  //         ],
  //       ),
  //       Padding(padding: EdgeInsets.all(2)),
  //       Row(
  //         children: <Widget>[
  //           SizedBox(
  //             width: MediaQuery.of(context).size.width * 0.15,
  //             height: 50,
  //             child: TextField(
  //                 controller: _inputAge,
  //                 cursorColor: Colors.black,
  //                 keyboardType: TextInputType.text,
  //                 style: TextStyle(fontFamily: FontStyles().fontFamily),
  //                 decoration: InputDecoration(
  //                   border: OutlineInputBorder(
  //                       borderSide: BorderSide(color: Color(0xFFCECECE))),
  //                   labelText: "อายุ",
  //                   labelStyle: TextStyles().txtLableRegister,
  //                 )),
  //           ),
  //           Padding(padding: EdgeInsets.all(2)),
  //           SizedBox(
  //             width: MediaQuery.of(context).size.width * 0.73,
  //             height: 50,
  //             child: TextField(
  //                 controller: _inputIdCard,
  //                 cursorColor: Colors.black,
  //                 keyboardType: TextInputType.text,
  //                 style: TextStyle(fontFamily: FontStyles().fontFamily),
  //                 decoration: InputDecoration(
  //                   border: OutlineInputBorder(
  //                       borderSide: BorderSide(color: Color(0xFFCECECE))),
  //                   labelText: "หมายเลขบัตรประชาชน (13 หลัก)",
  //                   labelStyle: TextStyles().txtLableRegister,
  //                 )),
  //           ),
  //         ],
  //       ),
  //       Padding(padding: EdgeInsets.all(2)),
  //       Row(
  //         children: <Widget>[
  //           SizedBox(
  //             width: MediaQuery.of(context).size.width * 0.31,
  //             height: 50,
  //             child: TextField(
  //                 controller: _inputAge,
  //                 cursorColor: Colors.black,
  //                 keyboardType: TextInputType.text,
  //                 style: TextStyle(fontFamily: FontStyles().fontFamily),
  //                 decoration: InputDecoration(
  //                   border: OutlineInputBorder(
  //                       borderSide: BorderSide(color: Color(0xFFCECECE))),
  //                   labelText: "บ้านเลขที่",
  //                   labelStyle: TextStyles().txtLableRegister,
  //                 )),
  //           ),
  //           Padding(padding: EdgeInsets.all(2)),
  //           SizedBox(
  //             width: MediaQuery.of(context).size.width * 0.2,
  //             height: 50,
  //             child: TextField(
  //                 controller: _inputIdCard,
  //                 cursorColor: Colors.black,
  //                 keyboardType: TextInputType.text,
  //                 style: TextStyle(fontFamily: FontStyles().fontFamily),
  //                 decoration: InputDecoration(
  //                   border: OutlineInputBorder(
  //                       borderSide: BorderSide(color: Color(0xFFCECECE))),
  //                   labelText: "หมู่ที่",
  //                   labelStyle: TextStyles().txtLableRegister,
  //                 )),
  //           ),
  //           Padding(padding: EdgeInsets.all(2)),
  //           SizedBox(
  //             width: MediaQuery.of(context).size.width * 0.35,
  //             height: 50,
  //             child: TextField(
  //                 controller: _inputIdCard,
  //                 cursorColor: Colors.black,
  //                 keyboardType: TextInputType.text,
  //                 style: TextStyle(fontFamily: FontStyles().fontFamily),
  //                 decoration: InputDecoration(
  //                   border: OutlineInputBorder(
  //                       borderSide: BorderSide(color: Color(0xFFCECECE))),
  //                   labelText: "ตรอก/ซอย",
  //                   labelStyle: TextStyles().txtLableRegister,
  //                 )),
  //           ),
  //         ],
  //       )
  //     ],
  //   );
  // }

  @override
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
