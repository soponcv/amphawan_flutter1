import 'dart:convert';

import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/system/errorText.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/impression/model/listImpression.dart';
import 'package:amphawan/view/impression/tab/comment.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DetailImpression extends StatefulWidget {
  final int id;
  final String uploadKey;
  final String topic;
  final String description;
  final String date;
  final int comment;
  final int like;
  DetailImpression(
      {Key key,
      @required this.topic,
      this.uploadKey,
      this.id,
      this.description,
      this.date,
      this.comment,
      this.like})
      : super(key: key);
  @override
  _DetailImpressionState createState() => _DetailImpressionState();
}

class _DetailImpressionState extends State<DetailImpression> {
  TextStyle txtBt = TextStyle(
      fontFamily: FontStyles().fontFamily, fontSize: 10, color: Colors.black);

  // start---------------- Get Data From DATABASES
  Future<List<ListImpressionImg>> fetchImImg(http.Client client) async {
    final response =
        await client.get(PathAPI().getImpressionImg + widget.uploadKey);
    print(response.body);
    return parseImImg(response.body);
  }

  List<ListImpressionImg> parseImImg(String responseBody) {
    print(responseBody);
    if (responseBody != '{"status":"false"}') {
      final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

      return parsed
          .map<ListImpressionImg>((json) => ListImpressionImg.fromJson(json))
          .toList();
    }
  }
  // end---------------- Get Data From DATABASES

  TabController _tabController;

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Colors.black.withOpacity(.1),
                offset: Offset(1.0, 5.0),
              ),
            ], color: Colors.white),
            child: TabBar(
              tabs: [
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.text_fields,
                        color: Colors.green,
                        size: 28,
                      ),
                      Text(
                        'รายละเอียด',
                        style: txtBt,
                      )
                    ],
                  ),
                ),
                Tab(
                  child: InkWell(
                    onTap: () {
                      print('ถูกใจ');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Color(0xFFE97373),
                              size: 28,
                            ),
                            widget.like != 0
                                ? Positioned(
                                    top: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          right: 5, bottom: 1, top: 1, left: 5),
                                      child: Text(
                                        widget.like > 99
                                            ? '99+'
                                            : widget.like.toString(),
                                        style: TextStyle(
                                            fontFamily: FontStyles().fontFamily,
                                            fontSize: 10,
                                            color: Colors.white),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFA60C),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )
                                : Positioned(
                                    top: 0.0,
                                    right: 0.0,
                                    child: Container(),
                                  )
                          ],
                        ),
                        Text(
                          'ถูกใจ',
                          style: txtBt,
                        )
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Icon(
                            Icons.chat,
                            color: Colors.blueAccent,
                            size: 28,
                          ),
                          widget.comment != 0
                              ? Positioned(
                                  top: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        right: 5, bottom: 1, top: 1, left: 5),
                                    child: Text(
                                      widget.comment > 99
                                          ? '99+'
                                          : widget.comment.toString(),
                                      style: TextStyle(
                                          fontFamily: FontStyles().fontFamily,
                                          fontSize: 10,
                                          color: Colors.white),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFA60C),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                )
                              : Positioned(
                                  top: 0.0,
                                  right: 0.0,
                                  child: Container(),
                                )
                        ],
                      ),
                      Text(
                        'ความคิดเห็น',
                        style: txtBt,
                      )
                    ],
                  ),
                ),
                Tab(
                  child: InkWell(
                    onTap: () {
                      print('แชร์');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.grey,
                          size: 25,
                        ),
                        Text(
                          'แบ่งปัน',
                          style: txtBt,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.47,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Text(
                            widget.topic,
                            style: TextStyle(
                                fontFamily: FontStyles().fontFamily,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.date,
                            style: TextStyle(
                                fontFamily: FontStyles().fontFamily,
                                fontSize: 10,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            widget.description,
                            style: TextStyle(
                                fontFamily: FontStyles().fontFamily,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      )),
                  padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                ),
                Container(
                  child: Text("LIKE"),
                ),
                ImComment(
                  uploadKey: widget.uploadKey,
                ),
                Container(
                  child: Text("SHARE"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: FutureBuilder<List<ListImpressionImg>>(
                    future: fetchImImg(http.Client()),
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
                            List<ListImpressionImg> list = snapshot.data;
                            List<dynamic> listImages = list
                                .map((i) => i.file != ''
                                    ? Image.network(
                                        PathAPI().base_url + i.file,
                                        fit: BoxFit.cover,
                                      )
                                    : Image(
                                        image: AssetImage(
                                            'assets/images/nopic.png'),
                                        fit: BoxFit.cover,
                                      ))
                                .toList();
                            return Carousel(
                              images: listImages,
                              autoplay: true,
                              animationDuration: Duration(milliseconds: 1000),
                              dotSize: 3.0,
                              dotIncreaseSize: 3.0,
                              dotColor: Colors.white,
                              dotIncreasedColor: Color(0xFF07930A),
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
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    right: 10, left: 10, top: 5, bottom: 5),
                                color: Color(0xFF159B0C),
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.1,
                                      child: Text(
                                        widget.topic,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: FontStyles().fontFamily,
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          _tabSection(context),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
