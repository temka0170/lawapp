import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_1/zuvluguu_popups/LocationItems.dart';

import '../MenuItems.dart';
// import 'boxRow_buttons.dart';

//civil case popup
// ignore: must_be_immutable
class SHDBox extends StatefulWidget {
  String title;

  SHDBox({Key key, this.title}) : super(key: key);

  @override
  _SHDBoxState createState() => _SHDBoxState();
}

class _SHDBoxState extends State<SHDBox> {
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
                  LocationItems(url: "https://goo.gl/maps/amyBaAnJXLY2ugBC6", title: "СХД-ийн Цагдаагийн 1-р Хэлтэс\nХариуцах Хороод: 1,2,3,4,5,18,19,20,21,22,26,27,32"),
                  LocationItems(url: "https://goo.gl/maps/e41tK9wMCXk9XEgJ7", title: "СХД-ийн Цагдаагийн 2-р Хэлтэс\nХариуцах Хороод: 6,7,8,9,10,11,24,25,28"),
                  LocationItems(url: "https://goo.gl/maps/U4qPvsibv7Tqvc9T7", title: "СХД-ийн Цагдаагийн 3-р Хэлтэс\nХариуцах Хороод: 12,13,14,15,16,17,23,29,30,31"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}