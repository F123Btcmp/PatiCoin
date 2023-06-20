import 'package:flutter/material.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorConstants.purple.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
            color: ColorConstants.purple,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: ColorConstants.white,
                fontSize: 20,
                fontFamily: FontConstants.montserratBold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
