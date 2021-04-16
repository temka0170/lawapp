import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ext_storage/ext_storage.dart';

//sub popups
// ignore: must_be_immutable
class AdvicePopup extends StatefulWidget {
  String title, descriptions, url;

  AdvicePopup({Key key, this.title, this.descriptions, this.url})
      : super(key: key);

  @override
  _AdviceState createState() => _AdviceState();
}

class _AdviceState extends State<AdvicePopup> {
  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getExternalStorageDirectory();
      var path = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_DOWNLOADS);

      await dio.download(widget.url, "$path/${widget.title}.pdf");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    //blurred background
    return BackdropFilter(
      filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 0.0,
            top: 0.0,
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: new BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x14000000),
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 0)
                ],
              ),
              child: IconButton(
                iconSize: 12,
                color: Color(0xff23233c),
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          //checks if there's url in data dart values, and shows download button according to url
          widget.url != null ? Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    downloadFile();
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.05,
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
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.download_rounded,
                          color: Color(0xfff8931f),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Татаж авах",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff23233c),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.download_rounded,
                          color: Color(0xfff8931f),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ) : Container(),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.88,
              height: MediaQuery.of(context).size.height * 0.68,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 10),
                          blurRadius: 10),
                    ]),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        height: 29,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            //get values in data.dart
                            widget.title,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xff23233c),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15),
                          child: Text(
                            //get values in data.dart
                            widget.descriptions,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
