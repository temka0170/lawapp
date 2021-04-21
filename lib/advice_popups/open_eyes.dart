import 'dart:ui';
import 'package:flutter/material.dart';
import 'phone_items.dart';

//Open your eyes Movement section
// ignore: must_be_immutable
class EyeBox extends StatefulWidget {
  String title;

  EyeBox({Key key, this.title}) : super(key: key);

  @override
  _EyeBoxState createState() => _EyeBoxState();
}

class _EyeBoxState extends State<EyeBox> {
  ScrollController _controller = new ScrollController();
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
    double height = MediaQuery.of(context).size.height;
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
                    PhoneItems(number: "102", title: "ЦАГДААГИЙН ШУУРХАЙ ДУУДЛАГА, МЭДЭЭЛЭЛ АВАХ УТАС\n",),
                    PhoneItems(number: "107", title: "ГЭР БҮЛИЙН ХҮЧИРХИЙЛЛИЙН ДУУДЛАГА, МЭДЭЭЛЭЛ АВАХ УТАС\n",),
                    PhoneItems(number: "108", title: "ХҮҮХДИЙН ТУСЛАМЖИЙН УТАС\n",),
                    PhoneItems(number: "+97696490505", title: "24/7 ХҮЧИРХИЙЛЛИЙН ЭСРЭГ ЗӨВЛӨГӨӨ\n",),
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
