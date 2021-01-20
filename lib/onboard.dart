import 'package:flutter/material.dart';
import 'data.dart';
import 'main.dart';

class OnBoardSc extends StatefulWidget {
  @override
  _OnBoardScState createState() => _OnBoardScState();
}

class _OnBoardScState extends State<OnBoardSc> {
  //data.dart iin get func
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget pageIndicator(bool isCurrent) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrent ? 10.0 : 6.0,
      width: isCurrent ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrent ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: slides.length,
            onPageChanged: (val) {
              setState(() {
                currentIndex = val;
              });
            },
            itemBuilder: (context, index) {
              return SliderTile(
                imgAssetPath: slides[index].getImgAssetPath(),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: currentIndex != slides.length - 1
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            pageController.animateToPage(slides.length - 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linear);
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            for (int i = 0; i < slides.length; i++)
                              currentIndex == i
                                  ? pageIndicator(true)
                                  : pageIndicator(false),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            pageController.animateToPage(currentIndex + 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linear);
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Main()),
                            );
                          },
                          child: Text(
                            "Welcome!",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SliderTile extends StatefulWidget {
  String imgAssetPath;
  SliderTile({this.imgAssetPath});

  @override
  _SliderTileState createState() => _SliderTileState();
}

class _SliderTileState extends State<SliderTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      //zurgaa fullscreen bolgoj sungasan
      child: FittedBox(
        child: Image.asset(widget.imgAssetPath),
        fit: BoxFit.fill,
      ),
    );
  }
}
