import 'dart:ui';

import 'package:flutter/material.dart';
import 'data.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_1/custom_functions/home_team_carousel.dart';

//home section scrollable creators section
class TeamCarousel extends StatefulWidget {
  TeamCarousel({
    Key key,
  }) : super(key: key);
  @override
  _TeamCarouselState createState() => _TeamCarouselState();
}

class _TeamCarouselState extends State<TeamCarousel> {

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController(initialScrollOffset: 150.0);
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        double height = MediaQuery.of(context).size.height;
                        buildShowGeneralDialog(context, height, 0);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(241, 103, 48, 1.0),
                              Color.fromRGBO(249, 167, 25, 1.0)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          child: CircleAvatar(
                            radius: 47,
                            backgroundImage: AssetImage("assets/creators_png/designer1_2.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        double height = MediaQuery.of(context).size.height;
                        buildShowGeneralDialog(context, height, 1);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(241, 103, 48, 1.0),
                              Color.fromRGBO(249, 167, 25, 1.0)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          child: CircleAvatar(
                            radius: 47,
                            backgroundImage: AssetImage("assets/creators_png/tedyM.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        double height = MediaQuery.of(context).size.height;
                        buildShowGeneralDialog(context, height, 2);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(241, 103, 48, 1.0),
                              Color.fromRGBO(249, 167, 25, 1.0)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          child: CircleAvatar(
                            radius: 47,
                            backgroundImage: AssetImage("assets/creators_png/tsengelM.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        double height = MediaQuery.of(context).size.height;
                        buildShowGeneralDialog(context, height, 3);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(241, 103, 48, 1.0),
                              Color.fromRGBO(249, 167, 25, 1.0)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          child: CircleAvatar(
                            radius: 47,
                            backgroundImage: AssetImage("assets/creators_png/lawyer1_5.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        double height = MediaQuery.of(context).size.height;
                        buildShowGeneralDialog(context, height, 4);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(241, 103, 48, 1.0),
                              Color.fromRGBO(249, 167, 25, 1.0)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          child: CircleAvatar(
                            radius: 47,
                            backgroundImage: AssetImage("assets/creators_png/lawyer2_2.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        double height = MediaQuery.of(context).size.height;
                        buildShowGeneralDialog(context, height, 5);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(241, 103, 48, 1.0),
                              Color.fromRGBO(249, 167, 25, 1.0)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          child: CircleAvatar(
                            radius: 47,
                            backgroundImage: AssetImage("assets/creators_png/lawyer3M.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  //App creators intro popup
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 28.0),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  CarouselSlider(
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
                ]),
              ),
            ),
          );
        });
  }
}
