import 'dart:async';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_1/custom_functions/calculator_ad_popup.dart';
import 'data.dart';
import 'package:url_launcher/url_launcher.dart';

//Custom Carousel Slider of More.dart
// ignore: must_be_immutable
class MoreCarousel extends StatefulWidget {
  @override
  _MoreCarouselState createState() => _MoreCarouselState();
}

class _MoreCarouselState extends State<MoreCarousel> {
  //gets values in data.dart for each slide
  List<MoreModel> mores = new List<MoreModel>();
  int _currentAd = 0;
  Timer timer;
  PageController adController = new PageController(initialPage: 0);

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    //gets values from data.dart
    mores = getMore();
    mores.shuffle(); // shuffles slides randomly

    //periodic slide change timer
    if (mores != null) {
      timer = Timer.periodic(Duration(seconds: 4), (_) {
        if (adController.hasClients) {
          if (_currentAd == mores.length) {
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
          itemCount: mores.length,
          itemBuilder: (context, index) {
            //Slide of carousel, gets data by list
            ix = index;
            id = mores[ix].getIdex();
            return MoreTile(
              imgPath: mores[ix].getAssetPath(),
              desc: mores[ix].getDescript(),
              idx: id,
            );
          },
          options: CarouselOptions(// carousel slider options
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
        // indicator implementation
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
                    for (int i = 0; i < mores.length; i++)
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

//Carousel Slide theme/template
// ignore: must_be_immutable
class MoreTile extends StatefulWidget {
  String imgPath;
  String desc;
  int idx;
  MoreTile({this.imgPath, this.desc, this.idx});

  @override
  _MoreTileState createState() => _MoreTileState();
}

class _MoreTileState extends State<MoreTile> {
  List<AdvertisementPopup> morepopups = new List<AdvertisementPopup>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    // data.dart value getter
    morepopups = morePopups();
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
            //checks if there's url
            //if url is null, shows popup with according info
            //if url is not null, launches web link
            morepopups[widget.idx].url == null
                ? showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      //this links which popup should popup when clicked on slider
                      return morepopups[widget.idx];
                    })
                : launch(morepopups[widget.idx].url);
          },
          // Slide Container
          child: Stack(
            children: <Widget>[
              // Slide Image
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
              // Optional Slide description
              // unused since Ad image has text on them
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
