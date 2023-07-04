import 'package:flutter/material.dart';

class profileProvider extends ChangeNotifier {
  int postCount = 3;

  int getPostCount() {
    return postCount ;
  }
  void downtopostCount(){
    postCount -= 1 ;
  }
}