import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Home page info table
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
  int _currentTab = 0; // default tab is links

  @override
  Widget build(BuildContext context) {
    //content table container
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      // main container
      child: Column(
        children: [
          Container(
            width: maxWidth * 0.9,
            height: maxHeight * 0.05,
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
            // Tab buttons container
            child: Row(
              children: <Widget>[
                // Links tab button
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
                          // changes color if active or inactive
                          color: _currentTab == 0
                              ? Color(0xffffffff) // active color
                              : Color(0xfff4f5fa), // inactive color
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
                // Association tab button
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
                          // changes color if tab is active or inactive
                          color: _currentTab == 1
                              ? Color(0xffffffff) // active color
                              : Color(0xfff4f5fa), // inactive color
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Хамтран ажиллах",
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
          //container of current tab contents
          Container(
            width: maxWidth * 0.9,
            height: maxHeight * 0.25,
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

//links tab contents
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
      // shows scrollbar
      controller: _scrollController,
      isAlwaysShown: true,
      child: ListView(
        // creates list view of items
        padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        itemExtent: 80.0,
        controller: _scrollController,
        children: <Widget>[
          BoxItems(
            imgPath: 'assets/images/e-icon.png',
            textBox: 'E Mongolia',
            url:
                'https://e-mongolia.mn/services/citizen/sector/5d88f11c0384df17c56691b3',
          ),
          BoxItems(
            imgPath: 'assets/images/legalicon.jpg',
            textBox: 'Эрх зүйн мэдээллийн нэгдсэн систем',
            url: 'https://www.legalinfo.mn/',
          ),
          BoxItems(
            imgPath: 'assets/images/huuli-icon.jpg',
            textBox: 'Хууль зүйн үндэсний хүрээлэн',
            url: 'http://nli.gov.mn/',
          ),
          BoxItems(
            imgPath: 'assets/images/like.png',
            textBox: 'Like дарж дэмжээрэй',
            url: 'https://www.facebook.com/Umbrella.Lawfirm',
          ),
        ],
        reverse: true,
      ),
    );
  }
}

//associate tab contents
class Association extends StatelessWidget {
  const Association({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('assets/images/umbrella_logo.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "Хүний эрх, шударга ёс, үнэний төлөөх Шүхэр төвийн хамт олонтой хамтран ажиллахыг хүсвэл дараах дугаараар холбогдоно уу.",
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
        Expanded(
          flex: 2,
          child: Text(
            "Утас: 94998777\nИмэйл: umbrella.lawfirm@gmail.com",
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

//Function of items in Links tab
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
// url launcher function
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // template of individual item
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // icon
          Expanded(
            flex: 1,
            child: Image.asset(
              imgPath,
              fit: BoxFit.fill,
            ),
          ),
          // Button to launch url
          Expanded(
            flex: 4,
            child: TextButton(
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
    );
  }
}
