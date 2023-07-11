import 'package:flutter/material.dart';

import '../constans/material_color.dart';

class postUi extends StatelessWidget {
  const postUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top:size.height * 0.02, bottom:  size.height * 0.07),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
              child: Image.asset("assets/image/post2.jpg")
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.02),
          child: FittedBox( //isim etiketi
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.015, vertical: size.width * 0.007),
              decoration: BoxDecoration(
                color: ColorConstants.pink2,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: size.width * 0.07,
                        width:  size.width * 0.07,
                        child: const DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: size.width * 0.005, top: size.width * 0.005),
                        child: SizedBox(
                            height:size.width * 0.06,
                            width: size.width * 0.06,
                            child: Image.network("https://cdn-icons-png.flaticon.com/512/3135/3135715.png")//Hero
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: size.width * 0.02),
                  Text(
                      "@Zeynep Ersen",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          left: 0 ,
          right : 0,
          bottom: 0,
          child: Container(
            height: size.height * 0.1,
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical:  size.width * 0.02),
            decoration: const BoxDecoration(
              color: ColorConstants.fillColorText,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                )
              ]
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.favorite_border,
                    ),
                    SizedBox(width: size.width * 0.03),
                    Icon(
                      Icons.mode_comment_outlined
                    ),
                    SizedBox(width: size.width * 0.03),
                    Text("Liked By 333 People"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Zeynepersen"),
                        SizedBox(width: size.width * 0.05),
                        Text("I fed my dog Sirius and earned 5 coins"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Zeynepersen"),
                        SizedBox(width: size.width * 0.05),
                        Text("I fed my dog Sirius and earned 5 coins"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
