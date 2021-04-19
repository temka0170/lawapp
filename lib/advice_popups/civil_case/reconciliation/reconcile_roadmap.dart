import 'dart:ui';
import 'package:flutter/material.dart';

//civil case popup
// ignore: must_be_immutable
class ReconcileTemplate extends StatefulWidget {
  String title;

  ReconcileTemplate({Key key, this.title}) : super(key: key);

  @override
  _ReconcileTemplateState createState() => _ReconcileTemplateState();
}

class _ReconcileTemplateState extends State<ReconcileTemplate> {
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
          Image.asset("assets/images/Ewleruuleh-Sxem.png", fit: BoxFit.fill),
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
