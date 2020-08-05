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
