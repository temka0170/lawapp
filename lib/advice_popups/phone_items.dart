import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Phone call button function
class PhoneItems extends StatelessWidget {
  final String number;
  final String title;
  const PhoneItems({
    Key key,
    @required this.number,
    this.title,
  }) : super(key: key);
  // call function
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not dial $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _makePhoneCall(number);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
          child: Center(// checks if there's title and adds title
            child: Text(title==null ? number : title+number, textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }
}
