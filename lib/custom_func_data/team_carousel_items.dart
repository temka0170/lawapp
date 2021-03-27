import 'dart:ui';

import 'package:flutter/material.dart';
import 'data.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_1/custom_func_data/home_team_carousel.dart';

class TeamCarousel extends StatefulWidget {
  TeamCarousel({
    Key key,
  }) : super(key: key);
  @override
  _TeamCarouselState createState() => _TeamCarouselState();
}

class _TeamCarouselState extends State<TeamCarousel> {
  double itemWidth = 90.0;
  int itemCount = getCreators().length;
  int selected;
  int y = 2;
  String title = "Э.АМАРХҮҮ\nХУУЛЬЧ, ӨМГӨӨЛӨГЧ";
  FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 2);
  List<CreatorModel> creators = new List<CreatorModel>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    creators = getCreators();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: RotatedBox(
            quarterTurns: -1,
            child: GestureDetector(
              onTap: () {
                double height = MediaQuery.of(context).size.height;
                buildShowGeneralDialog(context, height, y);
              },
              child: ListWheelScrollView(
                magnification: 2.0,
                diameterRatio: 2.5,
                onSelectedItemChanged: (x) {
                  setState(() {
                    selected = x;
                    y = x;
                    title = creators[y].getDescript();
                  });
                  print(selected);
                },
                controller: _scrollController,
                itemExtent: itemWidth,
                children: [
                  GestureDetector(
                    onTap: () {
                      double height = MediaQuery.of(context).size.height;
                      buildShowGeneralDialog(context, height, 1);
                    },
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        width: 100.0,
                        height: 100.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xfff78c1e), shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/person2.jfif"),
                          radius: 40.0,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      double height = MediaQuery.of(context).size.height;
                      buildShowGeneralDialog(context, height, 2);
                    },
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        width: 100.0,
                        height: 100.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xfff78c1e), shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/person4.jpg"),
                          radius: 40.0,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      double height = MediaQuery.of(context).size.height;
                      buildShowGeneralDialog(context, height, 0);
                    },
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        width: 100.0,
                        height: 100.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xfff78c1e), shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/LawyerAmraa.jpg"),
                          radius: 40.0,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      double height = MediaQuery.of(context).size.height;
                      buildShowGeneralDialog(context, height, 3);
                    },
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        width: 100.0,
                        height: 100.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xfff78c1e), shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/person3.jpg"),
                          radius: 40.0,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      double height = MediaQuery.of(context).size.height;
                      buildShowGeneralDialog(context, height, 4);
                    },
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        width: 100.0,
                        height: 100.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xfff78c1e), shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/person1.jpg"),
                          radius: 40.0,
                        ),
                      ),
                    ),
                  ),
                ],
                //   List.generate(
                //   itemCount,
                //   (x) => RotatedBox(
                //       quarterTurns: 1,
                //       child: GestureDetector(
                //           onTap: () {
                //             double height = MediaQuery.of(context).size.height;
                //             buildShowGeneralDialog(
                //                 context, height, creators[x].creatorIdx);
                //           },
                //           child: AnimatedContainer(
                //             duration: Duration(milliseconds: 400),
                //             width: x == selected ? 100 : 80,
                //             height: x == selected ? 100 : 80,
                //             alignment: Alignment.center,
                //             decoration: BoxDecoration(
                //                 color: x == selected ? Colors.red : Colors.grey,
                //                 shape: BoxShape.circle),
                //             child: Text("Test"),
                //             //   Image.asset(
                //             //   creators[x].creatorImgPath,
                //             //   fit: BoxFit.fill,
                //             // )),
                //           ))),
                // ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff23233c),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  //team popup
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
