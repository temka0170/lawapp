import 'dart:async';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_1/custom_functions/calculator_ad_popup.dart';
import 'data.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// import 'package:project_1/painters/calculatorpainter.dart';

//Custom Carousel Slider of Calculator.dart and More.dart
// ignore: must_be_immutable
class CalculatorCarousel extends StatefulWidget {
  @override
  _CalculatorCarouselState createState() => _CalculatorCarouselState();
}

class _CalculatorCarouselState extends State<CalculatorCarousel> {
  //gets values in data.dart for each slide
  List<AdModel> ads = new List<AdModel>();
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
    return Column(
      children: <Widget>[
        CarouselSlider.builder(
          itemCount: ads.length,
          itemBuilder: (context, index) {
            //Slide of carousel, gets data by list
            ix = index;
            id = ads[ix].getIdex();
            return AdTile(
              imgPath: ads[ix].getAssetPath(),
              desc: ads[ix].getDescript(),
              idx: id,
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _currentAd = index;
              });
            },
            aspectRatio: 18 / 10,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            height: MediaQuery.of(context).size.height * 0.28,
          ),
        ),
        // PageView.builder(
        //   controller: adController,
        //   itemCount: ads.length,
        //   onPageChanged: (idx) {
        //     setState(() {
        //       _currentAd = idx;
        //     });
        //   },
        //   itemBuilder: (context, index) {
        //     //Slide of carousel, gets data by list
        //     ix = index;
        //     id = ads[ix].getIdex();
        //     return AdTile(
        //       imgPath: ads[ix].getAssetPath(),
        //       desc: ads[ix].getDescript(),
        //       idx: id,
        //     );
        //   },
        // ),
        //Top curved border of Calculator,more section carousel
        // IgnorePointer(
        //   child: ClipPath(
        //     clipper: WaveClipperTwo(
        //       flip: true,
        //       reverse: false,
        //     ),
        //     child: Container(
        //       width: MediaQuery.of(context).size.width,
        //       height: MediaQuery.of(context).size.height * 0.1,
        //       color: Color(0xfff8931f).withOpacity(0.4),
        //     ),
        //   ),
        // ),
        // IgnorePointer(
        //   child: ClipPath(
        //     clipper: WaveClipperTwo(
        //       flip: true,
        //       reverse: false,
        //     ),
        //     child: Container(
        //       width: MediaQuery.of(context).size.width,
        //       height: MediaQuery.of(context).size.height * 0.09,
        //       color: Color(0xfff8931f),
        //     ),
        //   ),
        // ),
        // //bottom curved border of calculator,more section carousel
        // IgnorePointer(
        //   child: CustomPaint(
        //     size: Size(MediaQuery.of(context).size.width,
        //         MediaQuery.of(context).size.height * 0.46 + 1),
        //     painter: SecondWave(),
        //   ),
        // ),
        // IgnorePointer(
        //   child: CustomPaint(
        //     size: Size(MediaQuery.of(context).size.width,
        //         MediaQuery.of(context).size.height * 0.46 + 1),
        //     painter: FirstWave(),
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
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
            ),
          ],
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
  int idx;
  AdTile({this.imgPath, this.desc, this.idx});

  @override
  _AdTileState createState() => _AdTileState();
}

class _AdTileState extends State<AdTile> {
  List<AdvertisementPopup> cmpopups = new List<AdvertisementPopup>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    cmpopups = calculatorAdPopups();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(2, 4),
              blurRadius: 12,
              spreadRadius: 0,
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
            cmpopups[widget.idx].url == null
                ? showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      //this links which popup should popup when clicked on slider
                      return cmpopups[widget.idx];
                    })
                : launch(cmpopups[widget.idx].url);
          },
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FittedBox(
                      child: Image.asset(widget.imgPath),
                      fit: BoxFit.fill,
                    ),
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
        ),
      ),
    );
  }
}
