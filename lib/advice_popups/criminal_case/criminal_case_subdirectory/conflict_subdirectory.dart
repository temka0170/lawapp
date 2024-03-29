import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_1/custom_functions/data.dart';
import 'package:project_1/advice_popups/criminal_case/Conflict/authority_victim.dart';
import 'package:project_1/advice_popups/criminal_case/Conflict/conflict_connection.dart';
import '../../menu_items.dart';
import '../../advice_popup.dart';
import '../Conflict/conflict_roadmap.dart';

//civil case popup
// ignore: must_be_immutable
class ConflictSub extends StatefulWidget {
  String title;

  ConflictSub({Key key, this.title}) : super(key: key);

  @override
  _SZState createState() => _SZState();
}

class _SZState extends State<ConflictSub> {
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
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: <Widget>[
                  MenuItems(
                    popup: morepopups[46],
                    title: "Зөрчил шалгах субъект",
                    img: "assets/Icons/Zagwar.png",
                  ),
                  MenuItems(
                    popup:
                        ConflictConnection(title: "Холбогдогч".toUpperCase()),
                    title: "Холбогдогч",
                    img: "assets/Icons/Holbogdogch.png",
                  ),
                  MenuItems(
                    popup: AuthorityVictim(title: "Хохирогч".toUpperCase()),
                    title: "Хохирогч",
                    img: "assets/Icons/Hohirogch.png",
                  ),
                  MenuItems(
                    popup: ConflictTemplate(
                      title: "ТАЙЛБАР ЗУРАГ".toUpperCase(),
                    ),
                    title: "ТАЙЛБАР ЗУРАГ",
                    img: "assets/Icons/Sxem.png",
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
