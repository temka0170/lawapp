import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  final Widget popup;
  final String img;
  final String title;
  const MenuItems({
    Key key,
    @required this.popup,
    this.img,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              //links popups to its button
              return popup;
            });
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
          child: Row(
            children: [
              img != null ? Expanded(
                flex: 1,
                child: Image.asset(
                  img,
                  fit: BoxFit.fill,
                ),
              ) : Container(),
              Expanded(
                flex: 2,
                child: img == null ? Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Center(
                    child: Text(title, textAlign: TextAlign.center,),
                  ),
                ) : Center(
                  child: Text(title, textAlign: TextAlign.center,),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded),
                splashColor: Colors.grey[400],
                color: Colors.grey[600],
                iconSize: 24.0,
                onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      //links popups to its button
                      return popup;
                    });
              },),
            ],
          ),
        ),
      ),
    );
  }
}
