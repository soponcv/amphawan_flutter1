import 'package:amphawan/frontpage/activity.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_dhamma.dart';
import 'package:amphawan/styles/text_frontpage.dart';
import 'package:flutter/material.dart';

Widget activityDhamma(context) {
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
                          Padding(padding: EdgeInsets.all(3)),
                          Text(
                            'กิจกรรมบุญ',
                            style: TextDhamma().txtTopicActivity,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivityPage()),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.event_note,
                            color: Colors.grey,
                          ),
                          Icon(Icons.expand_more)
                        ],
                      ),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '17',
                                              style:
                                                  TextFrontpage().txtDateStart,
                                            ),
                                            Text(
                                              ' - 23',
                                              style: TextFrontpage().txtDateEnd,
                                            )
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'พฤศจิกายน 63',
                                              style:
                                                  TextFrontpage().txtDateMonth,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(1)),
                                Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Container(
                                          width: 1.0,
                                          height: 15,
                                          color: Colors.grey[350],
                                        ),
                                      ),
                                      SizedBox(
                                        child: Container(
                                          height: 10.0,
                                          width: 10.0,
                                          decoration: new BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xFF07930A),
                                              width: 3,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Container(
                                          width: 1.0,
                                          height: 15,
                                          color: Colors.grey[350],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(1)),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 50,
                              child: Card(
                                  elevation: 0.0,
                                  color: Color(0xFFF5FFF5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'ทำบุญครบรอบ 72 ปี ชาตกาล',
                                            style: TextFrontpage().txtTopic,
                                          ),
                                          Text(
                                            'กองอำนวยการงานบำเพ็ญกุศลฯ',
                                            style: TextFrontpage().txtDetail,
                                          )
                                        ],
                                      ),
                                      Icon(Icons.chevron_right),
                                    ],
                                  )),
                            ),
                          ),
                        ],
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
