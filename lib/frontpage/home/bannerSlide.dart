import 'dart:convert';

import 'package:amphawan/frontpage/home/model/listImageBanner.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/system/errorText.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/system/url.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WidgetBanner extends StatefulWidget {
  @override
  _WidgetBannerState createState() => _WidgetBannerState();
}

class _WidgetBannerState extends State<WidgetBanner> {
  final _currentDot = 0;

  // start---------------- Get Data From DATABASES
  Future<List<ListBannerImg>> fetchBannerImg(http.Client client) async {
    final response = await client.get(PathAPI().getBanner);
    return parseBannerImg(response.body);
  }

  List<ListBannerImg> parseBannerImg(String responseBody) {
    if (responseBody != '{"status":"false"}') {
      final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

      return parsed
          .map<ListBannerImg>((json) => ListBannerImg.fromJson(json))
          .toList();
    }
  }

  // end---------------- Get Data From DATABASES
  List<ListBannerImg> _list = [];
  List<dynamic> _listImages = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF27AE60),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Container(
            child: FutureBuilder<List<ListBannerImg>>(
              future: fetchBannerImg(http.Client()),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return noConnect();
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                    return noData();
                    break;
                  case ConnectionState.done:
                    if (snapshot.data != null) {
                      _list = snapshot.data;
                      _listImages = _list
                          .map(
                            (item) => Container(
                              child: Container(
                                // margin: EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          item.url != ''
                                              ? Url().launchInBrowser(item.url)
                                              : print('${item.subject}');
                                        },
                                        child: item.display_image != ''
                                            ? Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                child: Image.network(
                                                  PathAPI().base_url +
                                                      item.display_image,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                child: Image(
                                                  image: AssetImage(
                                                      "assets/images/nopic.png"),
                                                  fit: BoxFit.cover,
                                                )),
                                      ),
                                      // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                                      Positioned(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(100, 0, 0, 0),
                                                Color.fromARGB(100, 0, 0, 0)
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 10.0),
                                          child: Text(
                                            '${item.subject}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.normal,
                                                fontFamily:
                                                    FontStyles().fontFamily),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList();
                      return Container(
                        child: Column(
                          children: [
                            CarouselSlider(
                              items: _listImages != Null ? _listImages : null,
                              options: CarouselOptions(
                                autoPlay: false,
                                aspectRatio: 2.5,
                                enlargeCenterPage: true,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return noData();
                    }
                    break;
                }
              },
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
        ],
      ),
    );
  }
}
