import 'dart:ui';
import 'package:flutter/material.dart';
import 'DistrictsLocation/BGD.dart';
import 'DistrictsLocation/BZD.dart';
import 'DistrictsLocation/CD.dart';
import 'DistrictsLocation/HUD.dart';
import 'DistrictsLocation/SBD.dart';
import 'DistrictsLocation/SHD.dart';
import 'DistrictsLocation/Bagahangai.dart';
import 'DistrictsLocation/Baganuur.dart';
import 'DistrictsLocation/Nalaih.dart';
import 'menu_items.dart';
// import 'boxRow_buttons.dart';

//civil case popup
// ignore: must_be_immutable
class LocationBox extends StatefulWidget {
  String title;

  LocationBox({Key key, this.title}) : super(key: key);

  @override
  _LocationBoxState createState() => _LocationBoxState();
}

class _LocationBoxState extends State<LocationBox> {
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
                  MenuItems(
                    popup: BGDBox(title: "Баянгол Дүүрэг"),
                    title: "Баянгол Дүүрэг",
                    img: "assets/Icons/Bairshil.png",
                  ),
                  MenuItems(
                    popup: BZDBox(title: "Баянзүрх Дүүрэг"),
                    title: "Баянзүрх Дүүрэг",
                    img: "assets/Icons/Bairshil.png",
                  ),
                  MenuItems(
                    popup: CDBox(title: "Чингэлтэй Дүүрэг"),
                    title: "Чингэлтэй Дүүрэг",
                    img: "assets/Icons/Bairshil.png",
                  ),
                  MenuItems(
                    popup: HUDBox(title: "Хан-Уул Дүүрэг"),
                    title: "Хан-Уул Дүүрэг",
                    img: "assets/Icons/Bairshil.png",
                  ),
                  MenuItems(
                    popup: SBDBox(title: "Сүхбаатар Дүүрэг"),
                    title: "Сүхбаатар Дүүрэг",
                    img: "assets/Icons/Bairshil.png",
                  ),
                  MenuItems(
                    popup: SHDBox(title: "Сонгино Хайрхан Дүүрэг"),
                    title: "Сонгино Хайрхан Дүүрэг",
                    img: "assets/Icons/Bairshil.png",
                  ),
                  MenuItems(
                    popup: NALBox(title: "Налайх Дүүрэг"),
                    title: "Налайх Дүүрэг",
                    img: "assets/Icons/Bairshil.png",
                  ),
                  MenuItems(
                    popup: BHBox(title: "Багахангай"),
                    title: "Багахангай",
                    img: "assets/Icons/Bairshil.png",
                  ),
                  MenuItems(
                    popup: BGBox(title: "Багануур"),
                    title: "Багануур",
                    img: "assets/Icons/Bairshil.png",
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
