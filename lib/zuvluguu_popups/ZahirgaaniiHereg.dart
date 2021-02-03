import 'dart:ui';

import 'package:flutter/material.dart';
import 'boxRow_buttons.dart';

//administrative case popup
// ignore: must_be_immutable
class ZahirgaaBox extends StatefulWidget {
  String title;

  ZahirgaaBox({Key key, this.title}) : super(key: key);

  @override
  _ZahirgaaBoxState createState() => _ZahirgaaBoxState();
}

class _ZahirgaaBoxState extends State<ZahirgaaBox> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //lurred background
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
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 30.0,
            height: 30.0,
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
            height: 555,
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
            child: ListView(
              padding: EdgeInsets.only(top: 23.0),
              itemExtent: 120.0,
              children: <Widget>[
                //index value links to what popup should show when clicked,
                //boxrow has 2 buttons in 1 row so it requires atleast index1,desc1,img1
                //if index2,desc2,img2 is null shows only 1 button with index1 values
                BoxRow(
                  index1: 20,
                  index2: 21,
                  desc1: "Газрын маргаан",
                  desc2: "Татварын маргаан",
                  img1: "assets/images/galaxy.jpg",
                  img2: "assets/images/galaxy.jpg",
                ),
                BoxRow(
                  index1: 22,
                  index2: 23,
                  desc1: "Тендерийн маргаан",
                  desc2: "Төрийн албаны маргаан",
                  img1: "assets/images/galaxy.jpg",
                  img2: "assets/images/galaxy.jpg",
                ),
                BoxRow(
                  index1: 24,
                  desc1: "Улсын бүртгэлийн маргаан",
                  img1: "assets/images/galaxy.jpg",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
