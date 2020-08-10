import 'package:amphawan/styles/font_style.dart';
import 'package:flutter/material.dart';

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

final List<String> imgList = [
  'assets/images/tst/tst_banner.png',
  'assets/images/tst/tst_banner.png',
  'assets/images/tst/tst_banner.png',
  'assets/images/tst/tst_banner.png',
  'assets/images/tst/tst_banner.png',
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        child: Container(
          // margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage(item),
                    fit: BoxFit.cover,
                    width: 1100,
                  ),
                  // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(100, 0, 0, 0),
                            Color.fromARGB(100, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: Text(
                        'No. ${item} image',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: FontStyles().fontFamily),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    )
    .toList();
