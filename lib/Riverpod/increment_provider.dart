import 'package:flutter/material.dart';

class IncrementProvider extends ChangeNotifier{
  int number = 0;

  void arttir(){
    number = number + 1;
    notifyListeners();
  }
}