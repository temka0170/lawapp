import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_1/onboarding_screen/onboard.dart';
import 'navigating_pages/calculator.dart';
import 'navigating_pages/home.dart';
import 'navigating_pages/more.dart';

void main() => runApp(MyApp());

// This is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(), //loading screen/onboarding screen
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

//background colors of curved nav bar
Color _activeclr = Color(0xffffffff);
Color _inactclr = Color(0xfff78c1e);

//curved nav bar default page, default is Calculator page
int _activePage = 1;
int _history;

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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: _tabItems[_activePage],
        bottomNavigationBar: CurvedNavigationBar(
          height: 75,
          color: Color(0xffffffff),
          backgroundColor: Color(0xfff4f5fa),
          buttonBackgroundColor: Colors.transparent,
          index: 1,
          animationDuration: Duration(milliseconds: 1200),
          animationCurve: Curves.linearToEaseOut,
          items: <Widget>[
            Container(
              decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: _activePage == 0 ? LinearGradient(
            colors: [
              Color.fromRGBO(241, 103, 48, 1.0),
              Color.fromRGBO(249, 167, 25, 1.0)
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ) : LinearGradient(
            colors: [
              Color(0xffffffff),
              Color(0xffffffff),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.home,
                  size: 40.0,
                  color: _activePage == 0 ? _activeclr : _inactclr,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: _activePage == 1 ? LinearGradient(
                  colors: [
                    Color.fromRGBO(241, 103, 48, 1.0),
                    Color.fromRGBO(249, 167, 25, 1.0)
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ) : LinearGradient(
                  colors: [
                    Color(0xffffffff),
                    Color(0xffffffff),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.calculate_outlined,
                  size: 38,
                  color: _activePage == 1 ? _activeclr : _inactclr,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: _activePage == 2 ? LinearGradient(
                  colors: [
                    Color.fromRGBO(241, 103, 48, 1.0),
                    Color.fromRGBO(249, 167, 25, 1.0)
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ) : LinearGradient(
                  colors: [
                    Color(0xffffffff),
                    Color(0xffffffff),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.help_outline,
                  size: 38,
                  color: _activePage == 2 ? _activeclr : _inactclr,
                ),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _history = _activePage;
              _activePage = index;
            });
          },
        ),
      ),
    );
  }
}
