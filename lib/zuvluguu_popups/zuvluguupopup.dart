import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../custom_func_data/data.dart';

//2dah popup (sub popup) iin row buyu 2 container
// ignore: must_be_immutable
class BoxRow extends StatefulWidget {
  String desc1, desc2;
  String img1, img2;
  int index1, index2;
  BoxRow({
    Key key,
    this.desc1,
    this.desc2,
    this.img1,
    this.img2,
    this.index1,
    this.index2,
  }) : super(key: key);

  @override
  _BoxRowState createState() => _BoxRowState();
}

class _BoxRowState extends State<BoxRow> {
  List<ZuvluguuPopup> morepopups = new List<ZuvluguuPopup>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    morepopups = morePopups();
  }

  @override
  Widget build(BuildContext context) {
    double popwidth = MediaQuery.of(context).size.width * 0.88;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          widget.index1 != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return morepopups[widget.index1];
                          });
                    },
                    child: Container(
                      width: popwidth * 0.39,
                      height: popwidth * 0.38,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(0, 10),
                            blurRadius: 20,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                widget.img1,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              widget.desc1,
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff23233c),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
          widget.index2 != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return morepopups[widget.index2];
                          });
                    },
                    child: Container(
                      width: popwidth * 0.39,
                      height: popwidth * 0.38,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(0, 10),
                            blurRadius: 20,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset(
                                widget.img2,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              widget.desc2,
                              style: TextStyle(
                                fontFamily: 'RobotoMono',
                                color: Color(0xff23233c),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

//zuvluguu popup (sub popup)
// ignore: must_be_immutable
class ZuvluguuPopup extends StatefulWidget {
  String title, descriptions, text;

  ZuvluguuPopup({Key key, this.title, this.descriptions, this.text})
      : super(key: key);

  @override
  _ZuvluguuState createState() => _ZuvluguuState();
}

class _ZuvluguuState extends State<ZuvluguuPopup> {
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            top: 0.0,
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
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.88,
              height: MediaQuery.of(context).size.height * 0.68,
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
                      SizedBox(
                        height: 29,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            //utgaa data.dart deer awna
                            widget.title,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xff23233c),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        child: Text(
                          //utgaa data.dart deer awna
                          widget.descriptions,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
