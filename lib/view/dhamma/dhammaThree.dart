import 'dart:convert';

import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_dhamma.dart';
import 'package:amphawan/system/errorText.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/system/timeTH.dart';
import 'package:amphawan/view/dhamma/deailDhamma.dart';
import 'package:amphawan/view/dhamma/model/listDhamma.dart';
import 'package:amphawan/view/register/mainRegister.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DhammaThree extends StatelessWidget {
// start---------------- Get Data From DATABASES
  Future<List<ListDhamma3>> fetchDhamma3(http.Client client) async {
    final response = await client.get(PathAPI().getDhamma + '4');
    return parseDhamma3(response.body);
  }

  List<ListDhamma3> parseDhamma3(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<ListDhamma3>((json) => ListDhamma3.fromJson(json))
        .toList();
  }

// end---------------- Get Data From DATABASES

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            Image(
                              image: AssetImage(
                                  'assets/images/icon/icon-list.png'),
                              width: 35,
                            ),
                            Padding(padding: EdgeInsets.all(0.5)),
                            Text(
                              'โครงการอบรม',
                              style: TextDhamma().txtTopic,
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailDhamma(cid: 4, topic: 'โครงการอบรม')),
                          );
                        },
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
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: FutureBuilder<List<ListDhamma3>>(
                            future: fetchDhamma3(http.Client()),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  return noConnect();
                                case ConnectionState.waiting:
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                case ConnectionState.active:
                                  break;
                                case ConnectionState.done:
                                  if (snapshot.data != null) {
                                    return DhammaList3(dhamma: snapshot.data);
                                  } else {
                                    return noData();
                                  }
                                  break;
                              }
                            },
                          ),
                        ),
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
}

class DhammaList3 extends StatelessWidget {
  final List<ListDhamma3> dhamma;

  DhammaList3({Key key, this.dhamma}) : super(key: key);

  String _covTime(String dStart, String dEnd) {
    String dS = dStart.substring(8, 10);
    String mS = dStart.substring(5, 7);
    int yStart1 = TimeTH().yearTh(int.parse(dStart.substring(0, 4)));
    int yStart2 = TimeTH().yearTh(int.parse(dEnd.substring(0, 4)));
    String dE = dEnd.substring(8, 10);
    String mE = dEnd.substring(5, 7);
    String month1, month2;
    if (mS == mE) {
      month1 = TimeTH().ShortMonth[int.parse(mS)];
      String re = int.parse(dS).toString() +
          "-" +
          int.parse(dE).toString() +
          " " +
          month1 +
          " " +
          yStart1.toString().substring(2, 4);
      return re;
    } else if (mS != mE && yStart1 == yStart2) {
      month1 = TimeTH().ShortMonth[int.parse(mS)];
      month2 = TimeTH().ShortMonth[int.parse(mE)];
      String re = int.parse(dS).toString() +
          " " +
          month1 +
          "-" +
          int.parse(dE).toString() +
          " " +
          month2 +
          " " +
          yStart1.toString().substring(2, 4);
      return re;
    } else if (mS != mE && yStart1 != yStart2) {
      month1 = TimeTH().ShortMonth[int.parse(mS)];
      month2 = TimeTH().ShortMonth[int.parse(mE)];
      String yS1 = yStart1.toString().substring(2, 4);
      String yS2 = yStart2.toString().substring(2, 4);
      String re = int.parse(dS).toString() +
          " " +
          month1 +
          " " +
          yS1 +
          "-" +
          int.parse(dE).toString() +
          " " +
          month2 +
          " " +
          yS2;
      return re;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          dhamma.length > 0
              ? ListView.builder(
                  itemCount: dhamma.length > 5 ? 5 : dhamma.length,
                  padding: EdgeInsets.all(1),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
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
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(3)),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          dhamma[index].subject,
                                          style: TextDhamma().txtTopic,
                                        ),
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _covTime(dhamma[index].date_start,
                                            dhamma[index].date_end),
                                        style: TextStyle(
                                            fontFamily: FontStyles().fontFamily,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      int.parse(dhamma[index].num_person) > 0
                                          ? Text(
                                              '(ว่าง ' +
                                                  dhamma[index].num_person +
                                                  ' ที่)',
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontStyles().fontFamily,
                                                  color: Color(0xFF67B762)),
                                            )
                                          : Text(''),
                                    ],
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                            ],
                          ),
                        ),
                        int.parse(dhamma[index].num_person) > 0
                            ? Container(
                                width: 90,
                                child: RaisedButton(
                                  color: Color(0xFFBE6C4E),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainRegister(
                                            cid: dhamma[index].id,
                                            txtTitle: 'สมัคร',
                                            txtDetail: 'โครงการอบรม : ' +
                                                dhamma[index].subject +
                                                '\n' +
                                                _covTime(
                                                    dhamma[index].date_start,
                                                    dhamma[index].date_end)),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'สมัคร',
                                    style: TextStyle(
                                        fontFamily: FontStyles().fontFamily,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            : Container(
                                width: 50,
                                child: Text(
                                  'เต็ม',
                                  style: TextDhamma().txtFull,
                                ),
                              ),
                      ],
                    );
                  },
                )
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        'ไม่มีข้อมูล',
                        style: TextStyle(
                            fontFamily: FontStyles().fontFamily,
                            fontSize: 16,
                            color: Colors.grey),
                      )
                    ]),
        ],
      ),
    );
  }
}
