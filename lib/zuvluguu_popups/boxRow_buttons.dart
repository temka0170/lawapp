import 'package:flutter/material.dart';
import 'package:project_1/custom_func_data/data.dart';
import 'package:project_1/zuvluguu_popups/zuvluguupopup.dart';

//buttons that shows sub popups of case popups
// ignore: must_be_immutable
class BoxRow extends StatefulWidget {
  String desc1, desc2;
  String img1, img2;
  int index1, index2;
  BoxRow({
    Key key,
    this.desc1,
    this.desc2,
    this.img1,
    this.img2,
    this.index1,
    this.index2,
  }) : super(key: key);

  @override
  _BoxRowState createState() => _BoxRowState();
}

class _BoxRowState extends State<BoxRow> {
  List<ZuvluguuPopup> morepopups = new List<ZuvluguuPopup>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    morepopups = moreSubPopups();
  }

  @override
  Widget build(BuildContext context) {
    double popwidth = MediaQuery.of(context).size.width * 0.88;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          widget.index1 != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return morepopups[widget.index1];
                          });
                    },
                    child: Container(
                      width: popwidth * 0.39,
                      height: popwidth * 0.38,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(0, 10),
                            blurRadius: 20,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  widget.desc1,
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xff23233c),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
          widget.index2 != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return morepopups[widget.index2];
                          });
                    },
                    child: Container(
                      width: popwidth * 0.39,
                      height: popwidth * 0.38,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(0, 10),
                            blurRadius: 20,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  widget.desc2,
                                  style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Color(0xff23233c),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
