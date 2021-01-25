import 'dart:ui';

import 'package:flutter/material.dart';
import '../custom_func_data/customcarousel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Color(0xfff4f5fa),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 260.0,
                child: MainScreen(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  width: 132.0,
                  height: 24.0,
                  alignment: Alignment.center,
                  child: Text("БҮТЭЭСЭН БАГ",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff23233c),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          top: 5.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            buildShowGeneralDialog(context, height, 0);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[350],
                            radius: 43.0,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/galaxy.jpg'),
                              radius: 38.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 300.0,
                          top: 5.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            buildShowGeneralDialog(context, height, 4);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[350],
                            radius: 43.0,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/test.jpg'),
                              radius: 38.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 90.0,
                          top: 3.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            buildShowGeneralDialog(context, height, 1);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[350],
                            radius: 46.0,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/splashscreen/start1.png'),
                              radius: 41.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 230.0,
                          top: 3.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            buildShowGeneralDialog(context, height, 3);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[350],
                            radius: 46.0,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/splashscreen/start3.png'),
                              radius: 41.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 160.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            buildShowGeneralDialog(context, height, 2);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[350],
                            radius: 50.0,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/splashscreen/start2.png'),
                              radius: 45.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Placeholder",
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff23233c),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ),
              //home hesgiin holboos link, holbogdoh hesgig tusad n class bolgoson
              HomeContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Future buildShowGeneralDialog(BuildContext context, double height, int idx) {
    // ignore: unused_local_variable
    int _current;
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: height,
              child: SizedBox.expand(
                child: Column(children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 28.0, right: 28.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: new BoxDecoration(
                              color: Color(0xffffffff).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                    spreadRadius: 0)
                              ],
                            ),
                            child: Icon(Icons.close)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 85.0),
                    child: CarouselSlider(
                      items: imageSliders,
                      options: CarouselOptions(
                          initialPage: idx,
                          autoPlay: false,
                          enlargeCenterPage: false,
                          height: height * 0.685,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }
}

class HomeContainer extends StatefulWidget {
  HomeContainer({
    Key key,
  }) : super(key: key);

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  //holbogdoh, holboos link tab
  final List<Widget> _contTab = [
    Link(),
    Association(),
  ];
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    //holbooslink, holbogdoh hesgiin body container
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Container(
            width: 340.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Color(0xfff4f5fa),
              border: Border.all(
                  width: 0, color: Color(0xfff4f5fa), style: BorderStyle.none),
              boxShadow: [
                BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(0, 0),
                  blurRadius: 20,
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentTab = 0;
                      });
                    },
                    child: SizedBox.expand(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12.0)),
                          color: _currentTab == 0
                              ? Color(0xffffffff)
                              : Color(0xfff4f5fa),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Холбоос линк",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: _currentTab == 0
                                  ? Color(0xfff78c1e)
                                  : Color(0xff23233c),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentTab = 1;
                      });
                    },
                    child: SizedBox.expand(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12.0)),
                          color: _currentTab == 1
                              ? Color(0xffffffff)
                              : Color(0xfff4f5fa),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "хамтран ажиллах",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: _currentTab == 1
                                  ? Color(0xfff78c1e)
                                  : Color(0xff23233c),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //tabuudin datag aguulah container
          Container(
            width: 340.0,
            height: 201.0,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(10.0)),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: _contTab[_currentTab],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//holboos link tab
class Link extends StatefulWidget {
  const Link({
    Key key,
  }) : super(key: key);

  @override
  _LinkState createState() => _LinkState();
}

class _LinkState extends State<Link> {
  ScrollController _scrollController =
      new ScrollController(initialScrollOffset: 127.0, keepScrollOffset: true);
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      isAlwaysShown: true,
      child: ListView(
        padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        itemExtent: 80.0,
        controller: _scrollController,
        children: <Widget>[
          BoxItems(
            imgPath: 'assets/images/galaxy.jpg',
            textBox: 'E Mongolia',
            url:
                'https://e-mongolia.mn/services/citizen/sector/5d88f11c0384df17c56691b3',
          ),
          BoxItems(
            imgPath: 'assets/images/galaxy.jpg',
            textBox: 'Эрх зүйн мэдээллийн нэгдсэн систем',
            url: 'https://www.legalinfo.mn/',
          ),
          BoxItems(
            imgPath: 'assets/images/galaxy.jpg',
            textBox: 'Хууль зүйн үндэсний хүрээлэн',
            url: 'http://nli.gov.mn/',
          ),
          BoxItems(
            imgPath: 'assets/images/galaxy.jpg',
            textBox: 'Like дарж дэмжээрэй',
            url: 'https://www.facebook.com/Umbrella.Lawfirm',
          ),
        ],
        reverse: true,
      ),
    );
  }
}

//holbogdoh tab
class Association extends StatelessWidget {
  const Association({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 21.7),
                child: Image(
                  width: 78.0,
                  height: 73.0,
                  image: AssetImage('assets/images/galaxy.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: SizedBox(
                  width: 200.0,
                  height: 87.0,
                  child: Text(
                    "Улсын тэмдэгтийн хураамж цахим тооцоолборын хамт олонтой хамтран ажиллахыг хүсвэл дараах дугаараар холбогдоно уу.",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff23233c),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 28.0, left: 0.0),
          child: Text(
            "Утас: 9922ХХХХ\nИмэйл: umbrella.lawfirm@gmail.com",
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              color: Color(0xff23233c),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ],
    );
  }
}

//holboos link hesgiin itemnuud
class BoxItems extends StatelessWidget {
  const BoxItems({
    Key key,
    @required this.imgPath,
    @required this.textBox,
    @required this.url,
  }) : super(key: key);

  final String imgPath;
  final String textBox;
  final String url;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Image.asset(
                imgPath,
                width: 55.0,
                height: 55.0,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  _launchURL(url);
                },
                child: Text(
                  textBox,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xff23233c),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Container(
            width: 280.0,
            height: 1.0,
            color: Color(0xff23233c).withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                child: Stack(
                  children: <Widget>[
                    SizedBox.expand(
                        child: Image.asset(
                      item,
                      fit: BoxFit.fill,
                    )),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 186,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(
                              height: 40.0,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                itemTitle[imgList.indexOf(item)],
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xffffffff),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                itemDesc[imgList.indexOf(item)],
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xfff9931f),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: 206,
                                  height: 50,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1.0,
                                        color: Color(0xfff9931f),
                                        style: BorderStyle.solid),
                                  ),
                                  child: Center(
                                    child: Text(
                                      itemBtn[imgList.indexOf(item)],
                                      style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        color: Color(0xffffffff),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

final List<String> imgList = [
  "assets/images/galaxy.jpg",
  "assets/splashscreen/start1.png",
  "assets/splashscreen/start2.png",
  "assets/splashscreen/start3.png",
  "assets/images/test.jpg"
];

final List<String> itemTitle = [
  "Galaxy",
  "Start 1",
  "Start 2",
  "Start 3",
  "Test Jpg"
];

final List<String> itemDesc = [
  "\"Galaxy PlaceHolder\"",
  "\"Start1 PlaceHolder\"",
  "\"Start2 PlaceHolder\"",
  "\"Start3 PlaceHolder\"",
  "\"Test PlaceHolder\""
];

final List<String> itemBtn = [
  "Just Galaxy",
  "Just Start1",
  "Just Start2",
  "Just Start3",
  "Just Test",
];
