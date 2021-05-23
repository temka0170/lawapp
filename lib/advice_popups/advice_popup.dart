import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:permission_handler/permission_handler.dart';

// Popup template
// ignore: must_be_immutable
class AdvicePopup extends StatefulWidget {
  String title, descriptions, url;

  AdvicePopup({Key key, this.title, this.descriptions, this.url})
      : super(key: key);

  @override
  _AdviceState createState() => _AdviceState();
}

class _AdviceState extends State<AdvicePopup> {

  static var httpClient = new HttpClient();
  Future<String> _downloadFile(String url, String fileName, String dir) async {
    HttpClient httpClient = new HttpClient();
    File file;
    String filePath = '';

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if(response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        filePath = '$dir/$fileName.docx';
        file = File(filePath);
        await file.writeAsBytes(bytes);
      }
      else
        filePath = 'Error code: '+response.statusCode.toString();
    }
    catch(ex){
      filePath = 'Can not fetch url';
    }

    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    //blurred background
    return BackdropFilter(
      filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(//popup widget
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
      //only pops most recent popup instead of all popups
      onWillPop: () async => false,
      child: Stack(
        children: <Widget>[
          //back button
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
              child: InkWell(
                onTap: () async {
                  // asking for storage permission
                  await Permission.storage.request().isGranted;
                  // getting download directory
                  var path = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_DOWNLOADS);
                  setState(() {
                    // download function
                    _downloadFile(widget.url, widget.title, path);
                    // successfully downloaded reminder, pops current popup
                    showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            Future.delayed(Duration(milliseconds: 1200),
                                    () {
                                  Navigator.of(context).pop(true);
                                });
                            return AlertDialog(
                              backgroundColor: Colors.transparent,
                              contentPadding: EdgeInsets.all(0.0),
                              content: Container(
                                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  // profile outer line gradient
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(241, 103, 48, 1.0),
                                      Color.fromRGBO(249, 167, 25, 1.0)
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                  ),
                                ),
                                child: Text(
                                  "Амжилттай татаж авлаа!",
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 16.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          });
                    }
                  );
                },
                // download button widget
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
          ) : Container(), // shows empty container if url variable is null
          // container of contents in the popup
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
                // longer contents are scrollable
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.74,
                            decoration: new BoxDecoration(
                              color: Color(0xfff78c1e),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                    spreadRadius: 0,),
                              ],
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  // Title shown in the Top section,
                                  widget.title.toUpperCase(),
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Color(0xffffffff),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Seperate padding
                      SizedBox(
                        height: 15,
                      ),
                      // main content of the popup
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15),
                          child: Text(
                            // main content of the popup
                            widget.descriptions,
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.justify,
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
