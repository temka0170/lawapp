import 'dart:ui';
import 'package:flutter/material.dart';
import 'call.dart';
import 'location.dart';
import 'menu_items.dart';

// Sub Location popup template
// ignore: must_be_immutable
class SubLocationBox extends StatefulWidget {
  String title;

  SubLocationBox({Key key, this.title}) : super(key: key);

  @override
  _SubLocationBoxState createState() => _SubLocationBoxState();
}

class _SubLocationBoxState extends State<SubLocationBox> {
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
            // longer contents are scrollable, removing overflow
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: <Widget>[
                  MenuItems(
                    popup: LocationBox(title: "ЦАГДААГИЙН ГАЗРЫН ХАЯГ"),
                    title: "ЦАГДААГИЙН ГАЗРЫН ХАЯГ",
                    img: "assets/Icons/Bairshil.png",
                  ),
                  MenuItems(
                    popup: CallBox(title: "ЦАГДААГИЙН ГАЗРЫН УТАС"),
                    title: "ЦАГДААГИЙН ГАЗРЫН УТАС",
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
