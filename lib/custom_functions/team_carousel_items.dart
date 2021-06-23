import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    ScrollController _controller =
        new ScrollController(initialScrollOffset: 150.0);
    return SingleChildScrollView(
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
    );
  }
}

// Template of individual profile
// ignore: must_be_immutable
class CreatorProfile extends StatefulWidget {
  final int idx;
  final String img;
  CreatorProfile({
    Key key,
    @required this.idx,
    @required this.img,
  }) : super(key: key);
  @override
  _CreatorProfileState createState() => _CreatorProfileState();
}

class _CreatorProfileState extends State<CreatorProfile> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      // popup carousel slider
      child: GestureDetector(
        onTap: () {
          double height = MediaQuery.of(context).size.height;
          buildShowGeneralDialog(
              context, height, widget.idx); // links to popup idx 0
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
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var mobile = shortestSide < 600;
    double _imgWidth = MediaQuery.of(context).size.width * 0.8;
    double _imgHeight = _imgWidth * 2;
    // ignore: unused_local_variable
    int _current;
    //Project team intro popup
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                height: height,
                margin: mobile
                    ? EdgeInsets.symmetric(horizontal: 6.0)
                    : EdgeInsets.symmetric(horizontal: 12.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                            width: mobile
                                ? _imgWidth
                                : MediaQuery.of(context).size.width * 0.64,
                            height: _imgHeight,
                            child: Image.asset(
                              item,
                              fit: BoxFit.fill,
                            )),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    itemTitle[imgList.indexOf(item)],
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xffffffff),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    itemDesc[imgList.indexOf(item)],
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xfff9931f),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18.0, bottom: 8.0),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: 206,
                                      height: 50,
                                      decoration: new BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            width: 1.0,
                                            color: Color(0xfff9931f),
                                            style: BorderStyle.solid),
                                      ),
                                      child: Center(
                                        child: Text(
                                          itemBtn[imgList.indexOf(item)],
                                          style: TextStyle(
                                            fontFamily: 'SFProDisplay',
                                            color: Color(0xffffffff),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            decoration: TextDecoration.none,
                                          ),
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
                    )),
              ),
            ))
        .toList();
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
                      padding: const EdgeInsets.only(right: 25.0, top: 25.0),
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
                        height: height * 0.75,
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

//Project team popup images
final List<String> imgList = [
  "assets/creators_png/designer1.jpg",
  "assets/creators_png/tedy1.jpg",
  "assets/creators_png/tsengel.jpg",
  "assets/creators_png/lawyer1_7.jpg",
  "assets/creators_png/lawyer2_7.jpg",
  "assets/creators_png/lawyer3.jpg"
];

//Project team popup titles
final List<String> itemTitle = [
  "Дизайнер",
  "Апп Хөгжүүлэгч",
  "Апп Хөгжүүлэгч",
  "Хуульч, Өмгөөлөгч",
  "Хуульч, Өмгөөлөгч",
  "Эрх зүйч"
];

//Project team popup descriptions
final List<String> itemDesc = [
  "\"Lead Designer\"",
  "\"Junior Developer\"",
  "\"Senior Developer\"",
  "\"Төслийг санаачлагч,\n Зохион бүтээгч,\n Төслийн удирдагч\"",
  "\"Зөвлөх\"",
  "\"Туслах\""
];

//Project team popup names
final List<String> itemBtn = [
  "Б.Батзориг",
  "Б.Тэмүүлэн",
  "С.Батцэнгэл",
  "Э.Амархүү",
  "П.Ундрах-Эрдэнэ",
  "Х.Отгонтогтох",
];
