import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:flutter/material.dart';

class MediaPage extends StatefulWidget {
  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  TextStyle textTopic = TextStyle(
      fontFamily: FontStyles().fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Color(0xFF158A0E));

  TextStyle textDetail = TextStyle(
      fontFamily: FontStyles().fontFamily,
      fontSize: 12,
      color: Color(0xFF573614));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'สื่อธรรมะ',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Image(
                        image: AssetImage('assets/images/tst/tst_4.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'เสียงเทศน์หลวงพ่อจรัญฯ',
                            style: textTopic,
                          ),
                          Padding(padding: EdgeInsets.all(2)),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Text(
                                'รวบรวมเทศนาธรรม จากหลวงพ่อจรัญ ฐิตธมฺโม พร้อมให้ดาวโหลดในรูปแบบไฟล์ MP3',
                                style: textDetail,
                              )),
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                              height: 25,
                              child: RaisedButton(
                                color: Color(0xFFBEAF4E),
                                onPressed: () {},
                                child: Text(
                                  'ดาวน์โหลด',
                                  style: TextStyle(
                                      fontFamily: FontStyles().fontFamily,
                                      color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Image(
                        image: AssetImage('assets/images/tst/tst_5.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'หนังสือกฎแห่งกรรม ธรรมปฏิบัติ',
                            style: textTopic,
                          ),
                          Padding(padding: EdgeInsets.all(2)),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Text(
                                'หนังสือธรรมะโดยหลวงพ่อจรัญฯ รวบรวมหลักธรรมคำสอน หลักการปฏิบัติธรรมและกฎแห่งกรรมจากประสบการณ์ของผู้ปฏิบัติ',
                                style: textDetail,
                              )),
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                              height: 25,
                              child: RaisedButton(
                                color: Color(0xFFBEAF4E),
                                onPressed: () {},
                                child: Text(
                                  'อ่าน',
                                  style: TextStyle(
                                      fontFamily: FontStyles().fontFamily,
                                      color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(2)),
            ],
          ),
        ),
      ),
    );
  }
}
