import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_1/custom_functions/home_carousel.dart';
import 'package:project_1/custom_functions/home_table.dart';
import 'package:project_1/custom_functions/team_carousel_items.dart';

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: maxWidth,
              height: maxHeight * 0.32,
              //advertisement carousel of home page
              child: HomeCarousel(),
            ),
            // Title of Project Team
            Text("Төслийн БАГ".toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff23233c),
                  fontSize: MediaQuery.of(context).size.height * 0.026,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
            // Project Team section
            Container(
              width: maxWidth,
              height: maxHeight * 0.17,
              child: TeamCarousel(),
            ),
            //Content Table (Links, Association)
            HomeContainer(),
          ],
        ),
      ),
    );
  }
}
