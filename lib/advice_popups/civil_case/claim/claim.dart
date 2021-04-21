import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_1/advice_popups/menu_items.dart';
import 'package:project_1/custom_functions/data.dart';
import '../../advice_popup.dart';
import '../../boxRow_buttons.dart';

//civil case popup
// ignore: must_be_immutable
class ClaimBox extends StatefulWidget {
  String title;

  ClaimBox({Key key, this.title}) : super(key: key);

  @override
  _ClaimBoxState createState() => _ClaimBoxState();
}

class _ClaimBoxState extends State<ClaimBox> {
  List<AdvicePopup> morepopups = new List<AdvicePopup>();
  ScrollController _controller = new ScrollController();

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
                    MenuItems(popup: morepopups[0], img: "assets/Icons/shTemplate.png", title: "Гэм хор",),
                    MenuItems(popup: morepopups[1], img: "assets/Icons/shTemplate.png", title: "Ажлаас халагдсан",),
                    MenuItems(popup: morepopups[2], img: "assets/Icons/shTemplate.png", title: "Орон сууцны өмчлөгчөөр тогтоолгох тухай",),
                    MenuItems(popup: morepopups[3], img: "assets/Icons/shTemplate.png", title: "Асран хамгаалагчаар тогтоолгох тухай",),
                    MenuItems(popup: morepopups[4], img: "assets/Icons/shTemplate.png", title: "Гэрлэлт цуцлуулах тухай",),
                    MenuItems(popup: morepopups[5], img: "assets/Icons/shTemplate.png", title: "Хүүхдийн тэтгэлэг тогтоолгох",),
                    MenuItems(popup: morepopups[14], img: "assets/Icons/shTemplate.png", title: "Хариуцагчийг эрэн сурвалжлуулах",),
                    MenuItems(popup: morepopups[7], img: "assets/Icons/shTemplate.png", title: "Хамтын амьдралтай байсныг тогтоолгох",),
                    MenuItems(popup: morepopups[8], img: "assets/Icons/shTemplate.png", title: "Нөхөн олговор гаргуулах тухай",),
                    MenuItems(popup: morepopups[9], img: "assets/Icons/shTemplate.png", title: "Нас тогтоолгох тухай",),
                    MenuItems(popup: morepopups[10], img: "assets/Icons/shTemplate.png", title: "Зээлийн гэрээний авлага",),
                    MenuItems(popup: morepopups[11], img: "assets/Icons/shTemplate.png", title: "Ажилласан жил тогтоолгох тухай",),
                    MenuItems(popup: morepopups[12], img: "assets/Icons/shTemplate.png", title: "Гэрээний дагуу авлага",),
                    MenuItems(popup: morepopups[15], img: "assets/Icons/shTemplate.png", title: "Эрх хязгаарлах арга хэмжээ авахуулах тухай",),
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
