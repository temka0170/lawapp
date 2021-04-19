import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_1/advice_popups/authority_case/court_rights.dart';

import '../menu_items.dart';
import 'claim_template.dart';

/*This file is sub directory of authority case
* shows court cases*/
// ignore: must_be_immutable
class CourtBox extends StatefulWidget {
  String title;

  CourtBox({Key key, this.title}) : super(key: key);

  @override
  _CourtBoxState createState() => _CourtBoxState();
}

class _CourtBoxState extends State<CourtBox> {
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
      child: Dialog(//Popup made by Dialog widget
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),//rounded container
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,//blurred background
        child: contentBox(context),
      ),
    );
  }

  //contents of container
  contentBox(context) {
    ScrollController _controller = new ScrollController();
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        //back button
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
        //title of popup
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
        //items of container
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
                  MenuItems(
                    popup: Claim(title: "НЭХЭМЖЛЭЛИЙН ЗАГВАР"),
                    title: "НЭХЭМЖЛЭЛИЙН ЗАГВАР",
                    img: "assets/Icons/Zagwar.png",
                  ),
                  MenuItems(
                    popup: CourtRight(title: "ТАНЫ ЭРХ, ҮҮРЭГ"),
                    title: "ТАНЫ ЭРХ, ҮҮРЭГ",
                    img: "assets/Icons/taniiEG.png",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
