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
      body: Container(
        color: Color(0xfff4f5fa),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: height * 0.31,
                  //advertisement carousel of home page
                  child: MainScreen(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text("БҮТЭЭСЭН БАГ",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff23233c),
                      fontSize: MediaQuery.of(context).size.height * 0.026,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Container(
                width: maxWidth,
                height: height * 0.18,
                child: TeamCarousel(),
              ),
              //content table of home page
              HomeContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
