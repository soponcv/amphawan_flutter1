import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/view/dhamma/registerDhammaResult.dart';
import 'package:flutter/material.dart';

class RegDhamma extends StatefulWidget {
  final int dhamma_id;
  final String username;
  RegDhamma({Key key, @required this.dhamma_id, this.username})
      : super(key: key);
  @override
  _RegDhammaState createState() => _RegDhammaState();
}

class _RegDhammaState extends State<RegDhamma> {
  TextStyle txtDetail = TextStyle(
      fontFamily: FontStyles().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.normal);

  bool monVall = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'ข้อตกลง',
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
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.all(10)),
                              Container(
                                child: Center(
                                  child: Text(
                                    'ข้อตกลง',
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
                                child: Text(
                                  '     "ข้าพเจ้าขอสัญญาว่าจะตั้งใจปฏิบัติอย่างเคร่งครัด จริงจัง และจะปฏิบัติตามกฎระเบียบ รวมถึงนโยบาย ของวัดอัมพวันทุกประการ',
                                  style: txtDetail,
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(3)),
                              Container(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: Text(
                                    '     หากข้าพเจ้าละเว้น หรือฝ่าฝืนกฎระเบียบของวัดอัมพวัน หรือให้รายละเอียดเกี่ยวกับตัวข้าพเจ้าไม่ถูกต้องตาม ความเป็นจริง ข้าพเจ้ายินยอมออกจากวัดไปก่อนกำหนด "',
                                    style: txtDetail),
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: monVall,
                                    onChanged: (bool value) {
                                      setState(() {
                                        monVall = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    'ข้าพเจ้ายอมรับข้อตกลง',
                                    style: TextStyle(
                                        fontFamily: FontStyles().fontFamily),
                                  )
                                ],
                              ),
                              RaisedButton(
                                color: monVall == true
                                    ? Color(0xFF70CD4F)
                                    : Colors.grey,
                                onPressed: () {
                                  if (monVall) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DhammaResult(
                                          dhamma_id: widget.dhamma_id,
                                          username: widget.username,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Text('ยืนยัน',
                                    style: TextStyle(
                                        fontFamily: FontStyles().fontFamily,
                                        color: Colors.white,
                                        fontSize: 16)),
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                            ],
                          ),
                        )
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
