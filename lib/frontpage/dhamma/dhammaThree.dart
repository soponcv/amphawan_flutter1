import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_dhamma.dart';
import 'package:flutter/material.dart';

Widget dhammaThree() {
  return Container(
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 40,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    child: Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: new BoxDecoration(
                        color: Color(0xFFBE6C4E),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(3)),
                  Text(
                    '24 – 26 ก.ค.63',
                    style: TextDhamma().txtTopic,
                  )
                ],
              ),
            ),
            Container(
              width: 50,
              child: Text(
                'เต็ม',
                style: TextDhamma().txtFull,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 40,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    child: Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: new BoxDecoration(
                        color: Color(0xFFBE6C4E),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(3)),
                  Text(
                    '24 – 26 ก.ค.63',
                    style: TextDhamma().txtTopic,
                  ),
                  Padding(padding: EdgeInsets.all(7)),
                  Text(
                    '(ว่าง 7 ที่)',
                    style: TextStyle(
                        fontFamily: FontStyles().fontFamily,
                        color: Color(0xFFA2CA6F)),
                  ),
                ],
              ),
            ),
            Container(
                width: 90,
                child: RaisedButton(
                  color: Color(0xFFBE6C4E),
                  onPressed: () {},
                  child: Text(
                    'สมัคร',
                    style: TextStyle(
                        fontFamily: FontStyles().fontFamily,
                        color: Colors.white),
                  ),
                ))
          ],
        )
      ],
    ),
  );
}
