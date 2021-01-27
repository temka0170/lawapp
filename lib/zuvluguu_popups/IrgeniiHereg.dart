import 'dart:ui';

import 'package:flutter/material.dart';
import 'zuvluguupopup.dart';

//irgenii hereg popup tses
// ignore: must_be_immutable
class IrgenBox extends StatefulWidget {
  String title;

  IrgenBox({Key key, this.title}) : super(key: key);

  @override
  _IrgenBoxState createState() => _IrgenBoxState();
}

class _IrgenBoxState extends State<IrgenBox> {
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
                  index1: 0,
                  index2: 1,
                  desc1: "Ажилласан жил тогтоолгох тухай",
                  desc2: "Ажлаас халагдсан",
                  img1: "assets/images/ajilsanjil.png",
                  img2: "assets/images/fired.png",
                ),
                BoxRow(
                  index1: 2,
                  index2: 3,
                  desc1: "Асран хамгаалагчаар тогтоолгох тухай",
                  desc2: "Гэм хор",
                  img1: "assets/images/care.png",
                  img2: "assets/images/danger.png",
                ),
                BoxRow(
                  index1: 4,
                  index2: 5,
                  desc1: "Гэрлэлт цуцлуулах тухай",
                  desc2: "Гэрээний дагуу авлага",
                  img1: "assets/images/lostmarrige.png",
                  img2: "assets/images/loan.png",
                ),
                BoxRow(
                  index1: 6,
                  index2: 7,
                  desc1: "Зээлийн гэрээний авлага",
                  desc2: "ИРГЭНИЙ НЭХЭМЖЛЭЛИЙН ШААРДЛАГА",
                  img1: "assets/images/contr.png",
                  img2: "assets/images/nehemj.png",
                ),
                BoxRow(
                  index1: 8,
                  index2: 9,
                  desc1: "Нас тогтоолгох тухай",
                  desc2: "Нөхөн олговор гаргуулах тухай",
                  img1: "assets/images/age.png",
                  img2: "assets/images/olgovor.png",
                ),
                BoxRow(
                  index1: 10,
                  index2: 11,
                  desc1: "Орон сууцны өмчлөгчөөр тогтоолгох тухай",
                  desc2: "Хамтын амьдралтай байсныг тогтоолгох",
                  img1: "assets/images/galaxy.jpg",
                  img2: "assets/images/galaxy.jpg",
                ),
                BoxRow(
                  index1: 12,
                  index2: 13,
                  desc1: "Хариуцагчийг эрэн сурвалжлуулах",
                  desc2: "Хүүхдийн тэтгэлэг тогтоолгох",
                  img1: "assets/images/galaxy.jpg",
                  img2: "assets/images/galaxy.jpg",
                ),
                BoxRow(
                  index1: 14,
                  index2: 15,
                  desc1: "Эвлэрүүлэн зуучлал",
                  desc2: "Эрх хязгаарлах арга хэмжээ авахуулах тухай",
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
