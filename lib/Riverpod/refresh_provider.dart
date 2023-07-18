import 'package:flutter/material.dart';

class refreshProvider extends ChangeNotifier{
  bool ? state; ///kullanıcı çıkış veya giriş yaptığında çalışır

  void changeState(){
    state != state;
    notifyListeners();
  }

}