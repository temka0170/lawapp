import 'package:flutter/material.dart';
import 'package:project_1/zuvluguupopup.dart';

import 'customdialog.dart';
import 'zuvluguupopup.dart';

//onboarding screen ii zuragnud
class SliderModel {
  String imgPath;

  SliderModel({this.imgPath});

  void setImgPath(String getImgPath) {
    imgPath = getImgPath;
  }

  String getImgAssetPath() {
    return imgPath;
  }
}

//onboard screen ii zuragnuud
List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  sliderModel.setImgPath("assets/splashscreen/start1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  sliderModel.setImgPath("assets/splashscreen/start2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  sliderModel.setImgPath("assets/splashscreen/start3.png");
  slides.add(sliderModel);

  return slides;
}

//getter listruu utga damjuulah
class AdModel {
  String adImgPath;
  String adDesc;

  AdModel({this.adImgPath, this.adDesc});

  void setAdPath(String getImgPath) {
    adImgPath = getImgPath;
  }

  void setAdDesc(String getDesc) {
    adDesc = getDesc;
  }

  String getAssetPath() {
    return adImgPath;
  }

  String getDescript() {
    return adDesc;
  }
}

//calculator, more hesgiin carousel utga awah
List<AdModel> getAds() {
  List<AdModel> ads = new List<AdModel>();
  AdModel ad = new AdModel();

  ad.setAdPath("assets/images/galaxy.jpg");
  ad.setAdDesc("Tanii Aylaliin hutuch");
  ads.add(ad);

  ad = new AdModel();
  ad.setAdPath("assets/images/galaxy.jpg");
  ad.setAdDesc("bla bla bla");
  ads.add(ad);

  ad = new AdModel();
  ad.setAdPath("assets/images/galaxy.jpg");
  ad.setAdDesc("test test test");
  ads.add(ad);

  ad = new AdModel();
  ad.setAdPath("assets/images/galaxy.jpg");
  ad.setAdDesc("Hello World!");
  ads.add(ad);

  return ads;
}

//getter listruu utga damjuulah
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

//home hesgiin carousel utga awah heseg
List<MainModel> getMains() {
  List<MainModel> mains = new List<MainModel>();
  MainModel main = new MainModel();

  main.setAdPath("assets/images/galaxy.jpg");
  main.setAdDesc("Tanii Aylaliin hutuch");
  mains.add(main);

  main = new MainModel();
  main.setAdPath("assets/images/galaxy.jpg");
  main.setAdDesc("bla bla bla");
  mains.add(main);

  main = new MainModel();
  main.setAdPath("assets/images/galaxy.jpg");
  main.setAdDesc("test test test");
  mains.add(main);

  main = new MainModel();
  main.setAdPath("assets/images/galaxy.jpg");
  main.setAdDesc("Hello World!");
  mains.add(main);

  return mains;
}

//home hesgiin popup utga awah heseg
List<CustomDialogBox> getPopups() {
  List<CustomDialogBox> popups = new List<CustomDialogBox>();
  CustomDialogBox popup = new CustomDialogBox();

  popup.descriptions = "Hello World!";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 0";
  popups.add(popup);

  popup = new CustomDialogBox();
  popup.descriptions = "Hello World!";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 1";
  popups.add(popup);

  popup = new CustomDialogBox();
  popup.descriptions = "Hello World!";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 2";
  popups.add(popup);

  //suuliin 2 utga adilhan bh, timer deere currentpage maani
  //ene listnii lengthees 1 eer ih bolsnii daraa 0 ruu butsaj bga bolhor
  //index aldaa zaaj bga uchraas suulin 2 utgiig adilhan awsan
  popup = new CustomDialogBox();
  popup.descriptions = "Hello World!";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 3";
  popups.add(popup);

  popup = new CustomDialogBox();
  popup.descriptions = "Hello World!";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 3";
  popups.add(popup);

  return popups;
}

List<CustomDialogBox> adPopups() {
  List<CustomDialogBox> popups = new List<CustomDialogBox>();
  CustomDialogBox popup = new CustomDialogBox();

  popup.descriptions = "Hello World!";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 0";
  popups.add(popup);

  popup = new CustomDialogBox();
  popup.descriptions = "Hello World!";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 1";
  popups.add(popup);

  popup = new CustomDialogBox();
  popup.descriptions = "Hello World!";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 2";
  popups.add(popup);

  //suuliin 2 utga adilhan bh, timer deere currentpage maani
  //ene listnii lengthees 1 eer ih bolsnii daraa 0 ruu butsaj bga bolhor
  //index aldaa zaaj bga uchraas suulin 2 utgiig adilhan awsan
  popup = new CustomDialogBox();
  popup.descriptions = "Hello World!";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 3";
  popups.add(popup);

  popup = new CustomDialogBox();
  popup.descriptions = "Hello World!";
  popup.img = Image.asset("assets/images/galaxy.jpg");
  popup.title = "idx 3";
  popups.add(popup);

  return popups;
}

//more hesgiin 2doh popup
List<ZuvluguuPopup> morePopups() {
  List<ZuvluguuPopup> popups = new List<ZuvluguuPopup>();
  ZuvluguuPopup popup = new ZuvluguuPopup();

  popup.descriptions = "Hello World!";
  popup.title = "idx 0";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 1";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 2";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 3";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 4";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 5";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 6";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 7";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 8";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 9";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 10";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 11";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 12";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 13";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 14";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 15";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 16";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 17";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 18";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 19";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 20";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 21";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 22";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 23";
  popups.add(popup);

  popup = new ZuvluguuPopup();
  popup.descriptions = "Hello World!";
  popup.title = "idx 24";
  popups.add(popup);

  return popups;
}
