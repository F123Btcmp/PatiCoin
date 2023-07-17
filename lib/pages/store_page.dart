import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/Riverpod/product_riverpod.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';
import 'package:streetanimals/models/product_info.dart';
import 'package:streetanimals/pages/basket_page.dart';
import 'package:streetanimals/pages/product_info_page.dart';
import 'package:streetanimals/utils/db_firebase.dart';
import '../riverpod_management.dart';

class storePage extends ConsumerWidget {
  const storePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    var user = FirebaseAuth.instance.currentUser;
    var productRiv = ref.read(productRiverpod);
    var authRiv = ref.read(AuthenticationServiceRiverpod);
    return FutureBuilder(
      future: productRiv.refreshProducts(),
      builder:(context, snapshot) {
        if(snapshot.hasData){
          return Padding(
            padding: EdgeInsets.only(left: size.width * 0.07, right: size.width * 0.07, top: size.height * 0.03, bottom: size.height * 0.09),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: size.width * 0.13,
                            width:  size.width * 0.13,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                              height:size.width * 0.12,
                              width: size.width * 0.12,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: SizedBox(
                                  child: Image.network(
                                    "${authRiv.user?.picture}",
                                  ),
                                ),
                              )//Hero
                          ),
                        ]
                    ),
                    SizedBox(
                      width: size.width * .07,
                    ),
                    SizedBox(
                      width :size.width * .5 ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textMod("${authRiv.user?.name} ${authRiv.user!.surname}", 15, Colors.black),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                  "assets/image/coin.png",
                                height: size.width * .06,
                              ),
                              textMod("${authRiv.user?.coin}", 15, Colors.black),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * .05,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => basketPage()));
                      },
                      child: Column(
                        children:  [
                          Icon(
                            Icons.shopping_basket_outlined,
                            color: ColorConstants.pink2,
                            size: size.width * .08,
                          ),
                          textMod("Sepetim", 9, ColorConstants.pink2)
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const textMod("Kategori", 15, Colors.black),
                        SizedBox(height: size.height * .07),
                        const textMod("Hepsini göster", 12, ColorConstants.pink2),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(
                        children: [
                          categoryBox(size, "Filter"),
                          categoryBox(size, "Dog Food"),
                          categoryBox(size, "Cat Food"),
                          categoryBox(size, "Bird Food"),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        productBox(context, size, productRiv.products![2],productRiv),
                        productBox(context, size, productRiv.products![0],productRiv),
                      ],
                    ),
                    SizedBox(height: size.height * .02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        productBox(context, size, productRiv.products![1], productRiv),
                        productBox(context, size, productRiv.products![3], productRiv),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }else{
          return Center(
              child: CircularProgressIndicator(
                color: ColorConstants.pink2,
              )
          );
        }

      },
    );
  }
  Widget productBox(BuildContext context, Size size, Productinfo product, productProvider productRiv){
    return GestureDetector(
      onTap: () {
        productRiv.setProduct(product);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => productInfoPage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: size.height* .01),
        height: size.height * .28,
        width: size.width * .4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 3),
              spreadRadius: 1,
              blurRadius: 2,
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              "${product.image}",
              width: size.width * .22,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .03),
              child: Column(
                children: [
                  textMod("${product.name}", 13, Colors.black45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/image/coin.png",
                          height: size.width * .06,
                        ),
                        textMod("${product.price}", 15, Colors.black),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        dbFirebase().addBusket(product);
                        final snackBar = SnackBar(
                            content: Text("${product.name} Sepete eklendi"),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.black26,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Icon(
                        Icons.shopping_basket_outlined,
                        color: Colors.black,
                        size: size.width * .07,
                      ),
                    ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget categoryBox(Size size,String name){
    var myIcon;
    if(name == "Filter"){
      myIcon = Icons.filter_alt;
    }
    return FittedBox(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration:  BoxDecoration(
              color: ColorConstants.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: name == "Filter"
            ? Icon(
                myIcon,
              size: 17,
            )
            : textMod(name, 12, Colors.black)
          ),
          SizedBox(width: size.width * 0.02),
        ],
      ),  
    );
  }
}
