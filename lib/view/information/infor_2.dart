import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:flutter/material.dart';

class Infor_2 extends StatefulWidget {
  @override
  _Infor_2State createState() => _Infor_2State();
}

class _Infor_2State extends State<Infor_2> {
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
          'หลวงพ่อจรัญฯ',
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
              Padding(padding: EdgeInsets.all(5)),
              Image(
                image: AssetImage('assets/images/information/mang.png'),
                height: 300,
              ),
              Padding(padding: EdgeInsets.all(2)),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '“เหนือฟ้ายังมีฟ้า แต่ไม่มีอะไรเหนือกฎแห่งกรรม”',
                        style: TextStyles().txtInfor2,
                      ),
                      Text(
                        'พระธรรมสิงหบุราจารย์',
                        style: TextStyles().txtInfor2_a,
                      ),
                      Text(
                        '(จรัญ ฐิตธมฺโม)',
                        style: TextStyles().txtInfor2_a,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Text(
                        'พระธรรมสิงหบุราจารย์ (จรัญ ฐิตธมฺโม) เป็นพระภิกษุชาวไทย ในสังกัดคณะสงฆ์มหานิกาย อดีตเจ้าอาวาสวัดอัมพวัน อำเภอพรหมบุรีจังหวัดสิงห์บุรี และเป็นที่ปรึกษาเจ้าคณะภาค ๓ ',
                        style: detail,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Text(
                        'ท่านมีชื่อเสียงในระดับประเทศจากการเป็นพระนักพัฒนา พระนักเทศน์ และพระวิปัสสนาจารย์ แนวทางการสืบทอดพระพุทธศาสนาของท่านเน้นหนักที่การสั่งสอนเรื่องกฎแห่งกรรม โดยยกเหตุการณ์ที่ท่านประสบและนับเป็นกฎแห่งกรรมขึ้นมาเป็นอุทาหรณ์อยู่เสมอ และเน้นการพัฒนาจิตใจคนด้วยการทำวิปัสสนากรรมฐานด้วยหลักสติปัฏฐาน ๔ แบบพองหนอ-ยุบหนอ นอกจากนี้ท่านยังเป็นผู้ที่ส่งเสริมให้พุทธศาสนิกชนหมั่นสวดมนต์ด้วยพุทธชัยมงคลคาถา (พาหุงมหากา) เพื่อเป็นเครื่องเจริญสติอย่างแพร่หลายอีกด้วย',
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
