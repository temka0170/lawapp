import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

//button functions of calculator page buttons

_makePhoneCall(String contact) async {
  if (await FlutterPhoneDirectCaller.callNumber(contact)) {
    await FlutterPhoneDirectCaller.callNumber(contact);
  } else {
    throw 'Could not dial $contact';
  }
}

Padding govLink(double width, double height) {
  return Padding(
    padding: const EdgeInsets.only(top: 15.0),
    child: SizedBox(
      width: width,
      height: height * 0.06,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: height * 0.06,
              height: height * 0.06,
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
                onPressed: () => launch('https://itax.mta.mn/home/receiptCreate'),
                icon: Icon(Icons.monetization_on),
                color: Color(0xff23233c),
              ),
            ),
            Container(
              width: width * 0.65,
              height: height * 0.06,
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
                      fontSize: height * 0.016,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () => launch('https://itax.mta.mn/home/receiptCreate'),
                ),
              ),
            )
          ]),
    ),
  );
}
//
Padding ytLink(double width, double height) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: SizedBox(
      width: width,
      height: height * 0.06,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: height * 0.06,
              height: height * 0.06,
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
            Container(
              width: width * 0.65,
              height: height * 0.06,
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
                      fontSize: height * 0.016,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  onTap: () =>
                      launch('https://www.youtube.com/watch?v=6Atkf-N9b80'),
                ),
              ),
            )
          ]),
    ),
  );
}

// calculator page call button
Padding phoneCaller(double width, double height) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: SizedBox(
      width: width,
      height: height * 0.06,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: height * 0.06,
              height: height * 0.06,
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
                  _makePhoneCall("+97694998777");
                },
                icon: Icon(Icons.phone),
                color: Color(0xff23233c),
              ),
            ),
            Container(
              width: width * 0.65,
              height: height * 0.06,
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
                      fontSize: height * 0.016,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  onTap: () => _makePhoneCall("+97694998777"),
                ),
              ),
            )
          ]),
    ),
  );
}
