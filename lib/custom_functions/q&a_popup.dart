import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// More Section Q&A popups template
class QuestionBox extends StatefulWidget {
  String question, answer, text;

  QuestionBox({Key key, this.question, this.answer, this.text})
      : super(key: key);

  @override
  _QuestionBoxState createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {
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
        //container of contents
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
            // removes overflow, makes scrollable widget
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // separate padding
                  SizedBox(
                    height: 50,
                  ),
                  // Question of Q&A
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        //gets value in data.dart
                        widget.question,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xff23233c),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // separate padding
                  SizedBox(
                    height: 15,
                  ),
                  // Answer of Q&A
                  Align(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: Text(
                        //gets value in data.dart
                        widget.answer,
                        style: TextStyle(fontSize: 14, height: 2),
                        textAlign: TextAlign.justify,
                      ),
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
      ],
    );
  }
}
