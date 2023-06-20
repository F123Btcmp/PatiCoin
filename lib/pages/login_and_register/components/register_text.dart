import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 280, left: 50),
        child: Row(
          children: [
            const Text(
              "Hesabın yok mu?",
              style: TextStyle(
                fontFamily: FontConstants.montserratRegular,
              ),
            ),
            TextButton(
              onPressed: () {},
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
      ),
    );
  }
}
