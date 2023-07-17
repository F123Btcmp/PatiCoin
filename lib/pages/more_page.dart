import 'package:flutter/material.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';

class morePage extends StatelessWidget {
  const morePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.only(left: size.width * .06, right: size.width * .06, top: size.height * .02 , bottom:  size.height * .09 ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const textMod("Hayvanlara yardım etme konusunda yardıma mı ihtiyacın var ?", 14,Colors.black),
          const textMod("Burası senin için kategoriler", 13, ColorConstants.pink2),
          boxForMore(size, "Donate"),
          boxForMore(size, "Kayıp"),
          boxForMore(size, "Donate"),
          boxForMore(size, "Donate"),
        ],
      ),
    );
  }
  Widget boxForMore(Size size,String name) {
    return GestureDetector(
      onTap: () {
        if(name == "Donate"){
          print("donate açılacak page");
        }else if(name == "Kayıp"){
          print("Kayıp açılacak page");
        }
      },
      child: Container(
        height: size.height * 0.165,
        decoration: BoxDecoration(
          color: ColorConstants.pink2,
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(0, 2),
            )
          ]
        ),
        child: Padding(
          padding: EdgeInsets.only(right:size.width * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              name == "Donate"
              ?Image.asset(
                "assets/image/donate.png",
                )
              : name == "Kayıp"
                ?Image.asset(
                  "assets/image/aranıyor.png"
                  )
                : Text(""),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  name =="Donate"
                      ? const textMod("Bağış Yap", 16, Colors.white)
                      : name == "Kayıp"
                        ? const textMod("   Kayıp evcil\nhayvan ilanları", 16, Colors.white)
                        : Text(""),
                  FittedBox(
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorConstants.fillColorText,
                      ),
                      child: SizedBox(
                        width: size.width * .3,
                        child:
                        name =="Donate"
                        ? const textMod("Sokak hayvanlarının temel ihtiyaçlarını karşılamak için buradan bağış yapabilirsin.", 8, ColorConstants.pink2)
                        : name == "Kayıp"
                          ? const textMod("Kayıp hayvanlara ve sahiplerinin bilgilerine buradan ulaşabilirsin.", 8, ColorConstants.pink2)
                          : Text(""),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

