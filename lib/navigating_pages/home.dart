import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_1/custom_func_data/home_carousel.dart';
import 'package:project_1/custom_func_data/home_table.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Color(0xfff4f5fa),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: height * 0.31,
              child: MainScreen(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text("БҮТЭЭСЭН БАГ",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff23233c),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        top: 5.0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          buildShowGeneralDialog(context, height, 0);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[350],
                          radius: 43.0,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/galaxy.jpg'),
                            radius: 38.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 300.0,
                        top: 5.0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          buildShowGeneralDialog(context, height, 4);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[350],
                          radius: 43.0,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/test.jpg'),
                            radius: 38.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 90.0,
                        top: 3.0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          buildShowGeneralDialog(context, height, 1);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[350],
                          radius: 46.0,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/splashscreen/start1.png'),
                            radius: 41.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 230.0,
                        top: 3.0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          buildShowGeneralDialog(context, height, 3);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[350],
                          radius: 46.0,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/splashscreen/start3.png'),
                            radius: 41.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 160.0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          buildShowGeneralDialog(context, height, 2);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[350],
                          radius: 50.0,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/splashscreen/start2.png'),
                            radius: 45.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text("Placeholder",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff23233c),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
            //home hesgiin holboos link, holbogdoh hesgig tusad n class bolgoson
            HomeContainer(),
          ],
        ),
      ),
    );
  }

  Future buildShowGeneralDialog(BuildContext context, double height, int idx) {
    // ignore: unused_local_variable
    int _current;
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: height,
              child: SizedBox.expand(
                child: Column(children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 28.0, right: 28.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            decoration: new BoxDecoration(
                              color: Color(0xffffffff).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: Icon(Icons.close)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 85.0),
                    child: CarouselSlider(
                      items: imageSliders,
                      options: CarouselOptions(
                          initialPage: idx,
                          autoPlay: false,
                          enlargeCenterPage: false,
                          height: height * 0.685,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }
}
