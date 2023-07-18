import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';
import 'package:streetanimals/models/product_info.dart';
import 'package:streetanimals/riverpod_management.dart';

import '../utils/db_firebase.dart';

class productInfoPage extends ConsumerWidget {
  const productInfoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    Productinfo? product = ref.read(productRiverpod).product;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: size.width * .06, vertical:  size.height * .01),
            child:  Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                          Icons.arrow_back_outlined,
                        size: 32 ,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * .03),
                Container(
                  padding: EdgeInsets.all(size.width * .06),
                  decoration: BoxDecoration(
                    color: ColorConstants.fillColorText,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 3),
                        blurRadius: 1,
                        spreadRadius: 2
                      )
                    ]
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: size.height * .35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          "${product?.image}",
                          height: size.height * .25,
                        ),
                        Row(
                          children: [
                            textMod("${product?.name}", 15, Colors.black),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/image/coin.png",
                              height: size.width * .07,
                            ),
                            textMod("${product?.price}", 16, Colors.black),
                            SizedBox(width: size.width * .2),
                            GestureDetector(
                              onTap: () {
                                dbFirebase().addBusket(product!);
                                final snackBar = SnackBar(
                                  content: Text("${product.name} Sepete eklendi"),
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.black26,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                Navigator.of(context).pop();
                              },
                              child: FittedBox(
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color:ColorConstants.pink2,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0, 3),
                                          blurRadius: 2,
                                          spreadRadius: 0
                                      )
                                    ]
                                  ),
                                  child: Row(
                                    children: [
                                      textMod("Sepete Ekle", 15, Colors.white),
                                      SizedBox(width: size.width * .04),
                                      Icon(Icons.shopping_basket_outlined,
                                      color: Colors.white)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * .02),
                textMod("Ürün Bilgisi", 15, Colors.black),
                SizedBox(height: size.height * .02),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(size.width * .06),
                  decoration: BoxDecoration(
                      color: ColorConstants.fillColorText,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 3),
                            blurRadius: 1,
                            spreadRadius: 2
                        )
                      ]
                  ),
                  child: Text("${product?.explanation}"),
                )
              ],
            ) ,
          ),
        ),
      ),
    );
  }
}
