import 'package:flutter/material.dart';
import 'package:project_1/zuvluguu_popups/zuvluguupopup.dart';

import 'calculator_popup.dart';
import '../zuvluguu_popups/zuvluguupopup.dart';

//setter of calculator, more section carousel
class AdModel {
  String adImgPath;
  String adDesc;
  int idex;

  AdModel({this.adImgPath, this.adDesc, this.idex});

  void setAdPath(String getImgPath) {
    adImgPath = getImgPath;
  }

  void setAdDesc(String getDesc) {
    adDesc = getDesc;
  }

  void setIdx(int getIdx) {
    idex = getIdx;
  }

  String getAssetPath() {
    return adImgPath;
  }

  String getDescript() {
    return adDesc;
  }

  int getIdex() {
    return idex;
  }
}

//values of calculator, more section carousel
List<AdModel> getAds() {
  List<AdModel> ads = new List<AdModel>();
  AdModel ad = new AdModel();

  ad.setAdPath("assets/images/galaxy.jpg");
  ad.setAdDesc("Tanii Aylaliin hutuch 0");
  ad.idex = 0;
  ads.add(ad);

  ad = new AdModel();
  ad.setAdPath("assets/images/galaxy.jpg");
  ad.setAdDesc("Tanii aylaliin hutuch 1");
  ad.idex = 1;
  ads.add(ad);

  ad = new AdModel();
  ad.setAdPath("assets/images/galaxy.jpg");
  ad.setAdDesc("Tanii aylaliin hutuch 2");
  ad.idex = 2;
  ads.add(ad);

  ad = new AdModel();
  ad.setAdPath("assets/images/galaxy.jpg");
  ad.setAdDesc("Tanii aylaliin hutuch 3");
  ad.idex = 3;
  ads.add(ad);

  return ads;
}

//setter of home section carousel
class MainModel {
  String mainImgPath;
  String mainDesc;

  MainModel({this.mainImgPath, this.mainDesc});

  void setAdPath(String getImgPath) {
    mainImgPath = getImgPath;
  }

  void setAdDesc(String getDesc) {
    mainDesc = getDesc;
  }

  String getAssetPath() {
    return mainImgPath;
  }

  String getDescript() {
    return mainDesc;
  }
}

//values of home section carousel
List<MainModel> getMains() {
  List<MainModel> mains = new List<MainModel>();
  MainModel main = new MainModel();

  main.setAdPath("assets/images/galaxy.jpg");
  main.setAdDesc("Tanii Aylaliin hutuch");
  mains.add(main);

  main = new MainModel();
  main.setAdPath("assets/images/galaxy.jpg");
  main.setAdDesc("Aylaliin hutuch");
  mains.add(main);

  main = new MainModel();
  main.setAdPath("assets/images/galaxy.jpg");
  main.setAdDesc("Aylaliin hutuch");
  mains.add(main);

  main = new MainModel();
  main.setAdPath("assets/images/galaxy.jpg");
  main.setAdDesc("Aylaliin hutuch");
  mains.add(main);

  return mains;
}

//home section popup values
List<CustomDialogBox> getPopups() {
  List<CustomDialogBox> popups = new List<CustomDialogBox>();
  CustomDialogBox popup = new CustomDialogBox();

  popup.descriptions = "Hello World!";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 0";
  popups.add(popup);

  popup = new CustomDialogBox();
  popup.descriptions = "aylaliin hutuch";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 1";
  popups.add(popup);

  popup = new CustomDialogBox();
  popup.descriptions = "aylaliin hutuch";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 2";
  popups.add(popup);

  //temporary solution of index number difference from timer class,
  //timer either sets index 1 more than list length or goes back to
  //initial index after 3rd slide
  popup = new CustomDialogBox();
  popup.descriptions = "aylaliin hutuch";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 3";
  popups.add(popup);

  popup = new CustomDialogBox();
  popup.descriptions = "aylaliin hutuch";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 3";
  popups.add(popup);

  return popups;
}

//calculator, more section popup values
List<CustomDialogBox> adPopups() {
  List<CustomDialogBox> popups = new List<CustomDialogBox>();
  CustomDialogBox popup = new CustomDialogBox();

  popup.descriptions = "aylaliin hutuch 0";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "tanii aylaliin hutuch";
  popups.add(popup);

  popup = new CustomDialogBox();
  popup.descriptions = "aylaliin hutuch 1";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "aylaliin hutuch";
  popups.add(popup);

  popup = new CustomDialogBox();
  popup.descriptions = "aylaliin hutuch 2";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "aylaliin hutuch";
  popups.add(popup);

  //due to Timer class current index is passing more than list length
  //thus throwing an exception,
  popup = new CustomDialogBox();
  popup.descriptions = "aylaliin hutuch 3";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "aylaliin hutuch";
  popups.add(popup);
  
  return popups;
}

//values of more section q&a section
List<QuestionBox> questionPop() {
  List<QuestionBox> qstPops = new List<QuestionBox>();
  QuestionBox qstPop = new QuestionBox();

  qstPop.question = 'Иргэний хэргийн хөөн хэлэлцэх хугацааг юу гэж ойлгох вэ?';
  qstPop.answer =
      'Иргэн, хуулийн этгээдээс зөрчигдсөн эрхээ хамгаалуулахын тулд шүүх, арбитр зэрэг байгууллагад нэхэмжлэл гаргаж болох хугацааг хуулиар тогтоосныг хөөн хэлэлцэх хугацаа гэнэ. Хуульд өөрөөр заагаагүй бол хөөн хэлэлцэх ерөнхий хугацаа 10 жил, гэрээний үүрэгтэй холбоотой шаардлага гаргах хөөн хэлэлцэх хугацаа 3 жил, үл хөдлөх эд хөрөнгөтэй холбоотой гэрээний үүрэгтэй холбоотой хөөн хэлэлцэх хугацаа 6 жил гэх мэт тусгай асуудлаар нь зааж өгсөн. Хөөн хэлэлцэх хугацаа өнгөрсөн бол үүрэг гүйцэтгэгч үүрэг гүйцэтгэхээс татгалзах эрхтэй байдаг.';
  qstPops.add(qstPop);

  qstPop = new QuestionBox();
  qstPop.question =
      'Шүүхэд хандмаар байгаа ч хариуцагч этгээдийн оршин суугаа хаягийг мэдэхгүй байгаа тохиолдолд яах вэ?';
  qstPop.answer =
      'Хариуцагчийн оршин суугаа газрын хаяг мэдэгдэхгүй байвал түүнийг эрэн сурвалжлуулахаар шүүхэд хүсэлт гаргаж болно. Хариуцагчийг эрэн сурвалжлах тухай шүүхийн шийдвэр гарсан тохиолдолд цагдаагийн байгууллага тухайн этгээдийн оршин суугаа хаягийг тогтоохоор эрэн сурвалжлах ажиллагааг хийж гүйцэтгэнэ.';
  qstPops.add(qstPop);

  qstPop = new QuestionBox();
  qstPop.question =
      'Зээлийн гэрээ бичгээр байгуулаагүй ч гэсэн хүү нэхэж болох уу?';
  qstPop.answer =
      'Монгол Улсын Иргэний хуульд “Хуульд өөрөөр заагаагүй бол хүү тогтоосон бол зээлийн гэрээг бичгээр хийнэ. Энэ шаардлагыг хангаагүй бол хүү авах эрхээ алдана” гэж зохицуулсан байдаг. Иймд зээл олгохдоо хүү төлөхөөр тохиролцсон хэдий ч бичгээр гэрээ байгуулаагүй, зөвхөн амаар тохиролцсон тохиолдолд зээлдүүлэгч хүү шаардах эрхгүй болно.';
  qstPops.add(qstPop);

  qstPop = new QuestionBox();
  qstPop.question =
      'Орон сууц худалдаж авахаар гэрээ байгуулахад юуг анхаарах ёстой вэ?';
  qstPop.answer =
      'Орон сууц худалдах, худалдан авах гэрээ байгуулахдаа гэрээгээ улсын бүртгэлийн газарт бүртгүүлэх ёстой. Учир нь үл хөдлөх эрх хөрөнгө өмчлөх эрх хэлцлийн үндсэн дээр нэг этгээдээс нөгөөд шилжиж байгаа бол уг хэлцлийг үл хөдлөх эд хөрөнгийн бүртгэлийн газар бүртгүүлснээр тухайн үл хөдлөх эд хөрөнгийн өмчлөх эрх худалдан авагчид шилжиж, өмнөх өмчлөгч буюу худалдагчийн өмчлөх эрх дуусгавар болдог. Хэрэв уг шаардлагыг хангаагүй бол талуудын хооронд байгуулагдсан худалдах, худалдан авах гэрээ нь Иргэний хуульд заасан хүчин төгөлдөр бус байх хэлцэлд тооцогдох хууль зүйн үр дагаврыг бий болгоно.';
  qstPops.add(qstPop);

  qstPop = new QuestionBox();
  qstPop.question =
      'Шүүхийн шийдвэрээр тогтоосон тэтгэлгийг хугацаандаа төлөөгүй тохиолдолд алданги шаардаж болох уу?';
  qstPop.answer =
      'Хэрэв шүүхийн шийдвэрээр тогтоосон тэтгэлгийг хугацаанд нь төлөөгүй бол хожимдуулсан хоног тутамд тогтоосон тэтгэлгийн үнийн дүнгийн 0,5 хувиар алданги гаргуулахаар шаардаж болно. Гэхдээ алдангийн нийт хэмжээ төлөгдөөгүй тэтгэлгийн үнийн дүнгийн 50 хувиас хэтрэхгүй байхыг анхаарах нь зүйтэй.';
  qstPops.add(qstPop);

  return qstPops;
}

//values of more section advice section
List<ZuvluguuPopup> morePopups() {
  List<ZuvluguuPopup> popups = new List<ZuvluguuPopup>();
  ZuvluguuPopup popup = new ZuvluguuPopup();

  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 0";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Нэхэмжлэгч: \n\tОвог, нэр: ................. ургийн овогтой .................... -ний ....................... \n\tХаяг: ......................................................................................................... \n\tУтас: ............................ \n\tХариуцагч:";
  popup.title = "idx 1";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 2";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 3";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 4";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 5";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 6";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 7";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 8";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 9";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 10";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 11";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 12";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 13";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 14";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 15";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 16";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 17";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 18";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 19";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 20";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 21";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 22";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 23";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions =
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi non quis exercitationem culpa nesciunt nihil aut nostrum explicabo reprehenderit optio amet ab temporibus asperiores quasi cupiditate. Voluptatum ducimus voluptates voluptas?";
  popup.title = "idx 24";
  popups.add(popup);

  return popups;
}
