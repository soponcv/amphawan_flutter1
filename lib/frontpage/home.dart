import 'package:amphawan/styles/app_bar.dart';
import 'package:amphawan/styles/font_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // nested() {
  //   return NestedScrollView(
  //     headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
  //       return <Widget>[
  //         SliverAppBar(
  //           expandedHeight: 200.0,
  //           floating: false,
  //           pinned: true,
  //           backgroundColor: Color(0xFFDFF1CD),
  //           shape: CustomShapeBorder(),
  //           flexibleSpace: Container(
  //             child: Container(
  //               width: MediaQuery.of(context).size.width,
  //               height: 150,
  //               child: Column(
  //                 children: <Widget>[
  //                   Padding(padding: EdgeInsets.all(20)),
  //                   Visibility(
  //                     visible: true,
  //                     child: Container(
  //                       child: Row(
  //                         children: <Widget>[
  //                           InkWell(
  //                             child: Icon(Icons.menu),
  //                           ),
  //                           Image(
  //                             image: AssetImage('assets/images/logo/logo.png'),
  //                             width: 100,
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         )
  //       ];
  //     },
  //     body: Center(
  //       child: Text("The Parrot"),
  //     ),
  //   );
  // }

  var top = 0.0;
  var top1 = 0.0;

  TextStyle txtBIcon =
      TextStyle(fontFamily: FontStyles().fontFamily, color: Color(0xFF158A0E));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 245.0,
            floating: false,
            pinned: true,
            backgroundColor: Color(0xFFDFF1CD),
            shape: CustomShapeBorder(),
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // print('constraints=' + constraints.toString());
                top = constraints.biggest.height;
                top1 = constraints.biggest.height;
                // return FlexibleSpaceBar(
                //   centerTitle: true,
                //   title: AnimatedOpacity(
                //       duration: Duration(milliseconds: 300),
                //       //opacity: top == 80.0 ? 1.0 : 0.0,
                //       opacity: 1.0,
                //       child: Text(
                //         top.toString(),
                //         style: TextStyle(fontSize: 12.0),
                //       )),

                // );
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg/bg.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: <Widget>[
                      Visibility(
                        visible: top <= 90.0 ? true : false,
                        child: Padding(padding: EdgeInsets.all(15)),
                      ),
                      Visibility(
                        visible: top <= 90.0 ? true : false,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                child: Icon(Icons.menu),
                              ),
                              Image(
                                image:
                                    AssetImage('assets/images/logo/logo.png'),
                                width: 100,
                              )
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: top1 > 100.0 ? true : false,
                        child: Stack(
                          children: <Widget>[
                            SizedBox(
                              height: top < 250 ? top1 - 10 : 250,
                              child: Container(
                                  child: Column(
                                children: <Widget>[
                                  Container(
                                    height: top < 220 ? top1 - 100 : 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/information/jd.png'),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Visibility(
                                      visible: top1 == 80.0 ? false : true,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(padding: EdgeInsets.all(15)),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                InkWell(
                                                  child: Icon(Icons.menu),
                                                ),
                                                Image(
                                                  image: AssetImage(
                                                      'assets/images/logo/logo.png'),
                                                  width: 100,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Positioned(
                              width: MediaQuery.of(context).size.width * 1.1,
                              left: -10,
                              top: top < 220 ? top - 150 : 115,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.1,
                                height: top < 220 ? top - 50 : 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/bg/home_bg.png'),
                                      fit: BoxFit.fitWidth),
                                ),
                              ),
                            ),
                            Positioned(
                              width: 80,
                              left: MediaQuery.of(context).size.width * 0.1,
                              top: top < 220 ? top - 150 : 100,
                              child: InkWell(
                                onTap: () {
                                  print('รู่จักวัด');
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.1,
                                  child: Column(
                                    children: <Widget>[
                                      Image(
                                          image: AssetImage(
                                              'assets/images/icon/icon1.png'),
                                          fit: BoxFit.cover),
                                      Text(
                                        'รู้จักวัด',
                                        style: txtBIcon,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              width: 80,
                              left: MediaQuery.of(context).size.width * 0.4,
                              top: top < 220 ? top - 150 : 100,
                              child: InkWell(
                                onTap: () {
                                  print('รู่จักวัด');
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.1,
                                  child: Column(
                                    children: <Widget>[
                                      Image(
                                          image: AssetImage(
                                              'assets/images/icon/icon2.png'),
                                          fit: BoxFit.cover),
                                      Text(
                                        'ปฏิบัติธรรม',
                                        style: txtBIcon,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              width: 80,
                              left: MediaQuery.of(context).size.width * 0.7,
                              top: top < 220 ? top - 150 : 100,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.1,
                                  child: Column(
                                    children: <Widget>[
                                      Image(
                                          image: AssetImage(
                                              'assets/images/icon/icon3.png'),
                                          fit: BoxFit.cover),
                                      Text(
                                        'สื่อธรรมะ',
                                        style: txtBIcon,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                width: MediaQuery.of(context).size.width * 0.9,
                                left: 20,
                                top: top < 220 ? top - 50 : 200,
                                child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width * 1.1,
                                    child: Card(
                                      color: Color(0xFFF0F0F0),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: Card(
                                              color: Color(0xFF2C612A),
                                              child: Icon(
                                                Icons.wifi_tethering,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                      // Text(
                      //   top.toString(),
                      //   style: TextStyle(fontSize: 12.0),
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
        ];
      },
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Text("List Item: " + index.toString());
        },
      ),
    ));
  }
}

// class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;
//   final bool hideTitleWhenExpanded;

//   CustomSliverDelegate({
//     @required this.expandedHeight,
//     this.hideTitleWhenExpanded = true,
//   });

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     final appBarSize = expandedHeight - shrinkOffset;
//     final cardTopPosition = expandedHeight / 2 - shrinkOffset;
//     final proportion = 2 - (expandedHeight / appBarSize);
//     final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
//     return SizedBox(
//       // height: expandedHeight + expandedHeight / 2,
//       child: Stack(
//         children: [
//           SizedBox(
//             height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
//             child: AppBar(
//               backgroundColor: Colors.green,
//               elevation: 0.0,
//               // title: Opacity(
//               //     opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
//               //     child: Text("Test")),
//               flexibleSpace: Container(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: Column(
//                     children: <Widget>[
//                       Visibility(
//                         visible: hideTitleWhenExpanded ? true : false,
//                         child: Opacity(
//                           opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
//                           child: Container(
//                             child: Row(
//                               children: <Widget>[
//                                 InkWell(
//                                   child: Icon(Icons.menu),
//                                 ),
//                                 Image(
//                                   image:
//                                       AssetImage('assets/images/logo/logo.png'),
//                                   width: 100,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Visibility(
//                         visible: hideTitleWhenExpanded ? true : false,
//                         child: Opacity(
//                           opacity: percent,
//                           child: Container(
//                             height: 100,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage(
//                                       'assets/images/information/jd.png'),
//                                   fit: BoxFit.cover),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Visibility(
//           //   visible: hideTitleWhenExpanded ? true : false,
//           //   child: Positioned(
//           //     left: 0.0,
//           //     right: 0.0,
//           //     top: cardTopPosition > 0 ? cardTopPosition : 0,
//           //     bottom: 0.0,
//           //     child: Opacity(
//           //       opacity: percent,
//           //       child: Padding(
//           //         padding: EdgeInsets.symmetric(horizontal: 30 * percent),
//           //         child: Card(
//           //           elevation: 20.0,
//           //           child: Center(
//           //             child: Text("Header"),
//           //           ),
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   @override
//   double get maxExtent => expandedHeight + expandedHeight / 2;

//   @override
//   double get minExtent => kToolbarHeight;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
