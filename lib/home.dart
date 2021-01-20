import 'package:flutter/material.dart';
import 'package:project_1/customdialog.dart';
import 'customcarousel.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
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
                            showDialog(
                                context: context,
                                builder: (_) => CustomTeamPopup(
                                      currentidx: 0,
                                    ));
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
                          onTap: () {},
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
                          left: 90.0,
                          top: 3.0,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[350],
                            radius: 46.0,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/galaxy.jpg'),
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
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[350],
                            radius: 46.0,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/galaxy.jpg'),
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
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[350],
                            radius: 50.0,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/galaxy.jpg'),
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
            width: 320.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(23.0),
                  topRight: Radius.circular(23.0)),
              border: Border.all(
                  width: 0, color: Color(0xffff4f5fa), style: BorderStyle.none),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(0, 0),
                  blurRadius: 20,
                  spreadRadius: 0,
                )
              ],
            ),
            //tab solih button uud
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _currentTab = 0;
                      });
                    },
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
                    ),
                    color: _currentTab == 0
                        ? Color(0xffffffff)
                        : Color(0xfff4f5fa),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _currentTab = 1;
                      });
                    },
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
                    ),
                    color: _currentTab == 1
                        ? Color(0xffffffff)
                        : Color(0xfff4f5fa),
                  ),
                ),
              ],
            ),
          ),
          //tabuudin datag aguulah container
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              width: 340.0,
              height: 201.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14000000),
                    offset: Offset(0, 0),
                    blurRadius: 20,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: _contTab[_currentTab],
                  ),
                ],
              ),
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
      new ScrollController(initialScrollOffset: 10.0);
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
