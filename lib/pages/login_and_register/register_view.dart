import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';
import 'package:streetanimals/pages/login_and_register/components/button.dart';
import 'package:streetanimals/pages/login_and_register/components/cat.dart';
import 'package:streetanimals/pages/login_and_register/components/password_textformfield.dart';
import 'package:streetanimals/pages/login_and_register/components/user_textFormField.dart';

import '../../utils/email_sign.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/background.bmp', // Arka plan resminin dosya yolu
            fit: BoxFit
                .cover, // Resmi tam ekran kapsaması için uygun hale getirir
            width: double.infinity,
            height: double.infinity,
          ),
          const Cat(),
          const RegisterForm(),
        ],
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {


    final TextEditingController textcontrollername = TextEditingController();
    TextEditingController ?textcontrollersurname = TextEditingController();
    TextEditingController ?textcontrollerademail = TextEditingController();
    TextEditingController ?textcontrolleradpassword = TextEditingController();


    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Container(
          height: 450,
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
            padding: const EdgeInsets.only(right: 1.0, left: 1.0),
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
                      padding: EdgeInsets.only(right: 200),
                      child: Text(
                        "Kayıt Ol",
                        style: TextStyle(
                          fontFamily: FontConstants.montserratBold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: UserTextFormField(hintTextTitle: "isim")
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 15,
                  ),
                  child: UserTextFormField(hintTextTitle: "Soyisim"),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 15,
                  ),
                  child: UserTextFormField(hintTextTitle: "E-Posta"),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, left: 10),
                  child: PasswordTextFormField(hintTextTitle: "Şifre"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomButton(
                    buttonText: "Kayıt Ol",
                    onPressed: () {
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
