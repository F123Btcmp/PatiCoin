
import 'package:flutter/material.dart';

class textMod extends StatelessWidget {
  final String title;
  final double size;
  final Color color;

  const textMod(this.title,this.size, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: FontConstants.montserratBold,
      ),
    );
  }
}
class FontConstants {
  static const montserratBlack = 'Montserrat-Black';
  static const montserratBold = 'Montserrat-Bold';
  static const montserratLight = 'Montserrat-Light';
  static const montserratRegular = 'Montserrat-Regular';
}
