import 'dart:async';

import 'package:amphawan/frontpage/main.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Timer _timer;
  _WelcomeState() {
    _timer = new Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => frontpage(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg/welcome.png'),
              fit: BoxFit.fill),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.93,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      children: [
                        Text(
                          'Power By CityVariety Corporation Co.,Ltd. © 2020',
                          style: TextStyle(
                              fontFamily: FontStyles().fontFamily,
                              fontSize: 12,
                              color: Colors.greenAccent),
                        ),
                        Padding(padding: EdgeInsets.all(15))
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
