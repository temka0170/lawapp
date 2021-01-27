import 'package:flutter/material.dart';
import 'dart:async';
import 'ThirdScr.dart';

//splash screen 2doh zurag
class SecondScr extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondState();
  }
}

class SecondState extends State<SecondScr> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  @override
  void initState() {
    super.initState();
    startTimer();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = Tween(
      begin: 0.1,
      end: 1.0,
    ).animate(_controller);
  }

  startTimer() async {
    var duration = Duration(milliseconds: 1500);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ThirdScr()));
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FittedBox(
          child: Image.asset("assets/splashscreen/start2.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
