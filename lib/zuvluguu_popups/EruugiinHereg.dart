import 'dart:ui';

import 'package:flutter/material.dart';
import 'zuvluguupopup.dart';

//Zahirgaanii hereg popup tses
// ignore: must_be_immutable
class EruuBox extends StatefulWidget {
  String title;

  EruuBox({Key key, this.title}) : super(key: key);

  @override
  _EruuBoxState createState() => _EruuBoxState();
}

class _EruuBoxState extends State<EruuBox> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //ariin font iig blur bolgoh
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
                BoxRow(
                  index1: 16,
                  index2: 17,
                  desc1:
                      "Авилгалтай тэмцэх газар, Тагнуулын байгууллагад хандах хэрэг",
                  desc2: "Гомдол гаргах цагдаагийн газруудын ХАЯГ",
                  img1: "assets/images/galaxy.jpg",
                  img2: "assets/images/galaxy.jpg",
                ),
                BoxRow(
                  index1: 18,
                  index2: 19,
                  desc1: "ХЭРЭГ ХЯНАН ШИЙДВЭРЛЭХ АЖИЛЛАГААНЫ ХУГАЦАА",
                  desc2: "Эрүү хэрэг, зөрчлийн тухай ГОМДЛЫН ЗАГВАР",
                  img1: "assets/images/galaxy.jpg",
                  img2: "assets/images/galaxy.jpg",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
