import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_dhamma.dart';
import 'package:flutter/material.dart';

Widget dhammaOne(context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.96,
    child: Card(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(5)),
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Image(
                            image:
                                AssetImage('assets/images/icon/icon-list.png'),
                            width: 35,
                          ),
                          Padding(padding: EdgeInsets.all(0.5)),
                          Text(
                            'ปฏิบัติธรรม รอบ 3 วัน (ศุกร์ เสาร์ อาทิตย์)',
                            style: TextDhamma().txtTopic,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(Icons.chevron_right),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.all(5)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1.0,
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: Colors.grey[350],
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Container(
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
                                      color: Color(0xFFA2CA6F),
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
                                          offset: Offset(0,
                                              1), // changes position of shadow
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
                                      color: Color(0xFFA2CA6F),
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
                                          offset: Offset(0,
                                              1), // changes position of shadow
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
                                      color: Color(0xFF67B762)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: 90,
                              child: RaisedButton(
                                color: Color(0xFFBEAF4E),
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
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
        ],
      ),
    ),
  );
}
