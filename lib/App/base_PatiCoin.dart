import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/classes/nav_bar2.dart';
import 'package:streetanimals/pages/login_and_register/login_view.dart';
import 'package:streetanimals/riverpod_management.dart';
import '../classes/nav_bar.dart';

class base_PatiCoin extends ConsumerStatefulWidget {
  const base_PatiCoin({Key? key}) : super(key: key);

  @override
  ConsumerState<base_PatiCoin> createState() => _base_PatiCoinState();
}

class _base_PatiCoinState extends ConsumerState<base_PatiCoin> {
  void loadData()  async {

  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    var navbarRiv = ref.watch(navbarRiverpod);
    var authRiv = ref.read(AuthenticationServiceRiverpod);
    authRiv.setisActive(authRiv.isUserLoggedIn());
    ref.watch(AuthenticationServiceRiverpod).refresh; // gailba silebiliriz bakacağım.
    if(authRiv.isUserLoggedIn()){
      return SafeArea(
        child: Scaffold(
          bottomNavigationBar: navBar2(),
          body : navbarRiv.body(),
        ),
      );
    }else{
      return LoginView();
    }
  }
}
