import 'dart:ui';
import 'package:flutter/material.dart';


// This is template for most of the sub directory dart files such as: files in authority_case, civil_case etc
//Sub Directory Template
// ignore: must_be_immutable
class HealthySociety extends StatefulWidget {
  String title;

  HealthySociety({Key key, this.title}) : super(key: key);

  @override
  _HealthySocietyState createState() => _HealthySocietyState();
}

class _HealthySocietyState extends State<HealthySociety> {
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
      filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3), // blur filter
      child: Dialog(// popup widget
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // rounded borders
        ),
        elevation: 0, // elevates popup
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
            width: height * 0.04, // takes 4% of Screen height as width
            height: height * 0.04, // takes 4% of Screen height as height
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
        // Popup Title
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
        // Container of content/info
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
                // This Whole Expanded widget is one button/item
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // OnClick function, links to next popup
                      // showDialog(
                      //     context: context,
                      //     barrierDismissible: true,
                      //     builder: (BuildContext context) {
                      //       //links to next popup
                      //       // return PlaceHolder(); // return next popup class name here
                      //     });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        // Icon and Title of the button
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // icon of button
                            Expanded(
                              flex: 2,
                              child: Image.asset(
                                "assets/Icons/ShuuhinMargaan.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            // title of button
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text("Шүүхийн Маргаан"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Next button/item
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            //links to next button
                            // return Reconciliation(
                            //   title: "Эвлэрүүлэн Зуучлах",
                            // );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.asset(
                                "assets/Icons/eZuuchlal.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text("Эвлэрүүлэн Зуучлах"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
