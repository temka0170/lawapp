// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:project_1/main.dart';
//
// //Splashscreen of the app
// class OnboardingScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return StartState();
//   }
// }
//
// class StartState extends State<OnboardingScreen>
//     with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   Animation _animation;
//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 800),
//     );
//     _animation = Tween(
//       begin: 0.1,
//       end: 1.0,
//     ).animate(_controller);
//   }
//   //timer of transition to main page
//   startTimer() async {
//     var duration = Duration(milliseconds: 2000);
//     return Timer(duration, route);
//   }
//   //path to main page
//   route() {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _controller.forward();
//     return FadeTransition(
//       opacity: _animation,
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: FittedBox(
//           child: Image.asset("assets/splashscreen/start3.png"),
//           fit: BoxFit.fill,
//         ),
//       ),
//     );
//   }
// }
