import 'dart:convert';

import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/system/errorText.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/dhamma/model/listDhammaSuccess.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DhammaResult extends StatefulWidget {
  final int dhamma_id;
  final String username;
  DhammaResult({Key key, @required this.dhamma_id, this.username})
      : super(key: key);
  @override
  _DhammaResultState createState() => _DhammaResultState();
}

class _DhammaResultState extends State<DhammaResult> {
  // start---------------- Get Data From DATABASES
  Future<List<ListDhammaSuccess>> fetchSuccess(http.Client client) async {
    Map _map = {
      "dhamma_id": widget.dhamma_id,
      "username": widget.username,
    };
    var jsonMap = json.encode(_map);
    print(_map);
    final response = await client.post(PathAPI().getPerRegister,
        headers: {"Content-Type": "application/json"}, body: jsonMap);
    print(response.body);
    return parseSuccess(response.body);
  }

  List<ListDhammaSuccess> parseSuccess(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<ListDhammaSuccess>((json) => ListDhammaSuccess.fromJson(json))
        .toList();
  }

  // end---------------- Get Data From DATABASES

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'ผลการสมัคร',
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
        color: Color(0xFFEDF0F8),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: FutureBuilder<List<ListDhammaSuccess>>(
                            future: fetchSuccess(http.Client()),
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
                                    return WidgetSuccess(result: snapshot.data);
                                  } else {
                                    return noData();
                                  }
                              }
                            },
                          ),
                        ),
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

class WidgetSuccess extends StatelessWidget {
  final List<ListDhammaSuccess> result;

  WidgetSuccess({Key key, this.result}) : super(key: key);

  TextStyle txtTop = TextStyle(
      fontFamily: FontStyles().fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.bold);
  TextStyle txtDetail = TextStyle(
      fontFamily: FontStyles().fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.normal);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: result.length,
      padding: EdgeInsets.all(1),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              Container(
                child: Center(
                  child: Text(
                    'สมัครปฏิบัติธรรมสำเร็จ',
                    style: TextStyle(
                        color: Color(0xFF4AA728),
                        fontSize: 20,
                        fontFamily: FontStyles().fontFamily),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ปฏิบัติธรรม',
                      style: txtTop,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .63,
                      child: Text(
                        result[index].cate_name + ' ' + result[index].subject,
                        style: txtDetail,
                        overflow: TextOverflow.fade,
                        // softWrap: false,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'วันที่',
                      style: txtTop,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .63,
                      child: Text(
                        '1 - 3 กันยายน 2563',
                        style: txtDetail,
                        overflow: TextOverflow.fade,
                        // softWrap: false,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ชื่อ-สกุล',
                      style: txtTop,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .63,
                      child: Text(
                        result[index].name + ' ' + result[index].lastname,
                        style: txtDetail,
                        overflow: TextOverflow.fade,
                        // softWrap: false,
                      ),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 1,
                color: Color(0xFFD8D8D8),
              ),
              Padding(padding: EdgeInsets.all(3)),
              Text(
                'โปรดแจ้งเลขที่อ้างอิงในการยืนยันตนเมื่อเข้าปฏิบัติธรรม',
                style: TextStyle(
                    fontFamily: FontStyles().fontFamily, fontSize: 13),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                padding: EdgeInsets.only(top: 10, right: 2, left: 2, bottom: 2),
                width: MediaQuery.of(context).size.width * 0.5,
                color: Color(0xFFEFEFEF),
                child: Column(
                  children: [
                    Text(
                      'เลขที่อ้างอิง',
                      style: TextStyle(
                          fontFamily: FontStyles().fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      result[index].order.toString(),
                      style: TextStyle(
                          fontFamily: FontStyles().fontFamily,
                          color: Color(0xFFE38F2F),
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    'หากไม่สามารถเข้าปฏิบัติธรรมตามเวลาที่ลงทะเบียนได้ กรุณายกเลิกล่วงหน้า 2 วัน มิฉะนั้นจะขอสงวนสิทธิ์ การลงทะเบียน 3 เดือน "',
                    style: TextStyle(
                        fontFamily: FontStyles().fontFamily,
                        color: Color(0xFFCC2F06)),
                  )),
              Padding(padding: EdgeInsets.all(15)),
              RaisedButton(
                color: Color(0xFF70CD4F),
                onPressed: () {},
                child: Text('เรียบร้อย',
                    style: TextStyle(
                        fontFamily: FontStyles().fontFamily,
                        color: Colors.white,
                        fontSize: 16)),
              ),
              Padding(padding: EdgeInsets.all(10)),
            ],
          ),
        );
      },
    );
  }
}
