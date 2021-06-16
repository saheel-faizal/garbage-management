import 'package:flutter/cupertino.dart';

class Garbage {
  static const String name = "Garbage";
  static const String BaseURL = "http://192.168.29.222/garbage_management/Admin/";
  static const String Desc = "Hang in there,\n as better times are ahead.";
  String imageAssetPath;
  String title;
  String desc;

  static const Color themecolor= Color(0xFF20B2AA);
  static Image background_image= Image.asset("assets/backgrounds/mc7.jpg");


  Garbage({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }
}

List<Garbage> getSlides(){

  List<Garbage> slides = new List<Garbage>();
  Garbage sliderModel = new Garbage();

  //1
  sliderModel.setDesc("Discover nearest Hospitals and Medical shops, get prescriptions..");
  sliderModel.setTitle("Search");
  sliderModel.setImageAssetPath("assets/backgrounds/ob1.jpg");
  slides.add(sliderModel);

  sliderModel = new Garbage();

  //2
  sliderModel.setDesc("Make our each step to fight against each pademic situations...");
  sliderModel.setTitle("Let's Fight");
  sliderModel.setImageAssetPath("assets/backgrounds/ob2.jpg");
  slides.add(sliderModel);

  sliderModel = new Garbage();

  //3
  sliderModel.setDesc("Let us make your life secured in our hands..");
  sliderModel.setTitle("Connect to All");
  sliderModel.setImageAssetPath("assets/backgrounds/ob3.jpg");
  slides.add(sliderModel);

  sliderModel = new Garbage();

  return slides;
}
