import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/riverpod_management.dart';
import '../classes/nav_bar.dart';

class base_PatiCoin extends ConsumerStatefulWidget {
  const base_PatiCoin({Key? key}) : super(key: key);

  @override
  ConsumerState<base_PatiCoin> createState() => _base_PatiCoinState();
}

class _base_PatiCoinState extends ConsumerState<base_PatiCoin> {
  void loadData()  async {
    // örnek gecikme
    var authRiv = ref.read(AuthenticationServiceRiverpod);
    authRiv.setisActive(authRiv.isUserLoggedIn());

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
    ref.watch(AuthenticationServiceRiverpod).refresh; // gailba silebiliriz bakacağım.
    return Scaffold(
      bottomNavigationBar: navBar(),
      body : navbarRiv.body(),
    );
  }
}
