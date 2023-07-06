import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';
import 'package:streetanimals/pages/login_and_register/components/button.dart';
import 'package:streetanimals/pages/login_and_register/components/cat.dart';
import 'package:streetanimals/pages/login_and_register/components/login_options.dart';
import 'package:streetanimals/pages/login_and_register/components/register_text.dart';
import 'package:streetanimals/Riverpod/email_sign_provider.dart';

import '../../riverpod_management.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authRiv = ref.read(AuthenticationServiceRiverpod);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/background.bmp',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          const Cat(),
          const Padding(
            padding: EdgeInsets.only(
              top: 155,
              left: 177,
            ),
            child: Text(
              'PatiCoin',
              style: TextStyle(
                  fontFamily: FontConstants.montserratBlack,
                  color: ColorConstants.black),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Container(
                height: 430,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: ColorConstants.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 0.0, left: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 100,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 180.0),
                            child: Text(
                              "Hoşgeldin!",
                              style: TextStyle(
                                fontFamily: FontConstants.montserratBold,
                                fontSize: 26,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _email,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(hintText: 'Password'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 185),
            child: CustomButton(
              buttonText: 'Giriş Yap',
              onPressed: () {
                authRiv.signInWithEmailAndPassword(_email.text, _password.text).then((value) => authRiv.refreshRiv());
              },
            ),
          ),
          const RegisterText(),
          const LoginOptions(),
        ],
      ),
    );
  }
}