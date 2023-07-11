import 'dart:ffi';

import 'package:flutter/material.dart';
import '../models/user_info.dart';

class profileProvider extends ChangeNotifier {
  int postCount = 0;
  String choice = "gönderiler";
  double  ? pre ;
  bool ?isLike;
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