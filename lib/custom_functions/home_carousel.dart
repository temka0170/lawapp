import 'dart:async';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_1/custom_functions/calculator_ad_popup.dart';
import 'data.dart';
import 'package:url_launcher/url_launcher.dart';

//Home section advertisement carousel
// ignore: must_be_immutable
class HomeCarousel extends StatefulWidget {
  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  //gets slide values
  List<MainModel> mains = <MainModel>[];
  int _currentMain = 0;
  Timer timerMain;
  PageController mainController = new PageController(initialPage: 0);

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    mains = getMains();
    mains.shuffle(); // shuffles slides randomly

    // timer for slide change
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

//current slide dot indicator
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
    int ix, id;
    return Column(
      children: <Widget>[
        CarouselSlider.builder(
          itemCount: mains.length,
          itemBuilder: (context, index) {
            //Slide of carousel, gets data by list
            ix = index;
            id = mains[ix].getIdx();
            return MainTile(
              // individual ad template
              imgPath: mains[ix].getAssetPath(),
              desc: mains[ix].getDescript(),
              idx: id,
            );
          },
          options: CarouselOptions(
            // carousel slider options
            onPageChanged: (index, reason) {
              setState(() {
                _currentMain = index;
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
        //indicator implementation
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < mains.length; i++)
                    _currentMain == i ? adIndicator(true) : adIndicator(false),
                ],
              ),
            ),
          ),
        ]),
      ],
    );
  }
}

//Individual Slide theme/template
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
  List<AdvertisementPopup> popups = <AdvertisementPopup>[];

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    popups = homeAdPopups();
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
            // checks if there's url
            // if url is null, shows popup with according info
            // of url is not null, launches web link
            popups[widget.idx].url == null
                ? showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      //this links which popup should popup when clicked on slider
                      return popups[widget.idx];
                    })
                : launch(popups[widget.idx].url);
          },
          // Slide data
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
                      // img of slide
                      child: Image.asset(widget.imgPath),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              // optional description for slide,
              // unused since advertisement img has text on them
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
