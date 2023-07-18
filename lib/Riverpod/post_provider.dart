import 'package:flutter/material.dart';
import 'package:streetanimals/models/post_info.dart';

class postProvider extends ChangeNotifier{
  String? imageadress ;
  Postinfo ?myPost;

  void setimageadress(String imageadress){
    this.imageadress = imageadress;
    notifyListeners();
  }
  void setmyPost(Postinfo myPost){
    this.myPost= myPost;
    notifyListeners();
  }
}