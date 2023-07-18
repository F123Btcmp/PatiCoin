import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';
import 'package:streetanimals/pages/login_and_register/register_view.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        children: [
          const Text(
            "Hesabın yok mu?",
            style: TextStyle(
              fontFamily: FontConstants.montserratRegular,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  RegisterView()));
            },
            child: const Text(
              "Kayıt ol",
              style: TextStyle(
                fontFamily: FontConstants.montserratBold,
                color: (ColorConstants.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
