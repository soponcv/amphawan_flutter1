import 'dart:convert';

import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_frontpage.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/system/errorText.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/system/timeTH.dart';
import 'package:amphawan/view/activity/detail.dart';
import 'package:amphawan/view/activity/model/listEvent.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'กิจกรรมบุญ',
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
              Padding(padding: EdgeInsets.all(8)),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'กิจกรรมบุญ',
                      style: TextFrontpage().txtBigHead,
                    ),
                    Icon(Icons.event_note)
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(2)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 2.0,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.grey[350],
                ),
              ),
              Padding(padding: EdgeInsets.all(2)),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.21,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'วันที่',
                                            style: TextStyle(
                                                fontFamily:
                                                    FontStyles().fontFamily,
                                                fontSize: 14,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(3.4)),
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                        Text(
                          'กิจกรรม',
                          style: TextStyle(
                              fontFamily: FontStyles().fontFamily,
                              fontSize: 14,
                              color: Colors.grey),
                        )
                      ],
                    ),
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
                                return EventListMain(
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EventListMain extends StatelessWidget {
  final List<ListEvent> event;

  EventListMain({Key key, this.event}) : super(key: key);

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
                  itemCount: event.length,
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
