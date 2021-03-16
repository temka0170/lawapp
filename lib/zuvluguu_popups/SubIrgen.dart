import 'dart:ui';

import 'package:flutter/material.dart';
import 'IrgenHereg_Sub/3rdInvolve.dart';
import 'IrgenHereg_Sub/Ewleruuleh.dart';
import 'IrgenHereg_Sub/Hariutsagch.dart';
import 'IrgenHereg_Sub/Nehemjlel.dart';
// import 'boxRow_buttons.dart';

//civil case popup
// ignore: must_be_immutable
class SubIrgenBox extends StatefulWidget {
  String title;

  SubIrgenBox({Key key, this.title}) : super(key: key);

  @override
  _SubIrgenBoxState createState() => _SubIrgenBoxState();
}

class _SubIrgenBoxState extends State<SubIrgenBox> {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            //links popups to its button
                            return IrgenBox(
                              title: "Гуравдагч Этгээд",
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Text("Гуравдагч Этгээд"),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            //links popups to its button
                            return EBox(
                              title: "Эвлэрүүлэн Зуучлах",
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Text("Эвлэрүүлэн Зуучлах"),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            //links popups to its button
                            return HBox(
                              title: "Хариуцагч",
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Text("Хариуцагч"),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            //links popups to its button
                            return NBox(
                              title: "Нэхэмжлэгч",
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Text("Нэхэмжлэгч"),
                        ),
                      ),
                    ),
                  ),
                ),
                // BoxRow(
                //   index1: 0,
                //   index2: 1,
                //   desc1: "Гуравдагч Этгээд",
                //   desc2: "Нэхэмжлэгч",
                //   img1: "assets/images/ajilsanjil.png",
                //   img2: "assets/images/fired.png",
                // ),
                // BoxRow(
                //   index1: 2,
                //   index2: 3,
                //   desc1: "Хариуцагч",
                //   desc2: "Эвлэрүүлэн зуучлал",
                //   img1: "assets/images/care.png",
                //   img2: "assets/images/danger.png",
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
