import 'package:flutter/material.dart';
import 'package:streetanimals/constans/text_pref.dart';

import '../../../constans/material_color.dart';

class UserTextFormField extends StatelessWidget {
  final String hintTextTitle;
  const UserTextFormField({
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
        decoration: InputDecoration(
          hintText: hintTextTitle,
          filled: true,
          fillColor: ColorConstants.fillColorText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
