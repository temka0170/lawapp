import 'package:flutter/material.dart';
import '../custom_func_data/calculator_carousel.dart';
import 'package:project_1/custom_func_data/more_table.dart';

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
                //same carousel as calculator page carousel, shuffled
                child: AdScreen(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9.0),
                //content table of more page
                child: MoreContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//items of advice tab
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
                      //links popups to its button
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

//q&a section items
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

