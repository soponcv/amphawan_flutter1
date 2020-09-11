import 'dart:convert';

import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/system/errorText.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/system/timeTH.dart';
import 'package:amphawan/view/activity/mainActivity.dart';
import 'package:amphawan/view/activity/model/listEvent.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeatilActivity extends StatefulWidget {
  final int id;
  final String uploadKey;
  final String topic;
  final String description;
  final String location;
  final String date_start;
  final String date_end;
  final String create_date;

  DeatilActivity(
      {Key key,
      @required this.id,
      this.uploadKey,
      this.topic,
      this.description,
      this.location,
      this.date_start,
      this.date_end,
      this.create_date})
      : super(key: key);
  @override
  _DeatilActivityState createState() => _DeatilActivityState();
}

class _DeatilActivityState extends State<DeatilActivity> {
  @override
  void initState() {
    super.initState();
  }

// start---------------- Get Data From DATABASES
  Future<List<ListEventImg>> fetchEventImg(http.Client client) async {
    final response =
        await client.get(PathAPI().getEventImage + widget.uploadKey);
    print(response.body);
    return parseEventImg(response.body);
  }

  List<ListEventImg> parseEventImg(String responseBody) {
    print(responseBody);
    if (responseBody != '{"status":"false"}') {
      final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

      return parsed
          .map<ListEventImg>((json) => ListEventImg.fromJson(json))
          .toList();
    }
  }

  // end---------------- Get Data From DATABASES

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.topic,
          style: TextStyles().titleBar,
        ),
        shape: CustomShapeBorder(),
        backgroundColor: Color(0xFFDFF1CD),
        iconTheme: IconThemeData(
          color: Color(0xFF4D890E), //change your color here
        ),
      ),
      body: Container(
        height: 1000,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg/bg.png'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: screenHeight / 4,
                child: FutureBuilder<List<ListEventImg>>(
                  future: fetchEventImg(http.Client()),
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
                          List<ListEventImg> list = snapshot.data;
                          List<dynamic> listImages = list
                              .map((i) => i.file != ''
                                  ? Image.network(
                                      PathAPI().base_url + i.file,
                                      fit: BoxFit.cover,
                                    )
                                  : Image(
                                      image:
                                          AssetImage('assets/images/nopic.png'),
                                      fit: BoxFit.cover,
                                    ))
                              .toList();
                          return Carousel(
                            images: listImages,
                            autoplay: true,
                            animationDuration: Duration(milliseconds: 300),
                            dotSize: 3.0,
                            dotIncreaseSize: 2.0,
                            dotColor: Colors.white,
                            dotBgColor: Colors.grey[800].withOpacity(0.1),
                            showIndicator: true,
                            indicatorBgPadding: 10.0,
                            boxFit: BoxFit.cover,
                            radius: Radius.circular(0.0),
                            overlayShadow: false,
                            overlayShadowColors: Colors.black,
                            overlayShadowSize: 0.5,
                          );
                        } else {
                          List<String> list = ['assets/images/nopic.png'];
                          List<dynamic> listImages = list
                              .map((i) => Image(
                                    image:
                                        AssetImage('assets/images/nopic.png'),
                                    fit: BoxFit.cover,
                                  ))
                              .toList();
                          return Carousel(
                            images: listImages,
                            autoplay: true,
                            animationDuration: Duration(milliseconds: 300),
                            dotSize: 3.0,
                            dotIncreaseSize: 2.0,
                            dotColor: Colors.white,
                            dotBgColor: Colors.grey[800].withOpacity(0.1),
                            showIndicator: true,
                            indicatorBgPadding: 10.0,
                            boxFit: BoxFit.cover,
                            radius: Radius.circular(0.0),
                            overlayShadow: false,
                            overlayShadowColors: Colors.black,
                            overlayShadowSize: 0.5,
                          );
                        }
                        break;
                    }
                  },
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.topic,
                                    style: TextStyle(
                                        fontFamily: FontStyles().fontFamily,
                                        fontSize: 18,
                                        color: Color(0xFF07930A)),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.location,
                                        style: TextStyle(
                                            fontFamily: FontStyles().fontFamily,
                                            fontSize: 14,
                                            color: Color(0xFFC4C4C4)),
                                      ),
                                      Text(
                                        'สร้างเมื่อ : ' +
                                            TimeTH().covertDateShortMonth(
                                                widget.create_date),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: FontStyles().fontFamily,
                                          fontSize: 10,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Container(
                          child: Text(widget.description),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
