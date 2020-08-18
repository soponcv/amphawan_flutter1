import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_frontpage.dart';
import 'package:amphawan/view/impression/detail.dart';
import 'package:amphawan/view/impression/mainImpression.dart';
import 'package:flutter/material.dart';

final List<String> imgTest = [
  'assets/images/tst/tst_2.png',
  'assets/images/tst/tst_3.png',
  'assets/images/tst/tst_2.png',
  'assets/images/tst/tst_3.png',
  'assets/images/tst/tst_2.png',
  'assets/images/tst/tst_3.png',
];

Widget impression(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.all(8)),
                  Text(
                    'ความประทับใจ',
                    style: TextFrontpage().txtBig,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color(0xFFD6A07C), width: 1.0),
                            borderRadius: BorderRadius.circular(2.0)),
                        color: Colors.white.withOpacity(0),
                        elevation: 0.0,
                        child: Text(
                          ' ส่งความประทับใจ ',
                          style: TextFrontpage().txtSmall,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImpressionPage()),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'ดูเพิ่มเติม',
                          style: TextFrontpage().txtMore,
                        ),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                ],
              ),
            )
          ],
        ),
        Padding(padding: EdgeInsets.all(3)),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imgTest.length,
            shrinkWrap: false,
            itemBuilder: (context, index) {
              return Container(
                width: 180,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  child: InkWell(
                    onTap: () {
                      print(index.toString());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailImpression(
                            id: index,
                            topic:
                                'พี่ๆน้องๆร่วมฟังปาติโมกข์ ในพระอุโบสด วัดอัมพวัน',
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      child: Stack(
                        children: <Widget>[
                          Image(
                            image: AssetImage(imgTest[index]),
                            fit: BoxFit.cover,
                            width: 180,
                          ),
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
                                    vertical: 5.0, horizontal: 5.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'พี่ๆน้องๆร่วมฟังปาติโมกข์ ในพระอุโบสด วัดอัมพวัน',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: FontStyles().fontFamily),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.redAccent,
                                          size: 16,
                                        ),
                                        Text(
                                          ' 16',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontStyles().fontFamily,
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        Padding(padding: EdgeInsets.all(2)),
                                        Icon(
                                          Icons.textsms,
                                          color: Colors.blueAccent,
                                          size: 16,
                                        ),
                                        Text(
                                          ' 16',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontStyles().fontFamily,
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
