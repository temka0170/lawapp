import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class PhoneItems extends StatelessWidget {
  final String number;
  final String title;
  const PhoneItems({
    Key key,
    @required this.number,
    this.title,
  }) : super(key: key);
  _makePhoneCall(String contact) async {
    if (await FlutterPhoneDirectCaller.callNumber(contact)) {
      await FlutterPhoneDirectCaller.callNumber(contact);
    } else {
      throw 'Could not dial $contact';
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
          child: Center(
            child: Text(title==null ? number : title+number, textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }
}
