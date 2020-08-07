import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:flutter/material.dart';

class Preparation extends StatefulWidget {
  @override
  _PreparationState createState() => _PreparationState();
}

class _PreparationState extends State<Preparation> {
  TextStyle topic = TextStyle(
      fontFamily: FontStyles().fontFamily,
      color: Color(0xFF7F9525),
      fontSize: 19);
  TextStyle detail = TextStyle(
      fontFamily: FontStyles().fontFamily,
      color: Color(0xFF6A3500),
      fontSize: 14);
  TextStyle detailRed = TextStyle(
      fontFamily: FontStyles().fontFamily,
      color: Color(0xFFCC1D1D),
      fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'การเตรียมตัวมาปฎิบัติธรรม',
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
              Image(
                image: AssetImage('assets/images/information/reparation.png'),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'ผู้ปฏิบัติควรเตรียมสิ่งของดังต่อไปนี้ ',
                        style: detail,
                      ),
                      Padding(padding: EdgeInsets.all(4)),
                      Text(
                        '   ๑) บัตรประจำตัวประชาชน หรือบัตรที่แสดงเฉพาะบุคคล ',
                        style: detail,
                      ),
                      Text(
                        '   ๒) ของใช้ส่วนตัวที่จำเป็น เช่น แปรงสีฟัน ยาสีฟัน สบู่ เป็นต้น (ควรงดเว้นการสวมใส่เครื่องประดับ) ',
                        style: detail,
                      ),
                      Text(
                        '   ๓) ชุดปฏิบัติธรรมสีขาว ชาย กางเกงขายาวสีขาว เสื้อแขนสั้นสีขาว หญิง เสื้อแขนยาว ผ้าถุงสีขาว สไบสีขาว',
                        style: detail,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            child: Container(
                              height: 10.0,
                              width: 10.0,
                              decoration: new BoxDecoration(
                                color: Color(0xFFEEFF00),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFD4A23F).withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(7)),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              'ในกรณีที่ท่านไม่สามารถหาชุดขาวได้ ทางวัดมีให้ยืม ครบทุกอย่าง โดยไม่เสียค่าใช้จ่ายแต่อย่างใด',
                              style: detailRed,
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(7)),
                      Text(
                        '   ๔) ผ้าห่มส่วนตัว ทางวัดงดการจัดเตรียมผ้าห่มในช่วงนี้ เพื่อป้องกันการแพร่เชื้อ Covid-19 ',
                        style: detail,
                      ),
                      Text(
                        '   ๕) ตั้งใจปฏิบัติธรรมเพียงอย่างเดียวเท่านั้น เพราะหลวงพ่อจรัญฯ ได้เป็นผู้อนุเคราะห์ในเรื่องของที่พักพร้อม โดยท่านไม่ต้องเสียค่าใช้จ่ายแต่อย่างใด ขอเพียงตั้งใจปฏิบัติธรรมอย่างเดียว',
                        style: detail,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Text('“ถ้าท่านตั้งใจปฏิบัติธรรม โดย',
                                style: TextStyle(
                                    fontFamily: FontStyles().fontFamily,
                                    fontSize: 14,
                                    color: Color(0xFF5C7931))),
                            Text('กินน้อย พูดน้อย นอนน้อย ทำความเพียรให้มาก',
                                style: TextStyle(
                                    fontFamily: FontStyles().fontFamily,
                                    fontSize: 16,
                                    color: Color(0xFFC57F06))),
                            Text('แล้วไม่สนใจใครทั้งหมด',
                                style: TextStyle(
                                    fontFamily: FontStyles().fontFamily,
                                    fontSize: 14,
                                    color: Color(0xFF5C7931))),
                            Text('(พะว้าภวังค์ ห่วงโน่น ห่วงนี่ ห่วงนั่น)',
                                style: TextStyle(
                                    fontFamily: FontStyles().fontFamily,
                                    fontSize: 14,
                                    color: Color(0xFF5C7931))),
                            Text('ท่านจะไม่ขาดทุน”',
                                style: TextStyle(
                                    fontFamily: FontStyles().fontFamily,
                                    fontSize: 16,
                                    color: Color(0xFFC57F06))),
                            Text('-พระธรรมสิงหบุราจารย์-',
                                style: TextStyle(
                                    fontFamily: FontStyles().fontFamily,
                                    fontSize: 14,
                                    color: Color(0xFF5C7931))),
                          ],
                        ),
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
