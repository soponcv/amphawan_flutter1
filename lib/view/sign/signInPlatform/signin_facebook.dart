import 'package:http/http.dart' as http;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:convert' as JSON;

class SignInFacebook {
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();
  void loginWithFB() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        userProfile = profile;
        _isLoggedIn = true;
        break;

      case FacebookLoginStatus.cancelledByUser:
        _isLoggedIn = false;
        break;
      case FacebookLoginStatus.error:
        _isLoggedIn = false;
        break;
    }
  }
}
