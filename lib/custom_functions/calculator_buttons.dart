import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//button functions of calculator page buttons
// call function
Future<void> _makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not dial $url';
  }
}
// url launcher to itax.mta.mn
Padding govLink(double width, double height) {
  return Padding(
    padding: const EdgeInsets.only(top: 15.0),
    // container of button
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
              // icon button version
              child: IconButton(
                onPressed: () => launch('https://itax.mta.mn/home/receiptCreate'),
                icon: Icon(Icons.monetization_on),
                color: Color(0xff23233c),
              ),
            ),
            // text button version
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
//url launcher to video guide
Padding ytLink(double width, double height) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    // container of button
    child: SizedBox(
      width: width,
      height: height * 0.06,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // icon button version
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
            // text button version
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

// Call button
Padding phoneCaller(double width, double height) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    // container of button
    child: SizedBox(
      width: width,
      height: height * 0.06,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // icon button version
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
                  _makePhoneCall('tel:+97694998777');
                },
                icon: Icon(Icons.phone),
                color: Color(0xff23233c),
              ),
            ),
            // text button version
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
                  onTap: () => _makePhoneCall("tel:+97694998777"),
                ),
              ),
            )
          ]),
    ),
  );
}
