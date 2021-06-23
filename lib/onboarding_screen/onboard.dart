import 'package:flutter/material.dart';
import 'dart:async';

import 'package:project_1/main.dart';

//Splashscreen of the app
class OnboardingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
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

  //timer of transition to main page
  startTimer() async {
    var duration = Duration(milliseconds: 2000);
    return Timer(duration, route);
  }

  //path to main page
  route() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                  flex: 2,
                  child: Image.asset(
                    "assets/images/umbrella_logo.jpg",
                    fit: BoxFit.contain,
                  )),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Pro Bono Application".toUpperCase(),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "UMBRELLA\nCENTER",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 1.0,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "UMBRELLA\nLAW FIRM",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                  flex: 2,
                  child: Image.asset(
                    "assets/images/lawfirmlogo.png",
                    fit: BoxFit.contain,
                  )),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
