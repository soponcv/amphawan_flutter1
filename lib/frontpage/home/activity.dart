import 'dart:convert';

import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/system/errorText.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/system/timeTH.dart';
import 'package:amphawan/view/activity/detail.dart';
import 'package:amphawan/view/activity/mainActivity.dart';
import 'package:http/http.dart' as http;
import 'package:amphawan/styles/text_dhamma.dart';
import 'package:amphawan/styles/text_frontpage.dart';
import 'package:amphawan/view/activity/model/listEvent.dart';
import 'package:flutter/material.dart';

class EventDhamma extends StatelessWidget {
  // start---------------- Get Data From DATABASES
  Future<List<ListEvent>> fetchEvent(http.Client client) async {
    final response = await client.get(PathAPI().getEvent);
    return parseEvent(response.body);
  }

  List<ListEvent> parseEvent(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<ListEvent>((json) => ListEvent.fromJson(json)).toList();
  }

  // end---------------- Get Data From DATABASES
  @override
  Widget build(BuildContext context) {
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
                    child: FutureBuilder<List<ListEvent>>(
                      future: fetchEvent(http.Client()),
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
                              return EventList(
                                event: snapshot.data,
                              );
                            } else {
                              return noData();
                            }
                            break;
                        }
                      },
                    ),
                  ),
                  // Container(
                  //   child: Column(
                  //     children: <Widget>[
                  //       // *****

                  //       // ****
                  //     ],
                  //   ),
                  // )
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

class EventList extends StatelessWidget {
  final List<ListEvent> event;

  EventList({Key key, this.event}) : super(key: key);

  Widget _covTime(String dStart, String dEnd, context) {
    String dS = int.parse(dStart.substring(8, 10)).toString();
    String mS = dStart.substring(5, 7);
    int yStart1 = TimeTH().yearTh(int.parse(dStart.substring(0, 4)));
    int yStart2 = TimeTH().yearTh(int.parse(dEnd.substring(0, 4)));
    String dE = int.parse(dEnd.substring(8, 10)).toString();
    String mE = dEnd.substring(5, 7);
    String month1, month2;
    if (mS == mE) {
      month1 = TimeTH().FullMonth[int.parse(mS)];
      return SizedBox(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.22,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  int.parse(dS) == int.parse(dE)
                      ? Text(
                          dS,
                          style: TextFrontpage().txtDateStart,
                        )
                      : Container(
                          child: Row(
                            children: [
                              Text(
                                dS,
                                style: TextFrontpage().txtDateStart,
                              ),
                              Text(
                                ' - ' + dE,
                                style: TextFrontpage().txtDateEnd,
                              ),
                            ],
                          ),
                        )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    month1 + ' ' + yStart1.toString(),
                    style: TextFrontpage().txtDateMonth,
                  )
                ],
              )
            ],
          ),
        ),
      );
    } else if (mS != mE && yStart1 == yStart2) {
      month1 = TimeTH().ShortMonth[int.parse(mS)];
      month2 = TimeTH().ShortMonth[int.parse(mE)];

      return SizedBox(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.22,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dS,
                    style: TextFrontpage().txtDateStart,
                  ),
                  Text(
                    ' - ' + dE,
                    style: TextFrontpage().txtDateEnd,
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    month1 +
                        '-' +
                        month2 +
                        ' ' +
                        yStart1.toString().substring(2, 4),
                    style: TextFrontpage().txtDateMonth,
                  )
                ],
              )
            ],
          ),
        ),
      );
    } else if (mS != mE && yStart1 != yStart2) {
      month1 = TimeTH().ShortMonth[int.parse(mS)];
      month2 = TimeTH().ShortMonth[int.parse(mE)];
      String yS1 = yStart1.toString().substring(2, 4);
      String yS2 = yStart2.toString().substring(2, 4);
      return SizedBox(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.22,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dS,
                    style: TextFrontpage().txtDateStart,
                  ),
                  Text(
                    ' - ' + dE,
                    style: TextFrontpage().txtDateEnd,
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        month1 +
                            ' ' +
                            yStart1.toString().substring(2, 4) +
                            '-' +
                            month2 +
                            ' ' +
                            yStart2.toString().substring(2, 4),
                        style: TextFrontpage().txtDateMonth,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    } else if (dStart == dEnd) {
      return SizedBox(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.22,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dS,
                    style: TextFrontpage().txtDateStart,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    month1 + ' ' + yStart1.toString(),
                    style: TextFrontpage().txtDateMonth,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          event.length > 0
              ? ListView.builder(
                  itemCount: event.length > 5 ? 5 : event.length,
                  padding: EdgeInsets.all(1),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _covTime(event[index].date_start,
                                  event[index].date_end, context),
                              Padding(padding: EdgeInsets.all(1)),
                              Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Container(
                                        width: 1.0,
                                        height: 20,
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
                                        height: 25,
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DeatilActivity(
                                    id: int.parse(event[index].id),
                                    uploadKey: event[index].uploadKey,
                                    topic: event[index].subject,
                                    description: event[index].description,
                                    location: event[index].location,
                                    date_start: event[index].date_start,
                                    date_end: event[index].date_end,
                                    create_date: event[index].create_date),
                              ),
                            );
                          },
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
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: Text(
                                            event[index].subject,
                                            style: TextFrontpage().txtTopic,
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                          ),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(
                                              event[index].location,
                                              style: TextFrontpage().txtDetail,
                                            ))
                                      ],
                                    ),
                                    Icon(Icons.chevron_right),
                                  ],
                                )),
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
