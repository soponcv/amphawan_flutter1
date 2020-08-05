import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class MainLogin extends StatefulWidget {
  @override
  _MainLoginState createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  _loginWithFB() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false);
        break;
    }
  }

  _logout() {
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  // LINE

  void lineSDKInit() async {
    await LineSDK.instance.setup("1654625879").then((_) {
      print("LineSDK is Prepared");
    });
  }

  @override
  void initState() {
    lineSDKInit();
    super.initState();
  }

  void startLineLogin() async {
    try {
      final result = await LineSDK.instance.login(scopes: ["profile"]);
      print(result.toString());
    } on PlatformException catch (e) {
      print(e);
      
    }
  }

  Widget signIn() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFCECECE),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Username",
                      labelStyle: TextStyles().txtLableLogin,
                      icon: Icon(
                        Icons.person_outline,
                        color: Color(0xFF43C415),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFCECECE),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                  style: TextStyle(fontFamily: FontStyles().fontFamily),
                  obscureText: true,
                  autofocus: false,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Password",
                      labelStyle: TextStyles().txtLableLogin,
                      icon: Icon(Icons.lock, color: Color(0xFF43C415)))),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xFF52B64F),
                  onPressed: () {},
                  child: Text(
                    'เข้าสู่ระบบ',
                    style: TextStyles().txtBottomLogin,
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'ลงทะเบียน',
                    style: TextStyles().txtBottomRegister,
                  ),
                )
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
          'เข้าสู่ระบบ',
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
              Padding(padding: EdgeInsets.all(20)),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(10)),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                              color: Color(0xFF4267B2),
                              child: InkWell(
                                onTap: () {
                                  _loginWithFB();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                          'assets/images/logo/facebook.png'),
                                      width: 30,
                                      height: 30,
                                    ),
                                    Text(
                                      'เข้าสู่ระบบโดยบัญชี facebook',
                                      style: TextStyles().txtLogin,
                                    )
                                  ],
                                ),
                              )),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                              color: Color(0xFF00B900),
                              child: InkWell(
                                onTap: () {
                                  startLineLogin();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                          'assets/images/logo/line.png'),
                                      width: 30,
                                      height: 30,
                                    ),
                                    Text(
                                      'เข้าสู่ระบบโดยบัญชี LINE',
                                      style: TextStyles().txtLogin,
                                    )
                                  ],
                                ),
                              )),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                              color: Color(0xFFFFFFFF),
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                          'assets/images/logo/google.png'),
                                      width: 30,
                                      height: 30,
                                    ),
                                    Text(
                                      'เข้าสู่ระบบโดยบัญชี Google',
                                      style: TextStyles().txtLoginGoogle,
                                    )
                                  ],
                                ),
                              )),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(
                                fontFamily: FontStyles().fontFamily,
                                color: Color(0xFF084363),
                                fontSize: 20),
                          ),
                        ),
                        signIn(),
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
