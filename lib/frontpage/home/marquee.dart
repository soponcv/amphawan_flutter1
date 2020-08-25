import 'dart:convert';

import 'package:amphawan/frontpage/home/model/listMarquee.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/system/errorText.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:flutter/material.dart';
import 'package:marquee_flutter/marquee_flutter.dart';

import 'package:http/http.dart' as http;

class Marquee extends StatelessWidget {
  // start---------------- Get Data From DATABASES
  Future<List<ListMarquee>> fetchMarquee(http.Client client) async {
    final response = await client.get(PathAPI().getMessage);
    return parseMarquee(response.body);
  }

  List<ListMarquee> parseMarquee(String responseBody) {
    if (responseBody != '{"status":"false"}') {
      final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

      return parsed
          .map<ListMarquee>((json) => ListMarquee.fromJson(json))
          .toList();
    }
  }
  // end---------------- Get Data From DATABASES

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<ListMarquee>>(
        future: fetchMarquee(http.Client()),
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
                return Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: MarqueeWidget(
                    text: snapshot.data[0].description,
                    textStyle: TextStyle(
                        fontSize: 14.0, fontFamily: FontStyles().fontFamily),
                    scrollAxis: Axis.horizontal,
                  ),
                );
              } else {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: MarqueeWidget(
                    text: '“สวดมนต์คือยาทา วิปัสสนาคือยากิน”',
                    textStyle: TextStyle(
                        fontSize: 14.0, fontFamily: FontStyles().fontFamily),
                    scrollAxis: Axis.horizontal,
                  ),
                );
              }
              break;
          }
        },
      ),
    );
  }
}

// class WidgetMarquee extends StatelessWidget {
//   final List<ListMarquee> marquee;

//   WidgetMarquee({Key key, this.marquee}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.745,
//       child: MarqueeWidget(
//         text: marquee,
//         textStyle:
//             TextStyle(fontSize: 14.0, fontFamily: FontStyles().fontFamily),
//         scrollAxis: Axis.horizontal,
//       ),
//     );
//   }
// }
