import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_1/custom_func_data/calc_copy.dart';
import 'package:project_1/custom_func_data/calculator_buttons.dart';
import '../custom_func_data/calculator_carousel.dart';
import 'package:project_1/custom_func_data/decimal_formatter.dart';
import 'package:project_1/custom_func_data/calculator_formula.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<CalculatorPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  //sets alias for CalculatePrice function
  CalculatePrice calculate = CalculatePrice();
  String finalresult = '70,200';
  int psps = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          width: _width,
          height: _height,
          color: Color(0xfff4f5fa),
          //temporary solution for overflow
          child: Column(
            children: [
              Container(
                width: _width,
                height: _height * 0.4,
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
                  top: 10.0,
                ),
                child: Center(
                  child: Container(
                    width: _width * 0.92,
                    height: _height * 0.05,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      autofocus: false,
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
                          if (finalresult == null) finalresult = '70,200';
                          //for changing initial text of price range
                          psps = 1;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0, right: 10.0),
                    child: Text(
                        //shows final price
                        finalresult + '₮',
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff23233c),
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0, right: 10.0),
                    child: Text(
                        psps == 1
                            ? "Таны төлөх үнийн дүн"
                            : "Үнэлэх боломжгүй нэхэмжлэлд төлнө",
                        style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          color: Color(0xff23233c),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ],
              ),
              govLink(_width, _height),
              ytLink(_width, _height),
              phoneCaller(_width, _height),
            ],
          ),
        ),
      ),
    );
  }
}
