import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_1/advice_popups/districts_phone/phone_nalaih.dart';
import 'districts_phone/phone_bayngol.dart';
import 'districts_phone/phone_baynzurh.dart';
import 'districts_phone/phone_chingeltei.dart';
import 'districts_phone/phone_han_uul.dart';
import 'districts_phone/phone_suh_baatar.dart';
import 'districts_phone/phone_songino_hairhan.dart';
import 'districts_phone/phone_bagahangai.dart';
import 'districts_phone/phone_baganuur.dart';
import 'menu_items.dart';

// Phone call button template
// ignore: must_be_immutable
class CallBox extends StatefulWidget {
  String title;

  CallBox({Key key, this.title}) : super(key: key);

  @override
  _CallBoxState createState() => _CallBoxState();
}

class _CallBoxState extends State<CallBox> {
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
      child: Dialog(// popup widget
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }
  // container of popup
  contentBox(context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        // back button
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
        // title of the popup
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
                ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // container of contents
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
            // longer contents are scrollable
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: <Widget>[
                  // popups
                  MenuItems(
                    popup: PBGDBox(title: "Баянгол Дүүрэг".toUpperCase()),
                    title: "Баянгол Дүүрэг",
                    img: "assets/Icons/phone.png",
                  ),
                  MenuItems(
                    popup: PBZDBox(title: "Баянзүрх Дүүрэг".toUpperCase()),
                    title: "Баянзүрх Дүүрэг",
                    img: "assets/Icons/phone.png",
                  ),
                  MenuItems(
                    popup: PCDBox(title: "Чингэлтэй Дүүрэг".toUpperCase()),
                    title: "Чингэлтэй Дүүрэг",
                    img: "assets/Icons/phone.png",
                  ),
                  MenuItems(
                    popup: PHUDBox(title: "Хан-Уул Дүүрэг".toUpperCase()),
                    title: "Хан-Уул Дүүрэг",
                    img: "assets/Icons/phone.png",
                  ),
                  MenuItems(
                    popup: PSBDBox(title: "Сүхбаатар Дүүрэг".toUpperCase()),
                    title: "Сүхбаатар Дүүрэг",
                    img: "assets/Icons/phone.png",
                  ),
                  MenuItems(
                    popup: PSHDBox(title: "Сонгино Хайрхан Дүүрэг".toUpperCase()),
                    title: "Сонгино Хайрхан Дүүрэг",
                    img: "assets/Icons/phone.png",
                  ),
                  MenuItems(
                    popup: PNALBox(title: "Налайх Дүүрэг".toUpperCase()),
                    title: "Налайх Дүүрэг",
                    img: "assets/Icons/phone.png",
                  ),
                  MenuItems(
                    popup: PBHBox(title: "Багахангай Дүүрэг".toUpperCase()),
                    title: "Багахангай Дүүрэг",
                    img: "assets/Icons/phone.png",
                  ),
                  MenuItems(
                    popup: PBGBox(title: "Багануур Дүүрэг".toUpperCase()),
                    title: "Багануур Дүүрэг",
                    img: "assets/Icons/phone.png",
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
