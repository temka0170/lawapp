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
    double height = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: height * 0.31,
                    //advertisement carousel of home page
                    child: HomeCarousel(),
                  ),
                ),
                // Title of Project Team
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text("Төслийн БАГ".toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff23233c),
                        fontSize: MediaQuery.of(context).size.height * 0.026,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                // Project Team section
                Container(
                  width: maxWidth,
                  height: height * 0.18,
                  child: TeamCarousel(),
                ),
                //Content Table (Links, Association)
                HomeContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
