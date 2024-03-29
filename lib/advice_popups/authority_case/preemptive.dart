import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_1/custom_functions/data.dart';
import '../menu_items.dart';
import '../advice_popup.dart';

/*This file shows sub directory for authority case*/
// ignore: must_be_immutable
class Preemptive extends StatefulWidget {
  String title;

  Preemptive({Key key, this.title}) : super(key: key);

  @override
  _PreemptiveState createState() => _PreemptiveState();
}

class _PreemptiveState extends State<Preemptive> {
  List<AdvicePopup> morepopups = <AdvicePopup>[];

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    morepopups = moreSubPopups(); //gets popup values from data.dart
  }

  @override
  Widget build(BuildContext context) {
    //blurred background
    return BackdropFilter(
      filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        //popup made by Dialog widget
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), //rounded container
        ),
        elevation: 0,
        backgroundColor: Colors.transparent, //blurred background
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
        //items of popup
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
                    popup: morepopups[77],
                    title: "УРЬДЧИЛАН ШИЙДВЭРЛЭХ АЖИЛЛАГАА ГЭЖ",
                    img: "assets/Icons/UridchlanShiidwerleh.png",
                  ),
                  MenuItems(
                    popup: morepopups[78],
                    title: "ХУГАЦАА",
                    img: "assets/Icons/Hugatsaa.png",
                  ),
                  MenuItems(
                    popup: morepopups[79],
                    title: "ХЯНАН ШИЙДВЭРЛЭХ БАЙГУУЛЛАГА",
                    img: "assets/Icons/Zagwar.png",
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
