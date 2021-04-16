import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

//Popup function when clicked on Submit of TextFormField in calculator.dart
// ignore: must_be_immutable
class CalcPopup extends StatefulWidget {
  String prc;
  CalcPopup({Key key, this.prc}) : super(key: key);
  @override
  _CalcPopState createState() => _CalcPopState();
}

class _CalcPopState extends State<CalcPopup> {
  @override
  Widget build(BuildContext context) {
    //blurring background of popup
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

//contents of the popup
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
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.88,
            height: MediaQuery.of(context).size.height * 0.17,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 10),
                        blurRadius: 10),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        "Таны Төлөх дүн",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xff23233c),
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.prc != null ? widget.prc + '₮' : "0" + '₮',
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff23233c),
                          fontSize: MediaQuery.of(context).size.height * 0.069,
                          fontWeight: FontWeight.w200,
                          fontStyle: FontStyle.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    height: 49.0,
                    decoration: BoxDecoration(
                      color: Color(0xffe8e8e8).withOpacity(0.7200000286102295),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () =>
                            launch('https://itax.mta.mn/home/receiptCreate'),
                        child: Text(
                          "ТӨЛӨХ",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xfff9931f),
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    height: 49.0,
                    decoration: new BoxDecoration(
                        color: Color(0xfff9931f),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                              new ClipboardData(text: widget.prc));
                          Navigator.pop(context);
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(milliseconds: 1200),
                                    () {
                                  Navigator.of(context).pop(true);
                                });
                                return AlertDialog(
                                  title: Text(
                                    "Амжилттай хууллаа!",
                                    style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 16.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  backgroundColor: Color(0xfff78c1e),
                                );
                              });
                        },
                        child: Text(
                          "ХУУЛАХ",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xffffffff),
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height * 0.41,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 10),
                            blurRadius: 10),
                      ]),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, left: 10.0),
                            child: Text(
                              "\n0-130 000\t4550 төгрөг.\n\n130 001-650 000\t4550 төгрөг дээр 130 000 төгрөгөөс давсан дүнгийн 3 хувийг нэмнэ.\n\n650 001-1 300 000\t20150 төгрөг дээр 650 000 төгрөгөөс давсан дүнгийн 2.4 хувийг нэмнэ.\n\n1 300 001-13 000 000\t35750 төгрөг дээр 1 300 000 төгрөгөөс давсан дүнгийн 1.6 хувийг нэмнэ.\n\n13 000 001-ээс дээш\t222950 төгрөг дээр 13 000 000 төгрөгөөс давсан дүнгийн 0.5 хувийг нэмнэ.\n \n\n7.1.2.эд хөрөнгийн бус, түүнчлэн үнэлэх боломжгүй нэхэмжлэлд 70 200 төгрөг;\n",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color(0xff23233c),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
