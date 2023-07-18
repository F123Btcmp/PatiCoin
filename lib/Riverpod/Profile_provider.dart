import 'package:flutter/material.dart';
import 'package:streetanimals/models/post_info.dart';

class profileProvider extends ChangeNotifier {
  int postCount = 0;
  String choice = "gönderiler";
  double  ? pre ;
  bool ?isLike;
  List<Postinfo> ? MyPosts;

  void setMyPosts(List<Postinfo> posts){
    MyPosts = posts ;
    notifyListeners();
  }
  void setChoice(String page){
    choice = page;
    notifyListeners();
  }
  void setpre(double size){
    pre = size ;
  }
  void toucisLike(){
    isLike != isLike;
  }

  int getPostCount() {
    return postCount ;
  }
  void downtopostCount(){
    postCount -= 1 ;
  }
}