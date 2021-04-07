import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationItems extends StatelessWidget {
  final String url;
  final String title;
  const LocationItems({
    Key key,
    @required this.url,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch(url);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(title, textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }
}
