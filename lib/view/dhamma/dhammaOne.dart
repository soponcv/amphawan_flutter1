import 'dart:convert';
import 'dart:async';

import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_dhamma.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/dhamma/deailDhamma.dart';
import 'package:amphawan/view/dhamma/model/listDhamma.dart';
import 'package:amphawan/view/register/mainRegister.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DhammaOne extends StatelessWidget {
  // start---------------- Get Data From DATABASES
  Future<List<ListDhamma1>> fetchDhamma1(http.Client client) async {
    final response = await client.get(PathAPI().getDhamma + '2');
    return parseDhamma1(response.body);
  }

  List<ListDhamma1> parseDhamma1(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<ListDhamma1>((json) => ListDhamma1.fromJson(json))
        .toList();
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
                            Image(
                              image: AssetImage(
                                  'assets/images/icon/icon-list.png'),
                              width: 35,
                            ),
                            Padding(padding: EdgeInsets.all(0.5)),
                            Text(
                              'ปฏิบัติธรรม รอบ 3 วัน (ศุกร์ เสาร์ อาทิตย์)',
                              style: TextDhamma().txtTopic,
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailDhamma(
                                    id: 1,
                                    topic:
                                        'ปฏิบัติธรรม รอบ 3 วัน (ศุกร์ เสาร์ อาทิตย์)')),
                          );
                        },
                        child: Icon(Icons.chevron_right),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(3)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 1.0,
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: Colors.grey[350],
                    ),
                  ),
                  Container(
                    child: FutureBuilder<List<ListDhamma1>>(
                      future: fetchDhamma1(http.Client()),
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
                              return DhammaList1(dhamma: snapshot.data);
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
            ),
            Padding(padding: EdgeInsets.all(5)),
          ],
        ),
      ),
    );
  }
}

class DhammaList1 extends StatelessWidget {
  final List<ListDhamma1> dhamma;

  DhammaList1({Key key, this.dhamma}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          dhamma.length > 0
              ? ListView.builder(
                  itemCount: dhamma.length > 5 ? 5 : dhamma.length,
                  padding: EdgeInsets.all(1),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 40,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                child: Container(
                                  height: 10.0,
                                  width: 10.0,
                                  decoration: new BoxDecoration(
                                    color: Color(0xFFA2CA6F),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(3)),
                              Text(
                                dhamma[index].subject,
                                style: TextDhamma().txtTopic,
                              ),
                              Padding(padding: EdgeInsets.all(7)),
                              Text(
                                '(ว่าง 7 ที่)',
                                style: TextStyle(
                                    fontFamily: FontStyles().fontFamily,
                                    color: Color(0xFF67B762)),
                              ),
                            ],
                          ),
                        ),
                        int.parse(dhamma[index].cid) == 0
                            ? Container(
                                width: 90,
                                child: RaisedButton(
                                  color: Color(0xFFBEAF4E),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainRegister(
                                            txtTitle: 'สมัคร',
                                            txtDetail:
                                                'ปฏิบัติธรรม รอบ 3 วัน (ศุกร์ เสาร์ อาทิตย์) ' +
                                                    dhamma[index].subject),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'สมัคร',
                                    style: TextStyle(
                                        fontFamily: FontStyles().fontFamily,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            : Container(
                                width: 50,
                                child: Text(
                                  'เต็ม',
                                  style: TextDhamma().txtFull,
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

// Widget dhammaOne(context) {
//   Future<ListDhamma> futureDhamma1;

//   Future<ListDhamma> fetchDhamma(int cid) async {
//     final response = await http.get(PathAPI().getDhamma + cid.toString());

//     if (response.statusCode == 200) {
//       return ListDhamma.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('- พบข้อผิดพลาด -');
//     }
//   }

//   futureDhamma1 = fetchDhamma(2);
//   return Container(
//     width: MediaQuery.of(context).size.width * 0.96,
//     child: Card(
//       color: Colors.white,
//       child: Column(
//         children: <Widget>[
//           Padding(padding: EdgeInsets.all(5)),
//           Container(
//             width: MediaQuery.of(context).size.width * 0.90,
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Container(
//                       child: Row(
//                         children: <Widget>[
//                           Image(
//                             image:
//                                 AssetImage('assets/images/icon/icon-list.png'),
//                             width: 35,
//                           ),
//                           Padding(padding: EdgeInsets.all(0.5)),
//                           Text(
//                             'ปฏิบัติธรรม รอบ 3 วัน (ศุกร์ เสาร์ อาทิตย์)',
//                             style: TextDhamma().txtTopic,
//                           )
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => DetailDhamma(
//                                   id: 1,
//                                   topic:
//                                       'ปฏิบัติธรรม รอบ 3 วัน (ศุกร์ เสาร์ อาทิตย์)')),
//                         );
//                       },
//                       child: Icon(Icons.chevron_right),
//                     )
//                   ],
//                 ),
//                 Padding(padding: EdgeInsets.all(5)),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10.0),
//                   child: Container(
//                     height: 1.0,
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     color: Colors.grey[350],
//                   ),
//                 ),
//                 Padding(padding: EdgeInsets.all(5)),
//                 Container(
//                   child: Column(
//                     children: <Widget>[
//                       FutureBuilder<ListDhamma>(
//                           future: futureDhamma1,
//                           builder: (context, snapshot) {
//                             if (snapshot.hasData) {
//                               return Text(snapshot.data.subject);
//                             } else if (snapshot.hasError) {
//                               return Text("${snapshot.error}");
//                             }
//                           }),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Container(
//                             height: 40,
//                             child: Row(
//                               children: <Widget>[
//                                 SizedBox(
//                                   child: Container(
//                                     height: 10.0,
//                                     width: 10.0,
//                                     decoration: new BoxDecoration(
//                                       color: Color(0xFFA2CA6F),
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: Colors.white,
//                                         width: 1,
//                                       ),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.grey.withOpacity(0.5),
//                                           spreadRadius: 2,
//                                           blurRadius: 7,
//                                           offset: Offset(0,
//                                               1), // changes position of shadow
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(padding: EdgeInsets.all(3)),
//                                 Text(
//                                   '24 – 26 ก.ค.63',
//                                   style: TextDhamma().txtTopic,
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: 50,
//                             child: Text(
//                               'เต็ม',
//                               style: TextDhamma().txtFull,
//                             ),
//                           )
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Container(
//                             height: 40,
//                             child: Row(
//                               children: <Widget>[
//                                 SizedBox(
//                                   child: Container(
//                                     height: 10.0,
//                                     width: 10.0,
//                                     decoration: new BoxDecoration(
//                                       color: Color(0xFFA2CA6F),
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: Colors.white,
//                                         width: 1,
//                                       ),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.grey.withOpacity(0.5),
//                                           spreadRadius: 2,
//                                           blurRadius: 7,
//                                           offset: Offset(0,
//                                               1), // changes position of shadow
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(padding: EdgeInsets.all(3)),
//                                 Text(
//                                   '24 – 26 ก.ค.63',
//                                   style: TextDhamma().txtTopic,
//                                 ),
//                                 Padding(padding: EdgeInsets.all(7)),
//                                 Text(
//                                   '(ว่าง 7 ที่)',
//                                   style: TextStyle(
//                                       fontFamily: FontStyles().fontFamily,
//                                       color: Color(0xFF67B762)),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                               width: 90,
//                               child: RaisedButton(
//                                 color: Color(0xFFBEAF4E),
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => MainRegister(
//                                             txtTitle: 'สมัคร',
//                                             txtDetail:
//                                                 'ปฏิบัติธรรม รอบ 3 วัน (ศุกร์ เสาร์ อาทิตย์) 24 – 26 ก.ค.63')),
//                                   );
//                                 },
//                                 child: Text(
//                                   'สมัคร',
//                                   style: TextStyle(
//                                       fontFamily: FontStyles().fontFamily,
//                                       color: Colors.white),
//                                 ),
//                               ))
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Padding(padding: EdgeInsets.all(5)),
//         ],
//       ),
//     ),
//   );
// }
