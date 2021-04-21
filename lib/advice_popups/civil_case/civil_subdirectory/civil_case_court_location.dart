import 'dart:ui';
import 'package:flutter/material.dart';
import '../../location_items.dart';

//civil case popup
// ignore: must_be_immutable
class CivilCourtLocationBox extends StatefulWidget {
  String title;

  CivilCourtLocationBox({Key key, this.title}) : super(key: key);

  @override
  _CivilCourtLocationBoxState createState() => _CivilCourtLocationBoxState();
}

class _CivilCourtLocationBoxState extends State<CivilCourtLocationBox> {
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
                  LocationItems(title: "БГД Иргэний хэргийн шүүх", url: "https://goo.gl/maps/9DFe7sJA9yAaKrnQ7",),
                  LocationItems(title: "БЗД Иргэний хэргийн шүүх", url: "https://goo.gl/maps/gp2a8Gr86FEMDC6e8",),
                  LocationItems(title: "СБД Иргэний хэргийн шүүх", url: "https://goo.gl/maps/KTzLqgNyqJAYneMy9",),
                  LocationItems(title: "СХД Иргэний хэргийн шүүх", url: "https://goo.gl/maps/7YBeYo47cZFe845HA",),
                  LocationItems(title: "ХУД Иргэний хэргийн шүүх", url: "https://goo.gl/maps/gD3cNTHU4jJwMWTs6",),
                  LocationItems(title: "ЧД Иргэний хэргийн шүүх", url: "https://goo.gl/maps/KTzLqgNyqJAYneMy9",),
                  LocationItems(title: "Багахангай Иргэний хэргийн шүүх", url: "https://goo.gl/maps/TJKHH9cQ4Amr93dJ8",),
                  LocationItems(title: "Багануур дүүргийн  Иргэний хэргийн шүүх", url: "https://goo.gl/maps/rMZqspRptgtpzEJL7",),
                  LocationItems(title: "Налайх дүүргийн Иргэний хэргийн шүүх", url: "https://goo.gl/maps/TJKHH9cQ4Amr93dJ8",),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}