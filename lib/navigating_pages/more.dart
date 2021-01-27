import 'package:flutter/material.dart';
import 'package:project_1/custom_func_data/customdialog.dart';
import 'package:project_1/custom_func_data/data.dart';
import '../zuvluguu_popups/EruugiinHereg.dart';
import '../custom_func_data/customcarousel.dart';
import '../zuvluguu_popups/IrgeniiHereg.dart';
import '../zuvluguu_popups/ZahirgaaniiHereg.dart';

class More extends StatefulWidget {
  More({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<More> {
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
                height: 377.0,
                //calculator hesgiin carouseltei adilhan
                child: AdScreen(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9.0),
                //more hesgiin utga aguulah container
                child: MoreContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//zuwluguu hesgiin itemnud
class BoxItems extends StatelessWidget {
  const BoxItems({
    Key key,
    @required this.imgPath,
    @required this.textBox,
    @required this.popup,
  }) : super(key: key);

  final String imgPath;
  final String textBox;
  final Widget popup;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 33.0),
            child: Image.asset(
              imgPath,
              width: 60.0,
              height: 60.0,
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      //popup n carouseliin indextei tentsuu
                      //data.dart deer utga-uudaa awna
                      return popup;
                    });
              },
              child: Text(
                textBox,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//tugeemel asuult hesgiin itemnud
class QstsItems extends StatelessWidget {
  const QstsItems({
    Key key,
    @required this.textQsts,
    @required this.qstpopup,
  }) : super(key: key);

  final String textQsts;
  final Widget qstpopup;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return qstpopup;
                  });
            },
            child: Text(
              textQsts,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SFProDisplay',
                color: Color(0xff23233c),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              overflow: TextOverflow.clip,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              width: 280.0,
              height: 1.0,
              color: Color(0xff23233c).withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}

//zuwluguu, tugeemel asuult hesgiin container
class MoreContainer extends StatefulWidget {
  MoreContainer({
    Key key,
  }) : super(key: key);

  @override
  _MoreContainerState createState() => _MoreContainerState();
}

class _MoreContainerState extends State<MoreContainer> {
  final List<Widget> _contTab = [
    RecomQst(),
    Qsts(),
  ];
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 330.0,
          height: 30.0,
          decoration: BoxDecoration(
            border: Border.all(
                width: 0, color: Color(0xfff4f5fa), style: BorderStyle.none),
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
          child: Container(
            color: Color(0xfff4f5fa),
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
                              BorderRadius.vertical(top: Radius.circular(8.0)),
                          color: _currentTab == 0
                              ? Color(0xfff9931f)
                              : Color(0xfff4f5fa),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "ЗӨВӨЛГӨӨ",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: _currentTab == 0
                                  ? Color(0xffffffff)
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
                              BorderRadius.vertical(top: Radius.circular(8.0)),
                          color: _currentTab == 1
                              ? Color(0xfff9931f)
                              : Color(0xfff4f5fa),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "ТҮГЭЭМЭЛ АСУУЛТ",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: _currentTab == 1
                                  ? Color(0xffffffff)
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
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Container(
            width: 352.0,
            height: 281.0,
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
    );
  }
}

//zuwluguu tab
class RecomQst extends StatelessWidget {
  const RecomQst({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          BoxItems(
            imgPath: 'assets/images/galaxy.jpg',
            textBox: 'Иргэний хэрэг',
            popup: IrgenBox(
              title: 'Иргэний хэрэг',
            ),
          ),
          BoxItems(
            imgPath: 'assets/images/galaxy.jpg',
            textBox: 'Эрүүгийн хэрэг',
            popup: EruuBox(
              title: 'Эрүүгийн хэрэг',
            ),
          ),
          BoxItems(
            imgPath: 'assets/images/galaxy.jpg',
            textBox: 'Захиргааны хэрэг',
            popup: ZahirgaaBox(
              title: 'Захиргааны хэрэг',
            ),
          ),
        ],
      ),
    );
  }
}

//tugeemel asuult tab
class Qsts extends StatefulWidget {
  Qsts({
    Key key,
  }) : super(key: key);

  @override
  _QstsState createState() => _QstsState();
}

class _QstsState extends State<Qsts> {
  ScrollController _scrollController =
      new ScrollController(initialScrollOffset: 10.0);

  List<QuestionBox> questions = new List<QuestionBox>();

  @override
  void initState() {
    super.initState();
    questions = questionPop();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      isAlwaysShown: true,
      child: ListView(
        padding: EdgeInsets.all(8.0),
        controller: _scrollController,
        itemExtent: 60.0,
        children: <Widget>[
          QstsItems(
            textQsts: 'PlaceHolder1',
            qstpopup: questions[0],
          ),
          QstsItems(
            textQsts: 'PlaceHolder2',
            qstpopup: questions[1],
          ),
          QstsItems(
            textQsts: 'PlaceHolder3',
            qstpopup: questions[2],
          ),
          QstsItems(
            textQsts: 'PlaceHolder4',
            qstpopup: questions[3],
          ),
          QstsItems(
            textQsts: 'PlaceHolder5',
            qstpopup: questions[4],
          ),
        ],
      ),
    );
  }
}
