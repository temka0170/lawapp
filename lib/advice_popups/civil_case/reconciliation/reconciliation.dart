import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_1/custom_functions/data.dart';
import '../../menu_items.dart';
import 'reconcile_roadmap.dart';
import '../../advice_popup.dart';
import 'applicant.dart';
import 'guest.dart';
// import 'boxRow_buttons.dart';

//civil case popup
// ignore: must_be_immutable
class Reconciliation extends StatefulWidget {
  String title;

  Reconciliation({Key key, this.title}) : super(key: key);

  @override
  _ESState createState() => _ESState();
}

class _ESState extends State<Reconciliation> {
  List<AdvicePopup> morepopups = <AdvicePopup>[];

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    morepopups = moreSubPopups();
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
    ScrollController _controller = new ScrollController();
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
            child: Scrollbar(
              thickness: 8.0,
              isAlwaysShown: true,
              controller: _controller,
              radius: Radius.circular(4.0),
              child: SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: <Widget>[
                    MenuItems(
                      popup: Applicant(title: "Өргөдөл Гаргагч"),
                      title: "Өргөдөл Гаргагч",
                      img: "assets/Icons/UrgudulGargagch.png",
                    ),
                    MenuItems(
                      popup: Guest(title: "Уригдагч тал"),
                      title: "Уригдагч тал",
                      img: "assets/Icons/Urigdagch.png",
                    ),
                    MenuItems(
                      popup: ReconcileTemplate(title: "ТАЙЛБАР ЗУРАГ"),
                      title: "ТАЙЛБАР ЗУРАГ",
                      img: "assets/Icons/Sxem.png",
                    ),
                    MenuItems(
                      popup: morepopups[39],
                      title: "Эвлэрлийн гэрээ",
                      img: "assets/Icons/EwlerliinGeree.png",
                    ),
                    MenuItems(
                      popup: morepopups[38],
                      title: "Гэрээний гүйцэтгэл хангах",
                      img: "assets/Icons/EwlerliinGereeGuitsetgeh.png",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
