import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rive/rive.dart';

class Cat extends StatelessWidget {
  const Cat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 160,
        width: double.infinity, //bulunduğu containerin genişliğini alması için
        child: const Center(
          child: RiveAnimation.asset(
            "assets/rive/cat.riv",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
