import 'dart:ui';

import 'package:flutter/material.dart';

//civil case popup
// ignore: must_be_immutable
class ConflictTemplate extends StatefulWidget {
  String title;

  ConflictTemplate({Key key, this.title}) : super(key: key);

  @override
  _ConflictTemplateState createState() => _ConflictTemplateState();
}

class _ConflictTemplateState extends State<ConflictTemplate> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //blurred background
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(child: Image.asset("assets/images/ZurchilSxem.png", fit: BoxFit.fill)),
          Positioned(
            right: 15.0,
            top: 30.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white.withOpacity(0.6),
                ),
                child: Icon(
                  Icons.close,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
