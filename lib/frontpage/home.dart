import 'dart:convert';

import 'package:amphawan/frontpage/home/marquee.dart';
import 'package:amphawan/frontpage/home/model/listImageBanner.dart';
import 'package:amphawan/system/errorText.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/dhamma/mainDhamma.dart';
import 'package:amphawan/frontpage/home/Impression.dart';
import 'package:amphawan/frontpage/home/activity.dart';
import 'package:amphawan/frontpage/home/bannerSlide.dart';
import 'package:amphawan/view/dhamma/model/listDhamma.dart';
import 'package:amphawan/view/media/mainMedia.dart';
import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/view/dhamma/dhammaOne.dart';
import 'package:amphawan/view/dhamma/dhammaThree.dart';
import 'package:amphawan/view/dhamma/dhammaTwo.dart';
import 'package:amphawan/view/information/infor_1.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee_flutter/marquee_flutter.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var top = 0.0;
  var top1 = 0.0;

  int _current = 0;

  TextStyle txtBIcon =
      TextStyle(fontFamily: FontStyles().fontFamily, color: Color(0xFF158A0E));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF2F8),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 245.0,
              floating: false,
              pinned: true,
              backgroundColor: Color(0xFFDFF1CD),
              shape: CustomShapeBorder(),
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // print('constraints=' + constraints.toString());
                  top = constraints.biggest.height;
                  top1 = constraints.biggest.height;
                  // return FlexibleSpaceBar(
                  //   centerTitle: true,
                  //   title: AnimatedOpacity(
                  //       duration: Duration(milliseconds: 300),
                  //       //opacity: top == 80.0 ? 1.0 : 0.0,
                  //       opacity: 1.0,
                  //       child: Text(
                  //         top.toString(),
                  //         style: TextStyle(fontSize: 12.0),
                  //       )),

                  // );
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/bg/bg.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: <Widget>[
                        Visibility(
                          visible: top <= 100.0 ? true : false,
                          child: Padding(padding: EdgeInsets.all(17)),
                        ),
                        Visibility(
                          visible: top <= 100.0 ? true : false,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  child: Icon(
                                    Icons.menu,
                                    color: Color(0xFF75B732),
                                  ),
                                ),
                                Image(
                                  image:
                                      AssetImage('assets/images/logo/logo.png'),
                                  width: 110,
                                ),
                                ClipOval(
                                  child: Material(
                                    color: Colors.black
                                        .withOpacity(0.5), // button color
                                    child: InkWell(
                                      child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: Icon(
                                            Icons.notifications,
                                            size: 20,
                                            color: Colors.white,
                                          )),
                                      onTap: () {},
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: top1 > 100.0 ? true : false,
                          child: Stack(
                            children: <Widget>[
                              SizedBox(
                                height: top < 250 ? top1 - 10 : 250,
                                child: Container(
                                    child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: top < 220 ? top1 - 100 : 150,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/information/jd.png'),
                                            fit: BoxFit.cover),
                                      ),
                                      child: Visibility(
                                        visible: top1 == 80.0 ? false : true,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                                padding: EdgeInsets.all(15)),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  InkWell(
                                                    child: Icon(
                                                      Icons.menu,
                                                      color: Color(0xFF75B732),
                                                    ),
                                                  ),
                                                  Image(
                                                    image: AssetImage(
                                                        'assets/images/logo/logo.png'),
                                                    width: 120,
                                                  ),
                                                  ClipOval(
                                                    child: Material(
                                                      color: Colors.black
                                                          .withOpacity(
                                                              0.5), // button color
                                                      child: InkWell(
                                                        child: SizedBox(
                                                            width: 30,
                                                            height: 30,
                                                            child: Icon(
                                                              Icons
                                                                  .notifications,
                                                              size: 20,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                        onTap: () {},
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                              Positioned(
                                width: MediaQuery.of(context).size.width * 1.1,
                                left: -10,
                                top: top < 220 ? top - 150 : 115,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.1,
                                  height: top < 220 ? top - 50 : 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/bg/home_bg.png'),
                                        fit: BoxFit.fitWidth),
                                  ),
                                ),
                              ),
                              Positioned(
                                width: 80,
                                left: MediaQuery.of(context).size.width * 0.1,
                                top: top < 220 ? top - 150 : 100,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Infor_1()),
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.1,
                                    child: Column(
                                      children: <Widget>[
                                        Image(
                                            image: AssetImage(
                                                'assets/images/icon/icon1.png'),
                                            fit: BoxFit.cover),
                                        Text(
                                          'รู้จักวัด',
                                          style: txtBIcon,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                width: 80,
                                left: MediaQuery.of(context).size.width * 0.4,
                                top: top < 220 ? top - 150 : 100,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DhammaPage()),
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.1,
                                    child: Column(
                                      children: <Widget>[
                                        Image(
                                            image: AssetImage(
                                                'assets/images/icon/icon2.png'),
                                            fit: BoxFit.cover),
                                        Text(
                                          'ปฏิบัติธรรม',
                                          style: txtBIcon,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                width: 80,
                                left: MediaQuery.of(context).size.width * 0.7,
                                top: top < 220 ? top - 150 : 100,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MediaPage()),
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.1,
                                    child: Column(
                                      children: <Widget>[
                                        Image(
                                            image: AssetImage(
                                                'assets/images/icon/icon3.png'),
                                            fit: BoxFit.cover),
                                        Text(
                                          'สื่อธรรมะ',
                                          style: txtBIcon,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                width: MediaQuery.of(context).size.width * 0.9,
                                left: 20,
                                top: top < 220 ? top - 50 : 200,
                                child: Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 1.1,
                                  child: Card(
                                    color: Color(0xFFF0F0F0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Card(
                                            color: Color(0xFF2ECC71),
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  right: 2,
                                                  left: 2,
                                                  top: 2,
                                                  bottom: 2),
                                              child: FaIcon(
                                                FontAwesomeIcons.bullhorn,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Marquee(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Text(
                        //   top.toString(),
                        //   style: TextStyle(fontSize: 12.0),
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            mainAxisSize: MainAxisSize.max,
            children: [
              WidgetBanner(),
              Padding(padding: EdgeInsets.all(2)),
              EventDhamma(),
              Padding(padding: EdgeInsets.all(2)),
              DhammaOne(),
              Padding(padding: EdgeInsets.all(1)),
              DhammaTwo(),
              Padding(padding: EdgeInsets.all(1)),
              DhammaThree(),
              Padding(padding: EdgeInsets.all(3)),
              Impression(),
              Padding(padding: EdgeInsets.all(15)),
            ],
          ),
        ),
      ),
    );
  }
}
