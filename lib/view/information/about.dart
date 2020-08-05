import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:flutter/material.dart';

class AboutWat extends StatefulWidget {
  @override
  _AboutWatState createState() => _AboutWatState();
}

class _AboutWatState extends State<AboutWat> {
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
          'วัดอัมพวัน',
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
                image: AssetImage('assets/images/information/amphawan.png'),
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
                        'วัดอัมพวัน',
                        style: topic,
                      ),
                      Text(
                        'วัดอัมพวันเป็นวัดที่ตั้งอยู่ริมแม่น้ำเจ้าพระยาฝั่งตะวันออก สภาพทั่วไปนั้น มีต้นไม้ประมาณ ๓๐๐ ต้น เป็นไม้ดอก – ไม้ใบ ที่ปลูกใหม่ เดิมสภาพพื้นที่จะเป็นที่ที่น้ำท่วมถึง มาบัดนี้ทางวัดได้ทำถนน – คูกั้นน้ำ จึงสามารถป้องกันน้ำไว้ได้ จึงได้มีการปลูกต้นไม้เพิ่มขึ้น',
                        style: detail,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Text(
                        'หลักฐานการตั้งวัด',
                        style: topic,
                      ),
                      Text(
                        'จากการสำรวจทางราชการประมาณกาลตั้งแต่ พ.ศ. ๒๑๗๕ การสร้างอุโบสถ ผูกพัทธสีมา มาแล้ว ๒ ครั้ง ครั้งแรกเมื่อรัชกาลที่ ๓ ครั้งที่ ๒ นี้ ได้รับพระราชทานวิสุงคามสีมา เมื่อวันที่ ๒๖ มีนาคม พ.ศ. ๒๕๑๓ กว้าง ๔๐ เมตร ยาว ๗๐ เมตร และได้ผูกพัทธสีมา วันที่ ๑๐ เมษายน พ.ศ. ๒๕๑๓',
                        style: detail,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            height: 110,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              'ประวัติความเป็นมาของวัด',
                              style: topic,
                            ),
                          ),
                          Image(
                            image: AssetImage(
                                'assets/images/information/amphawan-1.png'),
                            height: 90,
                          ),
                        ],
                      ),
                      Text(
                        'วัดอัมพวัน อำเภอพรหมบุรี จังหวัดสิงห์บุรี เป็นชื่อเดิมมาตั้งแต่กรุงศรีอยุธยา ศิลาจารึกในอุโบสถหลังเก่าจารึกเป็นภาษาจีนว่า คนจีนได้สร้างอุโบสถวัดอัมพวันป้ายวัดอัมพวัน สมัยเหม็งเชี้ยว คนจีนได้นำเรือกำปั่นมาทำการค้าขายกับสมเด็จพระนารายณ์มหาราช เมืองลพบุรี มากับฝรั่งชาติฮอลันดา จอดหน้าวัดอัมพวัน ได้สร้างโบสถ์วัดอัมพวัน สมัยเจ้าอาวาสวัดอัมพวันชื่อ พระครูญาณสังวร อายุ ๙๙ ปี สร้างโบสถ์เสร็จแล้ว ฝรั่งเพื่อนคนจีนได้ขอพระราชทาน พระหน้าปรกหินทั้งสององค์จากสมเด็จพระนารายณ์มหาราช ให้คนจีนเอาไว้ในโบสถ์ จนถึงการสร้างโบสถ์หลังใหม่มาจนถึงทุกวันนี้',
                        style: detail,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              'อุโบสถหลังเก่าได้ชำรุดและพังลง เมื่อวันอังคารที่ ๒๐ กุมภาพันธ์ พ.ศ.๒๕๑๑ ตรงกับวันแรม ๗ ค่ำเดือน ๓ ปีจอ เวลา ๐๙.๔๕ น.',
                              style: detail,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              'ได้รื้อถอนเมื่อวันที่ ๑๑ พฤศจิกายน พ.ศ.๒๕๑๑ ตรงกับแรม ๗ ค่ำ เดือน ๑๒ เวลา ๑๐.๐๐ น. ด้วยแรงชาวบ้านและรถยกของ ป.พัน ๑๐๑ มาช่วยกันรื้ออุโบสถ เสร็จเรียบร้อยภายใน ๔ วัน',
                              style: detail,
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Padding(padding: EdgeInsets.all(5)),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              'เริ่มก่อสร้างอุโบสถ วันที่ ๑๕ พฤศจิกายน พ.ศ.๒๕๑๑ วางศิลาฤกษ์ ๑๔-๑๕ มีนาคม พ.ศ.๒๕๑๒ สร้างเสร็จเรียบร้อยเมื่อวันที่ ๓๑ มีนาคม พ.ศ. ๒๕๑๓ รวมเวลาการก่อสร้าง ๑ ปี ๔ เดือน ๑๕ วัน ผูกพัทธสีมาวันที่ ๘-๑๒ เมษายน พ.ศ. ๒๕๑๓',
                              style: detail,
                            ),
                          ),
                        ],
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
