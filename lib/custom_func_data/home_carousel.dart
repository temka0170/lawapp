import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_1/custom_func_data/calculator_popup.dart';
import 'data.dart';
import 'package:project_1/painters/mainpainter.dart';

//Home section carousel, reused calculator section carousel with few changes
// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //gets slide values
  List<MainModel> mains = new List<MainModel>();
  int _currentMain = 0;
  Timer timerMain;
  PageController mainController = new PageController(initialPage: 0);

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    mains = getMains();
    mains.shuffle();

    if (mains != null) {
      timerMain = Timer.periodic(Duration(seconds: 4), (_) {
        if (mainController.hasClients) {
          if (_currentMain == mains.length) {
            mainController.animateToPage(0,
                duration: Duration(seconds: 1), curve: Curves.easeOut);
            _currentMain = 0;
          } else {
            mainController.animateToPage(_currentMain++,
                duration: Duration(seconds: 1), curve: Curves.easeOut);
          }
        }
      });
    }
  }

//tab indicator
  Widget adIndicator(bool currentIdx) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: currentIdx ? Color(0xfff9931f) : Color(0xffe3e3e3),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int ix;
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: mainController,
          itemCount: mains.length,
          onPageChanged: (idx) {
            setState(() {
              _currentMain = idx;
            });
          },
          itemBuilder: (context, index) {
            ix = index;
            return MainTile(
              imgPath: mains[ix].getAssetPath(),
              desc: mains[ix].getDescript(),
              idx: mains[ix].getIdx(),
            );
          },
        ),
        //curved border of home section carousel
        IgnorePointer(
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.36 + 1),
            painter: MainWave1(),
          ),
        ),
        IgnorePointer(
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.36 + 1),
            painter: MainWave2(),
          ),
        ),
        //indicator builder
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < mains.length; i++)
                  _currentMain == i ? adIndicator(true) : adIndicator(false),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//slide theme
// ignore: must_be_immutable
class MainTile extends StatefulWidget {
  String imgPath;
  String desc;
  int idx;
  MainTile({this.imgPath, this.desc, this.idx});

  @override
  _MainTileState createState() => _MainTileState();
}

class _MainTileState extends State<MainTile> {
  List<CustomDialogBox> popups = new List<CustomDialogBox>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    popups = getPopups();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    //gets values from list
                    return popups[widget.idx];
                  });
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.36,
              child: FittedBox(
                child: Image.asset(widget.imgPath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.desc,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xffffffff),
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
