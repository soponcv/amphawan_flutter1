import 'package:amphawan/system/url.dart';
import 'package:amphawan/view/dhamma/mainDhamma.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:amphawan/styles/text_style.dart';
import 'package:amphawan/view/activity/mainActivity.dart';
import 'package:amphawan/view/impression/mainImpression.dart';
import 'package:amphawan/view/information/infor_1.dart';
import 'package:amphawan/view/information/infor_2.dart';
import 'package:amphawan/view/information/infor_3.dart';
import 'package:amphawan/view/information/infor_preparation.dart';
import 'package:amphawan/view/register/mainRegister.dart';
import 'package:amphawan/view/sign/main_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListMenu extends StatefulWidget {
  @override
  _ListMenuState createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  String name = '', lastname = '';
  TextStyle txt_login = TextStyle(
      fontFamily: FontStyles().fontFamily,
      fontSize: 26,
      color: Color(0xFF67B762));
  TextStyle txt_teb = TextStyle(
      fontFamily: FontStyles().fontFamily, fontSize: 18, color: Colors.white);

  @override
  void initState() {
    // TODO: implement initState
    getSave();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg/bg.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 30)),
                name != ''
                    ? Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 42.26,
                                height: 42.26,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                decoration: new BoxDecoration(
                                  color: Color(0xFFFCC402),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xFFFFF4CE),
                                    width: 5.0,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(5)),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    name + ' ' + lastname,
                                    style: txt_login,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainLogin()),
                            );
                          },
                          child: Row(children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 42.26,
                                  height: 42.26,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  decoration: new BoxDecoration(
                                    color: Color(0xFFFCC402),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0xFFFFF4CE),
                                      width: 5.0,
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                Text(
                                  'เข้าสู่ระบบ',
                                  style: txt_login,
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ]),
                        ),
                      )
              ],
            )),
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
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(5)),
                      Container(
                        height: 50,
                        child: Card(
                          color: Color(0xFFD2B12D),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.home,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "หน้าแรก",
                                      style: txt_teb,
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainRegister(
                                        cid: '0',
                                        txtTitle: 'แก้ไขข้อมูล',
                                        txtDetail: '',
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "ข้อมูลผู้ใช้",
                                      style: txt_teb,
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "ตั้งค่า",
                                      style: txt_teb,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Container(
                        height: 40,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.89,
                            decoration: BoxDecoration(
                                color: Color(0xFF67B762),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(40.0),
                                )),
                            child: Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  'รู้จักวัดอัมพวัน',
                                  style: txt_teb,
                                ),
                              ],
                            )),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Infor_1()),
                                );
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "วัดอัมพวัน",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Infor_2()),
                                );
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "หลวงพ่อจรัญฯ",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Infor_3()),
                                );
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "พระเจดีย์ฯ",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Container(
                        height: 40,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.89,
                            decoration: BoxDecoration(
                                color: Color(0xFF67B762),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(40.0),
                                )),
                            child: Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  'ปฎิบัติธรรม',
                                  style: txt_teb,
                                ),
                              ],
                            )),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Preparation()),
                                );
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "การเตรียมตัวมาปฎิบัติธรรม",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "ระเบียบผู้ปฎิบัติธรรม",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DhammaPage()),
                                );
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "ลงทะเบียนปฎิบัติธรรม",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "ลงทะเบียนปฎิบัติธรรมให้ผู้อื่น",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "ตรวจสอบ/ยกเลิก การลงทะเบียน",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Container(
                        height: 40,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.89,
                            decoration: BoxDecoration(
                                color: Color(0xFF67B762),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(40.0),
                                )),
                            child: Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  'ความเคลื่อนไหว',
                                  style: txt_teb,
                                ),
                              ],
                            )),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ActivityPage(),
                                  ),
                                );
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "กิจกรรมบุญ",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ImpressionPage()),
                                );
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "ความประทับใจ",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "แจ้งเตือน",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "สื่อธรรมะ",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Container(
                        height: 40,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.89,
                            decoration: BoxDecoration(
                                color: Color(0xFF67B762),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(40.0),
                                )),
                            child: Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  'ติดต่อ',
                                  style: txt_teb,
                                ),
                              ],
                            )),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Url().launchInBrowser(
                                    'https://www.amphawan.net/%e0%b8%95%e0%b8%b4%e0%b8%94%e0%b8%95%e0%b9%88%e0%b8%ad/');
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "ติดต่อวัดอัมพวัน",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Url().launchInBrowser(
                                    'https://www.amphawan.net/');
                              },
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "เว็บไซต์วัดอัมพวัน",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "แจ้งปัญหา/ติดต่อผู้พัฒนา",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Container(
                        height: 40,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.89,
                            decoration: BoxDecoration(
                                color: Color(0xFF67B762),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(40.0),
                                )),
                            child: Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  'สำหรับเจ้าหน้าที่',
                                  style: txt_teb,
                                ),
                              ],
                            )),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "รายฃื่อผู้ปฏิบัติธรรม",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "บล็อคผู้ปฏิบัติธรรม",
                                    style: TextStyles().txt_appBar,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Text(
                                    "ส่งความประทับใจ",
                                    style: TextStyles().appBar,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(20)),
            ],
          ),
        ),
      ),
    );
  }

  getSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('perName');
      lastname = prefs.getString('perLastName');
    });
  }
}
