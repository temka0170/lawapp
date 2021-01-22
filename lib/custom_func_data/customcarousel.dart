import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_1/custom_func_data/customdialog.dart';
import 'data.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

//calculator, more hesgiin carousel border
class FirstWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xffff4f5fa)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.5);
    path_0.quadraticBezierTo(size.width * 0.95, size.height * 0.73,
        size.width * 0.82, size.height * 0.80);
    path_0.cubicTo(size.width * 0.72, size.height * 0.85, size.width * 0.68,
        size.height * 0.78, size.width * 0.47, size.height * 0.78);
    path_0.quadraticBezierTo(
        size.width * 0.21, size.height * 0.80, 0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SecondWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = new Paint()
      ..color = Color(0xfff8931f).withOpacity(0.4)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.93);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.4);
    path_0.quadraticBezierTo(size.width * 0.94, size.height * 0.65,
        size.width * 0.81, size.height * 0.74);
    path_0.cubicTo(size.width * 0.67, size.height * 0.79, size.width * 0.63,
        size.height * 0.73, size.width * 0.45, size.height * 0.72);
    path_0.quadraticBezierTo(
        size.width * 0.24, size.height * 0.72, 0, size.height * 0.93);
    path_0.close();

    canvas.drawPath(path_0, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//home hesgiin carousel border
class MainWave1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xfff8931f).withOpacity(0.4)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.00, size.height * 0.58);
    path_0.lineTo(size.width * 0.00, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.93);
    path_0.quadraticBezierTo(size.width * 0.72, size.height * 0.65,
        size.width * 0.51, size.height * 0.64);
    path_0.cubicTo(size.width * 0.32, size.height * 0.62, size.width * 0.24,
        size.height * 0.69, size.width * 0.18, size.height * 0.68);
    path_0.quadraticBezierTo(size.width * 0.11, size.height * 0.69,
        size.width * 0.00, size.height * 0.58);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MainWave2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xffff4f5fa)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.00, size.height * 0.66);
    path_0.lineTo(size.width * 0.00, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.quadraticBezierTo(size.width * 0.72, size.height * 0.71,
        size.width * 0.51, size.height * 0.69);
    path_0.cubicTo(size.width * 0.32, size.height * 0.67, size.width * 0.24,
        size.height * 0.75, size.width * 0.18, size.height * 0.75);
    path_0.quadraticBezierTo(size.width * 0.11, size.height * 0.76,
        size.width * 0.00, size.height * 0.66);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//calculator, more page iin carousel
// ignore: must_be_immutable
class AdScreen extends StatefulWidget {
  @override
  _AdScreenState createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {
  //data.dart deer get funcuuda hiisen
  List<AdModel> ads = new List<AdModel>();
  List<CustomDialogBox> cmpopups = new List<CustomDialogBox>();
  int _currentAd = 0;
  //automataar tab soligdoh timer
  Timer timer;
  PageController adController = new PageController(initialPage: 0);

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    //data.dart iin getter
    ads = getAds();
    cmpopups = adPopups();

    // automat tab soligdoh, 4 secund bolgon tab soligdono
    if (ads != null) {
      timer = Timer.periodic(Duration(seconds: 4), (_) {
        if (adController.hasClients) {
          if (_currentAd == ads.length) {
            adController.animateToPage(0,
                duration: Duration(seconds: 1), curve: Curves.easeOut);
          } else {
            adController.animateToPage(_currentAd++,
                duration: Duration(seconds: 1), curve: Curves.easeOut);
          }
        }
      });
    }
  }

  //ymr tab deer ywj bga indicator
  Widget adIndicator(bool currentIdx) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: currentIdx ? Color(0xfff9931f) : Color(0xffe3e3e3),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: adController,
          itemCount: ads.length,
          onPageChanged: (idx) {
            setState(() {
              _currentAd = idx;
            });
          },
          itemBuilder: (context, index) {
            //AdTile n carousel iin 1 Tab
            return AdTile(
              imgPath: ads[index].getAssetPath(),
              desc: ads[index].getDescript(),
            );
          },
        ),
        //calculator, more hesgiin carousel iin deed taliin border
        ClipPath(
          clipper: WaveClipperTwo(
            flip: true,
            reverse: false,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 85.0,
            color: Color(0xfff8931f).withOpacity(0.4),
          ),
        ),
        ClipPath(
          clipper: WaveClipperTwo(
            flip: true,
            reverse: false,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 70.0,
            color: Color(0xfff8931f),
          ),
        ),
        //calculator, more hesgiin carouseliin dood taliin border
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 377),
          painter: SecondWave(),
        ),
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 377),
          painter: FirstWave(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 320.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //tab indicator oruulsan itemiin toogor garna
              for (int i = 0; i < ads.length; i++)
                _currentAd == i ? adIndicator(true) : adIndicator(false),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  //popup n carouseliin indextei tentsuu
                  //data.dart deer utga-uudaa awna
                  return cmpopups[_currentAd];
                });
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 294,
            //borderiin canvas zaawal MainTile iin deer garaad bsn uchraas
            //canvas iinha deer n transparent gesturedetector nemsen
            color: Color(0xffffffff).withOpacity(0),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class AdTile extends StatefulWidget {
  String imgPath;
  String desc;
  AdTile({this.imgPath, this.desc});

  @override
  _AdTileState createState() => _AdTileState();
}

class _AdTileState extends State<AdTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 376,
            child: FittedBox(
              child: Image.asset(widget.imgPath),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 95.0, left: 44.0),
            child: Text(
              widget.desc,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Color(0xffffffff),
                fontSize: 25,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//home hesgiin carousel
// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //data.dart iin get funcuud
  List<MainModel> mains = new List<MainModel>();
  List<CustomDialogBox> popups = new List<CustomDialogBox>();
  int _currentMain = 0;
  Timer timerMain;
  PageController mainController = new PageController(initialPage: 0);

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    mains = getMains();
    popups = getPopups();

    if (mains != null) {
      timerMain = Timer.periodic(Duration(seconds: 4), (_) {
        if (mainController.hasClients) {
          if (_currentMain == mains.length) {
            mainController.animateToPage(0,
                duration: Duration(seconds: 1), curve: Curves.easeOut);
            _currentMain = 0;
          } else {
            mainController.animateToPage(_currentMain++,
                duration: Duration(seconds: 1), curve: Curves.easeOut);
          }
        }
      });
    }
  }

  Widget adIndicator(bool currentIdx) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: currentIdx ? Color(0xfff9931f) : Color(0xffe3e3e3),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: mainController,
          itemCount: mains.length,
          onPageChanged: (idx) {
            setState(() {
              _currentMain = idx;
            });
          },
          itemBuilder: (context, index) {
            return MainTile(
              imgPath: mains[index].getAssetPath(),
              desc: mains[index].getDescript(),
            );
          },
        ),
        //home carouseliin dood borderuud
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 295),
          painter: MainWave1(),
        ),
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 295),
          painter: MainWave2(),
        ),
        //indicator
        Padding(
          padding: const EdgeInsets.only(top: 210.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < mains.length; i++)
                _currentMain == i ? adIndicator(true) : adIndicator(false),
            ],
          ),
        ),
        //carousel deer darahad popup garj ireh func
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  //popup n carouseliin indextei tentsuu
                  //data.dart deer utga-uudaa awna
                  return popups[_currentMain];
                });
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 294,
            //borderiin canvas zaawal MainTile iin deer garaad bsn uchraas
            //canvas iinha deer n transparent gesturedetector nemsen
            color: Color(0xffffffff).withOpacity(0),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class MainTile extends StatefulWidget {
  String imgPath;
  String desc;
  MainTile({this.imgPath, this.desc});

  @override
  _MainTileState createState() => _MainTileState();
}

class _MainTileState extends State<MainTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 294,
            child: FittedBox(
              child: Image.asset(widget.imgPath),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 95.0, left: 44.0),
            child: Text(
              widget.desc,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Color(0xffffffff),
                fontSize: 25,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
