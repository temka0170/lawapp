import 'package:flutter/material.dart';

//our team popup
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                child: Stack(
                  children: <Widget>[
                    SizedBox.expand(
                        child: Image.asset(
                      item,
                      fit: BoxFit.fill,
                    )),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 186,
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
                          children: <Widget>[
                            SizedBox(
                              height: 40.0,
                            ),
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
                              padding: const EdgeInsets.only(top: 18.0),
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

//our team popup images
final List<String> imgList = [
  "assets/creators_png/tsengel.jpg",
  "assets/creators_png/tedy1.jpg",
  "assets/creators_png/designer1.jpg",
  "assets/creators_png/lawyer1_7.jpg",
  "assets/creators_png/lawyer2_7.jpg",
  "assets/creators_png/lawyer3.jpg"
];

//our team popup titles
final List<String> itemTitle = [
  "Апп Хөгжүүлэгч",
  "Апп Хөгжүүлэгч",
  "Дизайнэр",
  "Хуульч, Өмгөөлөгч",
  "Хуульч, Өмгөөлөгч",
  "Эрх зүйч"
];

//our team popup descriptions
final List<String> itemDesc = [
  "\"Senior Developer\"",
  "\"Junior Developer\"",
  "\"Lead Designer\"",
  "\"Үүсгэн байгуулагч\"",
  "\"ULF Partner\"",
  "\"Туслах\""
];

//our team popup bottom container with names
final List<String> itemBtn = [
  "С.Батцэнгэл",
  "Б.Тэмүүлэн",
  "Б.Батзориг",
  "Э.Амархүү",
  "П.Ундрах-Эрдэнэ",
  "Х.Отгонтогтох",
];
