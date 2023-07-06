import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';
import 'package:streetanimals/pages/login_and_register/components/button.dart';
import 'package:streetanimals/pages/login_and_register/components/cat.dart';
import 'package:streetanimals/pages/login_and_register/components/login_options.dart';
import 'package:streetanimals/pages/login_and_register/components/password_textformfield.dart';
import 'package:streetanimals/pages/login_and_register/components/register_text.dart';
import 'package:streetanimals/pages/login_and_register/components/user_textFormField.dart';

import '../../models/user_info.dart';
import '../../utils/db_firebase.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
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
          const BuildBg(),
          Padding(
            padding: const EdgeInsets.only(top: 185),
            child: CustomButton(
              buttonText: 'Giriş Yap',
              onPressed: () {

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

class BuildBg extends StatelessWidget {
  const BuildBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
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
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: UserTextFormField(hintTextTitle: "E-Posta"),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: PasswordTextFormField(hintTextTitle: "Şifre"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
