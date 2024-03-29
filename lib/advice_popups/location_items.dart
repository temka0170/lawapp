import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Function of location buttons
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
        // links to google maps from button click
        launch(url);
      },
      // template of the button
      // includes: icon, title
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset("assets/Icons/googlemap.jpg"),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(title.toUpperCase(), textAlign: TextAlign.center,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
