import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/riverpod_management.dart';

class navBar extends ConsumerStatefulWidget {
  const navBar({Key? key}) : super(key: key);

  @override
  ConsumerState<navBar> createState() => _navBar();
}

class _navBar extends ConsumerState<navBar> {
  @override
  Widget build(BuildContext context) {
    //var navbarRiv = ref.read(navbarRiverpod);
    return Scaffold(
      backgroundColor: ColorConstants.pink2,
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: ColorConstants.pink2,
          animationDuration: const Duration(microseconds: 300),
          onTap: (index) {},
          items: const [
            Icon(
              Icons.home,
            ),
            Icon(
              Icons.layers,
            ),
            Icon(
              Icons.camera_alt_outlined,
            ),
            Icon(
              Icons.shopping_bag_outlined,
            ),
            Icon(
              Icons.person,
            ),
          ]),
    );
  }
}
