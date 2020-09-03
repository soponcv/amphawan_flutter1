import 'dart:convert';

import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/system/errorText.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/impression/detail.dart';
import 'package:amphawan/view/impression/model/listImpression.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ImpressionPage extends StatefulWidget {
  @override
  _ImpressionPageState createState() => _ImpressionPageState();
}

class _ImpressionPageState extends State<ImpressionPage> {
  final List<String> imgTest = [
    'assets/images/tst/tst_2.png',
    'assets/images/tst/tst_3.png',
    'assets/images/tst/tst_2.png',
    'assets/images/tst/tst_3.png',
    'assets/images/tst/tst_2.png',
    'assets/images/tst/tst_3.png',
  ];

  // start---------------- Get Data From DATABASES
  Future<List<ListImpression>> fetchImpression(http.Client client) async {
    final response = await client.get(PathAPI().getAllImpression);
    return parseImpression(response.body);
  }

  List<ListImpression> parseImpression(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<ListImpression>((json) => ListImpression.fromJson(json))
        .toList();
  }

  // end---------------- Get Data From DATABASES

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ความประทับใจ',
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 1,
                      color: Color(0xFFD6A07C),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      color: Color(0xFF3EBE36),
                      child: Text(
                        'ส่งความประทับใจ',
                        style: TextStyle(
                            fontFamily: FontStyles().fontFamily,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 1,
                      color: Color(0xFFD6A07C),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),

              FutureBuilder<List<ListImpression>>(
                future: fetchImpression(http.Client()),
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
                        return ImpressionListMain(
                          impression: snapshot.data,
                        );
                      } else {
                        return noData();
                      }
                      break;
                  }
                },
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   height: MediaQuery.of(context).size.height * 0.8,
              //   child: GridView.count(
              //     crossAxisCount: 2,
              //     children: List.generate(imgTest.length, (index) {
              //       return Container(
              //         child: Card(
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(3)),
              //           child: InkWell(
              //             onTap: () {
              //               print(index.toString());
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => DetailImpression(
              //                     id: index,
              //                     topic:
              //                         'พี่ๆน้องๆร่วมฟังปาติโมกข์ ในพระอุโบสด วัดอัมพวัน',
              //                   ),
              //                 ),
              //               );
              //             },
              //             child: ClipRRect(
              //               child: Stack(
              //                 children: <Widget>[
              //                   Image(
              //                     image: AssetImage(imgTest[index]),
              //                     fit: BoxFit.cover,
              //                     height: 180,
              //                   ),
              //                   Positioned(
              //                     bottom: 0.0,
              //                     left: 0.0,
              //                     right: 0.0,
              //                     child: Container(
              //                         decoration: BoxDecoration(
              //                           gradient: LinearGradient(
              //                             colors: [
              //                               Color.fromARGB(100, 0, 0, 0),
              //                               Color.fromARGB(100, 0, 0, 0)
              //                             ],
              //                             begin: Alignment.bottomCenter,
              //                             end: Alignment.topCenter,
              //                           ),
              //                         ),
              //                         padding: EdgeInsets.symmetric(
              //                             vertical: 5.0, horizontal: 5.0),
              //                         child: Column(
              //                           children: [
              //                             Text(
              //                               'พี่ๆน้องๆร่วมฟังปาติโมกข์ ในพระอุโบสด วัดอัมพวัน',
              //                               style: TextStyle(
              //                                   color: Colors.white,
              //                                   fontSize: 11.0,
              //                                   fontWeight: FontWeight.normal,
              //                                   fontFamily:
              //                                       FontStyles().fontFamily),
              //                             ),
              //                             Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.end,
              //                               children: [
              //                                 Icon(
              //                                   Icons.favorite,
              //                                   color: Colors.redAccent,
              //                                   size: 16,
              //                                 ),
              //                                 Text(
              //                                   ' 16',
              //                                   style: TextStyle(
              //                                       fontFamily:
              //                                           FontStyles().fontFamily,
              //                                       color: Colors.white,
              //                                       fontSize: 12),
              //                                 ),
              //                                 Padding(
              //                                     padding: EdgeInsets.all(2)),
              //                                 Icon(
              //                                   Icons.textsms,
              //                                   color: Colors.blueAccent,
              //                                   size: 16,
              //                                 ),
              //                                 Text(
              //                                   ' 16',
              //                                   style: TextStyle(
              //                                       fontFamily:
              //                                           FontStyles().fontFamily,
              //                                       color: Colors.white,
              //                                       fontSize: 12),
              //                                 )
              //                               ],
              //                             )
              //                           ],
              //                         )),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     }),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImpressionListMain extends StatelessWidget {
  final List<ListImpression> impression;

  ImpressionListMain({Key key, this.impression}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.8,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(impression.length, (index) {
          return Container(
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
                        uploadKey: impression[index].uploadKey,
                        topic: impression[index].subject,
                        description: impression[index].description,
                        date: impression[index].create_date,
                        comment: impression[index].comment_num,
                        like: impression[index].like_num,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  child: Stack(
                    children: <Widget>[
                      impression[index].display_image != ''
                          ? Image.network(
                              PathAPI().base_url +
                                  impression[index].display_image,
                              fit: BoxFit.cover,
                              height: 180,
                            )
                          : Image(
                              image: AssetImage('assets/images/nopic.png'),
                              fit: BoxFit.fill,
                              height: 180,
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
                                  impression[index].subject,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
                                      ' ' +
                                          impression[index].like_num.toString(),
                                      style: TextStyle(
                                          fontFamily: FontStyles().fontFamily,
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
                                      ' ' +
                                          impression[index]
                                              .comment_num
                                              .toString(),
                                      style: TextStyle(
                                          fontFamily: FontStyles().fontFamily,
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
        }),
      ),
    );
  }
}
