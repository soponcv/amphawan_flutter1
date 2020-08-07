import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:flutter/material.dart';

class Infor_3 extends StatefulWidget {
  @override
  _Infor_3State createState() => _Infor_3State();
}

class _Infor_3State extends State<Infor_3> {
  TextStyle txtTop = TextStyle(
      fontFamily: FontStyles().fontFamily,
      color: Color(0xFF7F9525),
      fontSize: 19);
  TextStyle topic = TextStyle(
      fontFamily: FontStyles().fontFamily,
      color: Color(0xFF7F9525),
      fontSize: 19);
  TextStyle detail = TextStyle(
      fontFamily: FontStyles().fontFamily,
      color: Color(0xFF6A3500),
      fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'พระเจดีย์ฯ',
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
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 190,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'พระเจดีย์ธรรมสิงหบุราจริยานุสรณ์',
                          style: txtTop,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/information/jd.png'),
                        fit: BoxFit.cover),
                  )),
              Padding(padding: EdgeInsets.all(10)),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '“คำปรารภถึงการสร้างเจดีย์ของหลวงพ่อ”',
                        style: topic,
                      ),
                      Text(
                        'ที่มาของการสร้างเจดีย์นั้น ได้มาจากการปรารภของพระเดชพระคุณหลวงพ่อที่เคยพูดคุยกับพระครูวินัยธรวรพงษ์ (เลขาฯ) ตั้งแต่ปี ๒๕๕๑ และได้มีการร่างแบบและกำหนดสถานที่ก่อสร้างเจดีย์ โดยผ่านความเห็นชอบจากหลวงพ่อมาแล้ว ที่ผ่านมายังไม่ดำเนินการต่อเพราะยังไม่ถึงเวลา',
                        style: detail,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        'แต่บัดนี้เป็นเวลาที่เหมาะสมแล้ว จึงได้ดำเนินการจากเจตนารมณ์ของหลวงพ่อเป็นสิ่งสุดท้ายที่ท่านปรารภไว้ว่าจะต้องทำให้สำเร็จ เพื่อเป็นอนุสรณ์สถาน ฝากไว้ให้อนุชนคนรุ่นหลังสืบต่อไป',
                        style: detail,
                      ),
                      Padding(padding: EdgeInsets.all(20)),
                      Text(
                        'ลักษณะของพระเจดีย์ฯ',
                        style: topic,
                      ),
                      Image(
                        image: AssetImage('assets/images/information/wat1.png'),
                        height: 160,
                      ),
                      Text(
                        'ชั้นล่างเป็นห้องโถงกว้างใหญ่ที่พระภิกษุสงฆ์และพุทธบริษัทสามารถใช้ปฎิบัติศาสนกิจต่างๆ ชั้นที่ ๒ เพื่อบรรจุพระสรีระสังขารรวมทั้งอัฐบริขารต่างๆของหลวงพ่อ ส่วนชั้น ๓ หรือชั้นบนสุด เพื่อบรรจุพระบรมสารีริกธาตุขององค์สมเด็จพระสัมมาสัมพุทธเจ้า นอกจากนั้นที่ฐานโดยรอบชั้นล่างของพระเจดีย์ยังสามารถใช้เพื่อการเวียนเทียนประทักษิณ',
                        style: detail,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                    ],
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
