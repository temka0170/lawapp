import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_1/advice_popups/location_items.dart';

import '../menu_items.dart';
// import 'boxRow_buttons.dart';

//civil case popup
// ignore: must_be_immutable
class HUDBox extends StatefulWidget {
  String title;

  HUDBox({Key key, this.title}) : super(key: key);

  @override
  _HUDBoxState createState() => _HUDBoxState();
}

class _HUDBoxState extends State<HUDBox> {
  ScrollController _controller = new ScrollController();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //blurred background
    return BackdropFilter(
      filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: height * 0.04,
            height: height * 0.04,
            decoration: new BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Color(0x14000000),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 0)
              ],
            ),
            child: IconButton(
              iconSize: 12,
              color: Color(0xff23233c),
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text(widget.title,
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  color: Color(0xffeceae9),
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 37.0),
          child: Container(
            height: height * 0.69,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              color: Color(0xfffff4e8).withOpacity(0.88),
              boxShadow: [
                BoxShadow(
                  color: Color(0x33000000),
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: <Widget>[
                  LocationItems(url: "https://goo.gl/maps/TrZzRt2Zn4nikiM9A", title: "ХУД-ийн Цагдаагийн 1-р Хэлтэс\nХариуцах Хороод: 1,2,3,11,15"),
                  LocationItems(url: "https://www.google.com/maps/@47.8654273,106.811621,3a,24.8y,331.52h,90.25t/data=!3m6!1e1!3m4!1s3Q2fPTXPBZ7jm7hprom2lg!2e0!7i13312!8i6656", title: "ХУД-ийн Цагдаагийн 2-р Хэлтэс\nХариуцах Хороод: 4,5,6,7,8,9,10,12,13,14,16"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}