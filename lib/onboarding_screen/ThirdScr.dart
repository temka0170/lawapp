import 'dart:async';

import 'package:flutter/material.dart';
import '../main.dart';

//splash screen 3dah zurag
class ThirdScr extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThirdState();
  }
}

class ThirdState extends State<ThirdScr> with SingleTickerProviderStateMixin {
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
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  startTimer() async {
    var duration = Duration(milliseconds: 1500);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
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
          child: Image.asset("assets/splashscreen/start3.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
