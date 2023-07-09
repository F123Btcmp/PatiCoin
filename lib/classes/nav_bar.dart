import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/pages/cam_page.dart';
import 'package:streetanimals/pages/home_page.dart';
import 'package:streetanimals/riverpod_management.dart';

import '../pages/profile_page.dart';

class navBar extends ConsumerStatefulWidget {
  const navBar({Key? key}) : super(key: key);

  @override
  ConsumerState<navBar> createState() => _navBar();
}

class _navBar extends ConsumerState<navBar> {
  @override
  Widget build(BuildContext context) {
    var navbarRiv = ref.read(navbarRiverpod);
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: ColorConstants.pink2,
      animationDuration: const Duration(milliseconds: 400),
      onTap: (index) {
        switch(index){
          case 0 :
            navbarRiv.setCurrentindex(0);
            break;
          case 2 :
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => camPage()));
            break;
          case 4 :
            navbarRiv.setCurrentindex(4);
            break;
          default:
            return;
        }
        return;
      },
      items:  const [
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
      ]
    );
  }
}
