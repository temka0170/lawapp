import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_1/custom_functions/home_team_carousel.dart';

//Home Section Project Team profiles
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
          // makes scrollable widget, removes overflow
          child: SingleChildScrollView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            child: Row(
                children: [
                  CreatorProfile(
                    img: "assets/creators_png/designer1_2.jpg",
                    idx: 0,
                  ),
                  CreatorProfile(
                    img: "assets/creators_png/tedyM.jpg",
                    idx: 1,
                  ),
                  CreatorProfile(
                    img: "assets/creators_png/tsengelM.jpg",
                    idx: 2,
                  ),
                  CreatorProfile(
                    img: "assets/creators_png/lawyer1_5.jpg",
                    idx: 3,
                  ),
                  CreatorProfile(
                    img: "assets/creators_png/lawyer2_2.jpg",
                    idx: 4,
                  ),
                  CreatorProfile(
                    img: "assets/creators_png/lawyer3M.jpg",
                    idx: 5,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
// Template of individual profile
// ignore: must_be_immutable
class CreatorProfile extends StatefulWidget{
  int idx;
  String img;
  CreatorProfile({
    Key key,
    @required idx,
    @required img,
  }) : super(key: key);
  @override
  _CreatorProfileState createState() => _CreatorProfileState();
}

class _CreatorProfileState extends State<CreatorProfile>{
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      // popup carousel slider
      child: GestureDetector(
        onTap: () {
          double height = MediaQuery.of(context).size.height;
          buildShowGeneralDialog(context, height, widget.idx); // links to popup idx 0
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // profile outer line gradient
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(241, 103, 48, 1.0),
                Color.fromRGBO(249, 167, 25, 1.0)
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          // circle avatar profile
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: CircleAvatar(
              radius: 47,
              backgroundImage: AssetImage(widget.img),
            ),
          ),
        ),
      ),
    );
  }

  //App creators intro popup
  Future buildShowGeneralDialog(BuildContext context, double height, int idx) {
    // ignore: unused_local_variable
    int _current;
    return showGeneralDialog(// popup widget
        context: context,
        barrierDismissible: true,
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return BackdropFilter(// blurred background
            filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(// container of popup
              width: MediaQuery.of(context).size.width,
              height: height,
              child: SizedBox.expand(
                child: Column(children: [
                  // separate padding
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                  ),
                  //back button
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
                  // separate padding
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  // Slider of Project creators
                  CarouselSlider(
                    items: imageSliders,
                    options: CarouselOptions(
                        initialPage: idx, // links to previous widget, Pops up clicked person's info
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