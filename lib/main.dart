import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';
import 'home.dart';
import 'more.dart';
import 'onboard.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardSc(), //loading screen/onboarding screen
      debugShowCheckedModeBanner: false,
    );
  }
}

// pages
final List<Widget> _tabItems = [
  MyHome(),
  CalculatorPage(),
  More(),
];

//bottom navigation bar iin background color
Color _activeclr = Color(0xffffffff);
Color _inactclr = Color(0xfff78c1e);

//bottom navigation bar iin default page, default page n CalculatorPage
int _activePage = 1;

class Main extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Main> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabItems[_activePage],
      bottomNavigationBar: CurvedNavigationBar(
        height: 75.0,
        color: Color(0xffffffff),
        backgroundColor: Color(0xfff4f5fa),
        buttonBackgroundColor: Color(0xfff78c1e),
        index: 1,
        animationDuration: Duration(milliseconds: 1400),
        animationCurve: Curves.linearToEaseOut,
        items: <Widget>[
          Icon(
            Icons.home_rounded,
            size: 40.0,
            color: _activePage == 0 ? _activeclr : _inactclr,
          ),
          Icon(
            Icons.calculate_outlined,
            size: 38,
            color: _activePage == 1 ? _activeclr : _inactclr,
          ),
          Icon(
            Icons.help_outline,
            size: 38,
            color: _activePage == 2 ? _activeclr : _inactclr,
          ),
        ],
        onTap: (index) {
          setState(() {
            _activePage = index;
          });
        },
      ),
    );
  }
}
