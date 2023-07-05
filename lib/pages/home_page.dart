import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/models/post_info.dart';
import 'package:streetanimals/pages/login_and_register/login_view.dart';
import 'package:streetanimals/pages/login_and_register/register_view.dart';
import 'package:streetanimals/riverpod_management.dart';
import 'package:streetanimals/utils/db_firebase.dart';

import '../models/user_info.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState <MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var navbarRiv = ref.read(navbarRiverpod);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("asfafasfas"),
        ElevatedButton(
            onPressed: () {
              navbarRiv.setCurrentindex(1);
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
              Userinfo user = Userinfo(name: "Abuziddin", surname: "Kemal", email: "abkemal@hotmail.com", password: "admin",coin: 0);
              Postinfo post = Postinfo(user_id: user.id, Province: "istanbul", district: "Başakşehir", image_list: ["afafsafsafas","asfasasfasf"]);
              dbFirebase().createUser(user);
            },
            child: Text("Kayıt ekle")
        ),
        ElevatedButton(
            onPressed: () {
            },
            child: Text("Kayıt sil")
        ),
      ],
    );
  }
}
