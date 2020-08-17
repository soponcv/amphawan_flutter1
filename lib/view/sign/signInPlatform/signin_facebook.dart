import 'package:http/http.dart' as http;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:convert' as JSON;

class SignInFacebook {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  bool _isLoggedIn = false;
  Map profile;

  Future<Null> login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        _isLoggedIn = true;
        break;
      case FacebookLoginStatus.cancelledByUser:
        // _showMessage('Login cancelled by the user.');
        _isLoggedIn = false;
        break;
      case FacebookLoginStatus.error:
        // _showMessage('Something went wrong with the login process.\n'
        //     'Here\'s the error Facebook gave us: ${result.errorMessage}');
        _isLoggedIn = false;
        break;
    }
  }
}
