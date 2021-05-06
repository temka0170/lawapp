import 'package:flutter/material.dart';
import 'package:project_1/navigating_pages/more.dart';
import 'package:project_1/advice_popups/criminal_case/Criminal_case_subdirectory/criminal_case.dart';
import 'package:project_1/advice_popups/civil_case/civil_subdirectory/first_civil.dart';
import 'package:project_1/advice_popups/open_eyes.dart';
import 'package:project_1/advice_popups/authority_case/authority_case.dart';

class MoreButtons extends StatelessWidget {
  const MoreButtons();

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController(
      initialScrollOffset: 100.0,
      keepScrollOffset: true,
    );
    return SingleChildScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              BoxItems(
                imgPath: 'assets/Icons/irgen.gif',
                popup: FirstCivilBox(
                  title: 'Иргэний хэрэг'.toUpperCase(),
                ),
              ),
              BoxItems(
                imgPath: 'assets/Icons/eruu.gif',
                popup: Criminal(
                  title: 'Эрүүгийн хэрэг'.toUpperCase(),
                ),
              ),
              BoxItems(
                imgPath: 'assets/Icons/baiguullaga.gif',
                popup: AuthorityBox(
                  title: 'Захиргааны хэрэг'.toUpperCase(),
                ),
              ),
              BoxItems(
                imgPath: 'assets/Icons/openeye.gif',
                popup: EyeBox(
                  title: 'Нүдээ нээ'.toUpperCase(),
                ),
              ),
              // BoxItems(
              //   imgPath: 'assets/Icons/irgen.gif',
              //   popup: HealthySociety(
              //     title: 'ЭРҮҮЛ НИЙГЭМ',
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
