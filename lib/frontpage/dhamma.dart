import 'package:amphawan/frontpage/dhamma/dhammaOne.dart';
import 'package:amphawan/frontpage/dhamma/dhammaThree.dart';
import 'package:amphawan/frontpage/dhamma/dhammaTwo.dart';
import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/text_dhamma.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:flutter/material.dart';

class DhammaPage extends StatefulWidget {
  @override
  _DhammaPageState createState() => _DhammaPageState();
}

class _DhammaPageState extends State<DhammaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'สมัครปฏิบติธรรม',
          style: TextStyles().titleBar,
        ),
        shape: CustomShapeBorder(),
        backgroundColor: Color(0xFFDFF1CD),
        iconTheme: IconThemeData(
          color: Color(0xFF4D890E), //change your color here
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg/bg.png'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              Container(
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
                                      SizedBox(
                                        child: Container(
                                          height: 10.0,
                                          width: 10.0,
                                          decoration: new BoxDecoration(
                                            color: Color(0xFFEEFF00),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFFD4A23F)
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.all(3)),
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
                            dhammaOne()
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                width: MediaQuery.of(context).size.width * 0.96,
                child: Card(
                  color: Color(0xFFF8F5E7),
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
                                      SizedBox(
                                        child: Container(
                                          height: 10.0,
                                          width: 10.0,
                                          decoration: new BoxDecoration(
                                            color: Color(0xFFEEFF00),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFFD4A23F)
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.all(3)),
                                      Text(
                                        'ปฏิบัติธรรม รอบวันโกนชนวันโกน',
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
                            dhammaTwo()
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                width: MediaQuery.of(context).size.width * 0.96,
                child: Card(
                  color: Color(0xFFF2F8FF),
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
                                      SizedBox(
                                        child: Container(
                                          height: 10.0,
                                          width: 10.0,
                                          decoration: new BoxDecoration(
                                            color: Color(0xFFEEFF00),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFFD4A23F)
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.all(3)),
                                      Text(
                                        'โครงการอบรม',
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
                            dhammaThree()
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
