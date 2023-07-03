
import 'package:flutter/material.dart';

class textMod extends StatelessWidget {
  final String title;
  const textMod(this.title, {Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
