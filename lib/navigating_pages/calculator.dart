import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_1/custom_functions/calculator_popup.dart';
import 'package:project_1/custom_functions/calculator_buttons.dart';
import '../custom_functions/calculator_carousel.dart';
import 'package:project_1/custom_functions/decimal_formatter.dart';
import 'package:project_1/custom_functions/calculator_formula.dart';

// Calculator Page
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
  String finalresult = '70,200'; // default value
  int psps = 0; // default value

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Container(
                    width: _width,
                    height: _height * 0.34,
                    //custom carousel
                    child: CalculatorCarousel(),
                  ),
                ),
                // Calculator title
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Center(
                    child: Text(
                      "УЛСЫН ТЭМДЭГТИЙН\nХУРААМЖ ТООЦООЛОХ",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff23233c),
                        fontSize: MediaQuery.of(context).size.height * 0.028,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0
                  ),
                  // Calculator TextField
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
                          fontSize: MediaQuery.of(context).size.height * 0.02,
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
                      padding: const EdgeInsets.only(top: 8.0, right: 10.0),
                      child: Text(
                          //shows final price
                          finalresult + '₮',
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff23233c),
                            fontSize: MediaQuery.of(context).size.height * 0.024,
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
                      padding: const EdgeInsets.only(top: 8.0, right: 10.0),
                      child: Text(
                          psps == 1
                              ? "Таны төлөх үнийн дүн"
                              : "Үнэлэх боломжгүй нэхэмжлэлд төлнө",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff23233c),
                            fontSize: MediaQuery.of(context).size.height * 0.016,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ],
                ),
                // Button links
                govLink(_width, _height),
                ytLink(_width, _height),
                phoneCaller(_width, _height),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
