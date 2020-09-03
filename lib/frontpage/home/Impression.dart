import 'dart:convert';

import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_frontpage.dart';
import 'package:amphawan/system/errorText.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/impression/detail.dart';
import 'package:amphawan/view/impression/mainImpression.dart';
import 'package:amphawan/view/impression/model/listImpression.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final List<String> imgTest = [
  'assets/images/tst/tst_2.png',
  'assets/images/tst/tst_3.png',
  'assets/images/tst/tst_2.png',
  'assets/images/tst/tst_3.png',
  'assets/images/tst/tst_2.png',
  'assets/images/tst/tst_3.png',
];

class Impression extends StatefulWidget {
  @override
  _ImpressionState createState() => _ImpressionState();
}

class _ImpressionState extends State<Impression> {
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
                    return ImpressionShortcus(
                      impression: snapshot.data,
                    );
                  } else {
                    return noData();
                  }
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}

class ImpressionShortcus extends StatelessWidget {
  final List<ListImpression> impression;

  ImpressionShortcus({Key key, this.impression}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: impression.length > 8 ? 8 : impression.length,
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
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: FontStyles().fontFamily),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
        },
      ),
    );
  }
}
