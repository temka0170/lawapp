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
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xfff4f5fa),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.39,
              //same carousel as calculator page carousel, shuffled
              child: AdScreen(),
            ),
            CategoriesScroller(),
          ],
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
      width: MediaQuery.of(context).size.width * 0.36,
      height: MediaQuery.of(context).size.height * 0.3 - 50,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      //links popups to its button
                      return popup;
                    });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.fill,
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
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.06,
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
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: 1.0,
              color: Color(0xff23233c).withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}
