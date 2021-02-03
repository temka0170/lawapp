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

Padding govLink() {
  return Padding(
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
  );
}

Padding ytLink() {
  return Padding(
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
              onTap: () =>
                  launch('https://www.youtube.com/watch?v=6Atkf-N9b80'),
            ),
          ),
        ),
      )
    ]),
  );
}

Padding phoneCaller() {
  return Padding(
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
  );
}
