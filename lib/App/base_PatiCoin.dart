import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/classes/nav_bar2.dart';
import 'package:streetanimals/pages/login_and_register/login_view.dart';
import 'package:streetanimals/riverpod_management.dart';
import 'package:streetanimals/utils/db_firebase.dart';

class base_PatiCoin extends ConsumerStatefulWidget {
  const base_PatiCoin({Key? key}) : super(key: key);

  @override
  ConsumerState<base_PatiCoin> createState() => _base_PatiCoinState();
}

class _base_PatiCoinState extends ConsumerState<base_PatiCoin> {
  void loadData()  async {
    await dbFirebase().getUser(FirebaseAuth.instance.currentUser?.uid).then((value) {
      ref.read(AuthenticationServiceRiverpod).loadUser(value!);
    });
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
    dbFirebase().getUser(FirebaseAuth.instance.currentUser?.uid).then((value) {
      authRiv.loadUser(value!);
    });
    ref.watch(refreshRiverpod).state;//kullanıcı çıkış veya giriş yaptığında çalışır
    if(authRiv.isUserLoggedIn()){
      return SafeArea(
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: navBar2(),
          body : navbarRiv.body(),
        ),
      );
    }else{
      return LoginView();
    }
  }
}
