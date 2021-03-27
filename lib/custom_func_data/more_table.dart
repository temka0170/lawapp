import 'package:flutter/material.dart';
import 'package:project_1/navigating_pages/more.dart';
import 'package:project_1/zuvluguu_popups/Eruugiin_Hereg/Eruu_Hereg_Sub/EruugiinHereg.dart';
import 'package:project_1/zuvluguu_popups/Irgenii%20Hereg/IrgenHereg_Sub/firstIrgen.dart';
import 'package:project_1/zuvluguu_popups/NudeeNee.dart';
import 'package:project_1/zuvluguu_popups/Zahirgaanii_Hereg/ZahirgaaniiHereg.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

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
                popup: FirstIrgenBox(
                  title: 'Иргэний хэрэг',
                ),
              ),
              BoxItems(
                imgPath: 'assets/Icons/eruu.gif',
                popup: FirstEruuBox(
                  title: 'Эрүүгийн хэрэг',
                ),
              ),
              BoxItems(
                imgPath: 'assets/Icons/baiguullaga.gif',
                popup: ZahirgaaBox(
                  title: 'Захиргааны хэрэг',
                ),
              ),
              BoxItems(
                imgPath: 'assets/Icons/openeye.gif',
                popup: EyeBox(
                  title: 'Open your eyes',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
