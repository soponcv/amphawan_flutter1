import 'dart:convert';

import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/system/errorText.dart';
import 'package:amphawan/system/pathAPI.dart';
import 'package:amphawan/view/impression/model/listImpression.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImComment extends StatefulWidget {
  final String uploadKey;
  ImComment({Key key, @required this.uploadKey}) : super(key: key);
  @override
  _ImCommentState createState() => _ImCommentState();
}

class _ImCommentState extends State<ImComment> {
  TextEditingController _inputComment = TextEditingController();
  String username;

  @override
  void initState() {
    _getUsername();
    super.initState();
  }

  // start---------------- Get Data From DATABASES
  Future<List<ListImpressionComment>> fetchImComment(http.Client client) async {
    final response =
        await client.get(PathAPI().getImpressionComment + widget.uploadKey);
    print(response.body);
    return parseImComment(response.body);
  }

  List<ListImpressionComment> parseImComment(String responseBody) {
    print(responseBody);
    if (responseBody != '{"status":"false"}') {
      final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

      return parsed
          .map<ListImpressionComment>(
              (json) => ListImpressionComment.fromJson(json))
          .toList();
    }
  }
  // end---------------- Get Data From DATABASES

  Future<String> postComment(http.Client client, comment) async {
    Map _map = {
      "uploadKey": widget.uploadKey,
      "username": username,
      "description": comment
    };
    var body = json.encode(_map);
    final response = await client.post(PathAPI().postComment,
        headers: {"Content-Type": "application/json"}, body: body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      print(body);
      _inputComment.text = '';
    });
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(5)),
                Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Form(
                    child: TextFormField(
                      controller: _inputComment,
                      maxLines: 4,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontFamily: FontStyles().fontFamily),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCECECE))),
                        labelText: "แสดงความคิดเห็น",
                        labelStyle: TextStyles().txtLableRegister,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        color: Colors.green,
                        onPressed: () {
                          postComment(http.Client(), _inputComment.text);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'ตกลง',
                          style: TextStyle(
                              fontFamily: FontStyles().fontFamily,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1000,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg/bg.png'), fit: BoxFit.cover),
        ),
        child: FutureBuilder<List<ListImpressionComment>>(
          future: fetchImComment(http.Client()),
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
                  return ImpressionComment(
                    impression: snapshot.data,
                  );
                } else {
                  return noData();
                }
                break;
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: 'แสดงความคิดเห็น',
        onPressed: () {
          username != null
              ? _settingModalBottomSheet(context)
              : print('object');
        },
        elevation: 1.0,
        child: Icon(Icons.chat),
        backgroundColor: Colors.green,
      ),
    );
  }

  _getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('perUsername');
  }
}

class ImpressionComment extends StatelessWidget {
  final List<ListImpressionComment> impression;

  ImpressionComment({Key key, this.impression}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        scrollDirection: Axis.vertical,
        itemCount: impression.length,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white10,
            child: Container(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.person,
                            color: Colors.blueAccent,
                          ),
                          Text(
                              impression[index].name +
                                  ' ' +
                                  impression[index].lastname,
                              style: TextStyle(
                                  fontFamily: FontStyles().fontFamily,
                                  fontSize: 16))
                        ],
                      ),
                      Row(
                        children: [
                          Text(impression[index].create_date,
                              style: TextStyle(
                                  fontFamily: FontStyles().fontFamily,
                                  fontSize: 10,
                                  color: Colors.grey)),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.only(
                            top: 5, left: 3, right: 3, bottom: 5),
                        child: Text(
                          impression[index].description,
                          style: TextStyle(
                              fontFamily: FontStyles().fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
