import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Advertisement carousel Popup structure/template
// ignore: must_be_immutable
class AdvertisementPopup extends StatefulWidget {
  String title, descriptions, text, url;
  Image img;

  AdvertisementPopup(
      {Key key, this.title, this.descriptions, this.text, this.img, this.url})
      : super(key: key);

  @override
  _AdvertisementPopupState createState() => _AdvertisementPopupState();
}

class _AdvertisementPopupState extends State<AdvertisementPopup> {

  @override
  Widget build(BuildContext context) {
    //blurred background
    return BackdropFilter(
      filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(// popup widget
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }
  //container of popup
  contentBox(context) {
    return Stack(
      children: <Widget>[
        // back button
        Positioned(
          right: 0.0,
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
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        // container of contents
        Padding(
          padding: const EdgeInsets.only(top: 100.0, bottom: 99.0),
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
                // separate vertical padding
                SizedBox(
                  height: 50,
                ),
                // title of the popup
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                        //gets values in data.dart
                        widget.title,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xff23233c),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                // separate vertical padding
                SizedBox(
                  height: 15,
                ),
                // content of popup
                Text(
                  //gets value in data.dart
                  widget.descriptions,
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 22,
                ),
              ],
            ),
          ),
        ),
        // image of the advertisement nested to popup
        Padding(
          padding: EdgeInsets.only(left: 28.0, top: 30),
          child: Container(
            width: 142.0,
            height: 113.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Color(0x4d000000),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 0)
              ],
              border: Border.all(
                  width: 3.0,
                  color: Color(0xffffffff),
                  style: BorderStyle.solid),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FittedBox(
                //gets value in data.dart
                child: widget.img,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
