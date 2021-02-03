import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_1/custom_func_data/calculator_popup.dart';
import 'data.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:project_1/painters/calculatorpainter.dart';

//Custom Carousel Slider of Calculator.dart and More.dart
// ignore: must_be_immutable
class AdScreen extends StatefulWidget {
  @override
  _AdScreenState createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {
  //gets values in data.dart for each slide
  List<AdModel> ads = new List<AdModel>();
  List<CustomDialogBox> cmpopups = new List<CustomDialogBox>();
  int _currentAd = 0;
  Timer timer;
  PageController adController = new PageController(initialPage: 0);

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    //gets values from data.dart
    ads = getAds();
    ads.shuffle();
    cmpopups = adPopups();

    //periodic slide change timer
    if (ads != null) {
      timer = Timer.periodic(Duration(seconds: 4), (_) {
        if (adController.hasClients) {
          if (_currentAd == ads.length) {
            _currentAd = 0;
            adController.animateToPage(_currentAd,
                duration: Duration(seconds: 1), curve: Curves.easeOut);
          } else {
            adController.animateToPage(_currentAd++,
                duration: Duration(seconds: 1), curve: Curves.easeOut);
          }
        }
      });
    }
  }

  //current tab/slide indicator
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
    int id;
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: adController,
          itemCount: ads.length,
          onPageChanged: (idx) {
            setState(() {
              _currentAd = idx;
            });
          },
          itemBuilder: (context, index) {
            //Slide of carousel, gets data by list
            ix = index;
            id = ads[ix].getIdex();
            return AdTile(
              imgPath: ads[ix].getAssetPath(),
              desc: ads[ix].getDescript(),
            );
          },
        ),
        //Top curved border of Calculator,more section carousel
        ClipPath(
          clipper: WaveClipperTwo(
            flip: true,
            reverse: false,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 85.0,
            color: Color(0xfff8931f).withOpacity(0.4),
          ),
        ),
        ClipPath(
          clipper: WaveClipperTwo(
            flip: true,
            reverse: false,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 70.0,
            color: Color(0xfff8931f),
          ),
        ),
        //bottom curved border of calculator,more section carousel
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 377),
          painter: SecondWave(),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  //this links which popup should popup when clicked on slider
                  return cmpopups[id];
                });
          },
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 377),
            painter: FirstWave(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 320.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //defines length of indicator dots, counts how much items there are
              //in data.dart list and add dots accordingly/equally
              for (int i = 0; i < ads.length; i++)
                _currentAd == i ? adIndicator(true) : adIndicator(false),
            ],
          ),
        ),
      ],
    );
  }
}

//defines single slide of carousel, aka theme of popup
// ignore: must_be_immutable
class AdTile extends StatefulWidget {
  String imgPath;
  String desc;
  AdTile({this.imgPath, this.desc});

  @override
  _AdTileState createState() => _AdTileState();
}

class _AdTileState extends State<AdTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 376,
            child: FittedBox(
              child: Image.asset(widget.imgPath),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 95.0, left: 44.0),
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
        ],
      ),
    );
  }
}
