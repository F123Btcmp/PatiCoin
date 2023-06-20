import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:flutter/material.dart';
import 'package:streetanimals/constans/text_pref.dart';

import '../../../constans/material_color.dart';

class PasswordTextFormField extends StatelessWidget {
  final String hintTextTitle;

  const PasswordTextFormField({
    super.key,
    required this.hintTextTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 50,
      child: TextFormField(
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: FontConstants.montserratRegular,
        ),
        obscureText: true,
        decoration: InputDecoration(
          hintText: hintTextTitle,
          filled: true,
          fillColor: ColorConstants.fillColorText,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
