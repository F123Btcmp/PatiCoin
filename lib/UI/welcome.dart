
import 'package:flutter/material.dart';

import '../constans/material_color.dart';
import '../constans/text_pref.dart';

class Welcoming extends StatelessWidget {
  const Welcoming({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.01, top: size.height * 0.01, bottom: size.height * 0.01),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/sun.png"
              ),
              SizedBox(height: size.height * 0.006),
              const Text(
                '25°C',
                style: TextStyle(
                    fontSize: 15, fontFamily: FontConstants.montserratLight),
              ),
            ],
          ),
          SizedBox(width: size.width * 0.03),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Tekrar Hoşgeldin!',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: FontConstants.montserratBold,
                      color: ColorConstants.pink2),
                ),
                Text(
                  'İzmir de hava güneşli.',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: FontConstants.montserratRegular),
                ),
                Text(
                  'Sokaktaki dostlarımız için kapının önüne bir kap su koy',
                  style: TextStyle(
                      fontSize: 11,
                      fontFamily: FontConstants.montserratRegular),
                ),
              ]),
          /*
          Container(
            height: size.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),

           */
        ],
      ),
    );
  }
}

