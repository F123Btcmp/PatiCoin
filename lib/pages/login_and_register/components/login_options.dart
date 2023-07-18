import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/riverpod_management.dart';

class LoginOptions extends ConsumerWidget {
  const LoginOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authRiv = ref.read(AuthenticationServiceRiverpod);
    return Theme(
      data: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(300, 50),
            primary: ColorConstants.fillColorText.withOpacity(0.9),
          ),
        ),
      ),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              authRiv.signInWithGoogle().then((value) {
                ref.read(refreshRiverpod).changeState();
              });
            },
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
    );
  }
}
