import 'package:flutter/material.dart';
import 'package:project_1/navigating_pages/more.dart';
import 'package:project_1/zuvluguu_popups/EruugiinHereg.dart';
import 'package:project_1/zuvluguu_popups/IrgeniiHereg.dart';
import 'package:project_1/zuvluguu_popups/NudeeNee.dart';
import 'package:project_1/zuvluguu_popups/ZahirgaaniiHereg.dart';

import 'calculator_popup.dart';
import 'data.dart';

//content table of advice, q&a section
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
          width: MediaQuery.of(context).size.width * 0.86,
          height: MediaQuery.of(context).size.height * 0.05,
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
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.35,
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

//advice tab
class RecomQst extends StatelessWidget {
  const RecomQst({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: BoxItems(
            imgPath: 'assets/gifs/irgen.gif',
            textBox: 'Иргэний хэрэг',
            popup: IrgenBox(
              title: 'Иргэний хэрэг',
            ),
          ),
        ),
        Expanded(
          child: BoxItems(
            imgPath: 'assets/gifs/eruu.gif',
            textBox: 'Эрүүгийн хэрэг',
            popup: EruuBox(
              title: 'Эрүүгийн хэрэг',
            ),
          ),
        ),
        Expanded(
          child: BoxItems(
            imgPath: 'assets/gifs/baiguullaga.gif',
            textBox: 'Захиргааны хэрэг',
            popup: ZahirgaaBox(
              title: 'Захиргааны хэрэг',
            ),
          ),
        ),
        Expanded(
          child: BoxItems(
            imgPath: 'assets/gifs/openeye.gif',
            textBox: 'Open your eyes',
            popup: EyeBox(
              title: 'Open your eyes',
            ),
          ),
        ),
      ],
    );
  }
}

//q&a tab
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
            textQsts: 'Иргэний хэргийн хөөн хэлэл...',
            qstpopup: questions[0],
          ),
          QstsItems(
            textQsts: 'Шүүхэд хандмаар байгаа ч хариу...',
            qstpopup: questions[1],
          ),
          QstsItems(
            textQsts: 'Зээлийн гэрээ бичгээр байгуула...',
            qstpopup: questions[2],
          ),
          QstsItems(
            textQsts: 'Орон сууц худалдаж авахаар гэрэ...',
            qstpopup: questions[3],
          ),
          QstsItems(
            textQsts: 'Шүүхийн шийдвэрээр тогтоосон тэт...',
            qstpopup: questions[4],
          ),
        ],
      ),
    );
  }
}
