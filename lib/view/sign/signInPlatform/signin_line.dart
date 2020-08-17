import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:http/http.dart' as http;

class SignInLine {
  void lineSDKInit() async {
    await LineSDK.instance.setup("1654625879").then((_) {
      print("LineSDK is Prepared");
    });
  }

  void startLineLogin() async {
    try {
      final result = await LineSDK.instance.login(scopes: ["profile"]);
      print(result.toString());
    } on PlatformException catch (e) {
      print(e);
    }
  }
}

// import 'package:flutter/services.dart';
// import 'package:flutter_line_login/flutter_line_login.dart';

// class lineSignIn {
//   var _flutterLineLogin = new FlutterLineLogin();
//   String message = '';

//   void _onLoginSuccess(Object data) {
//     message = 'LoginSuccess: ${data}.';
//   }

//   void _onLoginError(Object error) {
//     message = 'LoginError: ${error}.';
//   }

//   Future<Null> _startWebLogin() async {
//     await _flutterLineLogin.startWebLogin(_onLoginSuccess, _onLoginError);
//   }

//   Future<Null> startLogin() async {
//     await _flutterLineLogin.startLogin(_onLoginSuccess, _onLoginError);
//     _startWebLogin();
//     _getProfile();
//   }

//   Future<Null> _getProfile() async {
//     try {
//       var profile = await _flutterLineLogin.getProfile();
//       message = 'Profile: ${profile}.';
//       print(message);
//     } on PlatformException catch (e) {
//       message = 'Profile: ${e}.';
//       print(message);
//     }
//   }
// }
