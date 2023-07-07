import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:streetanimals/pages/cam_page.dart';
import 'package:streetanimals/pages/home_page.dart';
import 'package:streetanimals/pages/login_and_register/login_view.dart';
import 'package:streetanimals/pages/login_and_register/register_view.dart';
import 'package:streetanimals/pages/profile_page.dart';

class navbarProvider extends ChangeNotifier {
  int currentindex = 0;
  int? current;
  Color currentColor = Colors.white;
  void setcur() {
    current = currentindex;
    notifyListeners();
  }

  void setCurrentindex(int index) {
    currentindex = index;
    notifyListeners();
  }

  Widget body() {
    switch (currentindex) {
      case 0:
        return const MyHomePage();
      case 2:
        return const camPage();
      case 4:
        return const profilePage();
      case 5 :
        return const LoginView();
      case 6 :
        return const RegisterView();
      default:
        return const MyHomePage();
    }
  }
}
