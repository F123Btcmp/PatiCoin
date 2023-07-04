import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/pages/login_and_register/login_view.dart';
import 'package:streetanimals/pages/login_and_register/register_view.dart';
import 'package:streetanimals/pages/profile_page.dart';
import 'package:streetanimals/classes/app_bar_profile.dart';
import 'package:streetanimals/riverpod_management.dart';

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
      ],
    );
  }
}
