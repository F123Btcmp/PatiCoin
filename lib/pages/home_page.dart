import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/UI/post_ui.dart';
import 'package:streetanimals/pages/cam_page.dart';
import 'package:streetanimals/pages/login_and_register/login_view.dart';
import 'package:streetanimals/pages/login_and_register/register_view.dart';
import 'package:streetanimals/pages/profile_page.dart';
import 'package:streetanimals/riverpod_management.dart';

import '../classes/nav_bar.dart';
import 'denemepage.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState <MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var navbarRiv = ref.read(navbarRiverpod);
    var authRiv = ref.read(AuthenticationServiceRiverpod);
    var user = FirebaseAuth.instance.currentUser;
    var name = user?.email;
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              postUi(),
              SizedBox(height:size.height * 0.02),
              postUi(),

              Text(
                authRiv.isActive!
                    ? name ?? "girişyok"
                    : "giriş yok"
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => profilePage()));
                  },
                  child: Text("Profile Page")
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  child: Text("Login page")
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterView()));
                  },
                  child: Text("Register Page")
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => camPage()));
                  },
                  child: Text("Cam Page")
              ),
              ElevatedButton(
                  onPressed: () {
                    authRiv.signOut().then((value) => authRiv.refreshRiv());
                  },
                  child: const Text("Çıkış Yap")
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context) => denemePage()));
                  },
                  child: const Text("ADMİN ODASI")
              ),
              SizedBox(height: size.height * 0.1),
            ],
          ),
        ),
      );
  }
}
