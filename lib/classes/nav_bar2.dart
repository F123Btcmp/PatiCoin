import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/riverpod_management.dart';

class navBar2 extends ConsumerWidget {
  const navBar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var navbarRiv = ref.read(navbarRiverpod);
    var size = MediaQuery.of(context).size;
    var kenarlik = size.width * 0.07;
    return SafeArea(
      child: Container(
        margin : EdgeInsets.only(left: kenarlik, right: kenarlik, bottom: size.height * 0.01),
        width:  size.width * 0.86,
        height: size.height * 0.065,
        decoration: BoxDecoration(
          color: ColorConstants.pink2.withOpacity(0.9),
          borderRadius: BorderRadius.circular(17),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                GestureDetector(
                  onTap: () {
                    navbarRiv.setCurrentindex(0);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      navbarRiv.currentindex == 0 ? bottomPoint() : const SizedBox(width: 1)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navbarRiv.setCurrentindex(1);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.layers,
                        color: Colors.white,
                      ),
                      navbarRiv.currentindex == 1 ? bottomPoint() : const SizedBox(width: 1)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navbarRiv.setCurrentindex(2);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                      navbarRiv.currentindex == 2 ? bottomPoint() : const SizedBox(width: 1)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navbarRiv.setCurrentindex(3);

                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                      navbarRiv.currentindex == 3 ? bottomPoint() : const SizedBox(width: 1)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navbarRiv.setCurrentindex(4);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      navbarRiv.currentindex == 4 ? bottomPoint() : const SizedBox(width: 1)
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget bottomPoint() {
    return Container(
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
