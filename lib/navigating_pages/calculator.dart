import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_1/custom_func_data/calc_copy.dart';
import 'package:url_launcher/url_launcher.dart';
import '../custom_func_data/calculator_carousel.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:project_1/custom_func_data/decimal_formatter.dart';
import 'package:project_1/custom_func_data/calculator_formula.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<CalculatorPage> {
  final myController = TextEditingController();

  _makePhoneCall(String contact) async {
    if (await FlutterPhoneDirectCaller.callNumber(contact)) {
      await FlutterPhoneDirectCaller.callNumber(contact);
    } else {
      throw 'Could not dial $contact';
    }
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  //sets alias for CalculatePrice function
  CalculatePrice calculate = CalculatePrice();
  //Uniin dungiin placeholder
  String finalresult = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xfff4f5fa),
        //temporary solution for overflow
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 377.0,
                //custom carousel
                child: AdScreen(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Center(
                  child: Text(
                    "УЛСЫН ТЭМДЭГТИЙН\nХУРААМЖ ТООЦООЛОХ",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff23233c),
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 0.0,
                  top: 25.0,
                ),
                child: Center(
                  child: Container(
                    width: 350,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: TextFormField(
                      controller: myController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                        DecimalFormatter(),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Нэхэмжлэлийн үнийн дүнгээ бичнэ үү?",
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        color: Color(0xff23233c),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      //TextFormField recalculating price after input
                      onChanged: (String str) {
                        setState(() {
                          finalresult = calculate.tomyo(str);
                          //if theres no input sets value to 0
                          if (finalresult == null) finalresult = '0';
                        });
                      },
                      //TextFormField submit popup
                      onFieldSubmitted: (String str) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CalcPopup(
                                prc: finalresult,
                              );
                            });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0, left: 250),
                child: Text(
                    //shows final price
                    finalresult +
                        '₮',
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff23233c),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.0, left: 245.0),
                child: Text("Таны төлөх үнийн дүн",
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      color: Color(0xff23233c),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 18.0,
                  left: 41.0,
                ),
                child: Row(children: <Widget>[
                  Container(
                    width: 44,
                    height: 44,
                    decoration: new BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => launch('http://hdc.gov.mn/page/46/'),
                      icon: Icon(Icons.monetization_on),
                      color: Color(0xff23233c),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19.0),
                    child: Container(
                      width: 243,
                      height: 44,
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x14000000),
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                      ),
                      child: Center(
                        child: GestureDetector(
                          child: Text(
                            "Төлбөрийн даалгавар үүсгэх",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff23233c),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () => launch('http://hdc.gov.mn/page/46/'),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 6.0,
                  left: 41.0,
                ),
                child: Row(children: <Widget>[
                  Container(
                    width: 44,
                    height: 44,
                    decoration: new BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                    ),
                    child: IconButton(
                      onPressed: () =>
                          launch('https://www.youtube.com/watch?v=6Atkf-N9b80'),
                      icon: Icon(Icons.play_arrow),
                      color: Color(0xff23233c),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19.0),
                    child: Container(
                      width: 243,
                      height: 44,
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x14000000),
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                      ),
                      child: Center(
                        child: GestureDetector(
                          child: Text(
                            "Заавар видео үзэх",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff23233c),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          onTap: () => launch(
                              'https://www.youtube.com/watch?v=6Atkf-N9b80'),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  left: 41.0,
                ),
                child: Row(children: <Widget>[
                  Container(
                    width: 44,
                    height: 44,
                    decoration: new BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        _makePhoneCall("+97689830044");
                      },
                      icon: Icon(Icons.phone),
                      color: Color(0xff23233c),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19.0),
                    child: Container(
                      width: 243,
                      height: 44,
                      decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x14000000),
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ],
                      ),
                      child: Center(
                        child: GestureDetector(
                          child: Text(
                            "Өмгөөлөгчтэй холбогдох",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff23233c),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          onTap: () => _makePhoneCall("+97689830044"),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}