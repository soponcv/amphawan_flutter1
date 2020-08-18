import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:flutter/material.dart';

class DetailImpression extends StatefulWidget {
  final int id;
  final String topic;
  DetailImpression({Key key, @required this.topic, this.id}) : super(key: key);
  @override
  _DetailImpressionState createState() => _DetailImpressionState();
}

class _DetailImpressionState extends State<DetailImpression> {
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
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 1,
                      color: Color(0xFFD6A07C),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
            ],
          ),
        ),
      ),
    );
  }
}
