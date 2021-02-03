import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeContainer extends StatefulWidget {
  HomeContainer({
    Key key,
  }) : super(key: key);

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  //tabs of home page content table
  final List<Widget> _contTab = [
    Link(),
    Association(),
  ];
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    //content table container
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Container(
            width: 340.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Color(0xfff4f5fa).withOpacity(0.0),
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
          //container of tab items
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

//links tab
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

//associate tab
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

//items of links tab
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