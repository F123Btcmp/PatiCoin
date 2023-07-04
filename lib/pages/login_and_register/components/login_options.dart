import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:streetanimals/constans/material_color.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(300, 50),
            primary: ColorConstants.fillColorText.withOpacity(0.9),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 530, left: 55),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.zero,
                minimumSize: Size(40, 40), // Butonun minimum boyutu
              ),
              child: Container(
                width: 35, // İçerisindeki resmin genişliği
                height: 35, // İçerisindeki resmin yüksekliği
                child: Image.asset(
                  'assets/icons/google.png',
                  fit: BoxFit.cover, // Resmin sığdırılma şekli
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
