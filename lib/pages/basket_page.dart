import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntp/ntp.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';
import 'package:streetanimals/models/order_info.dart';
import 'package:streetanimals/models/product_info.dart';
import 'package:streetanimals/pages/product_info_page.dart';
import 'package:streetanimals/riverpod_management.dart';
import 'package:streetanimals/utils/db_firebase.dart';

class basketPage extends ConsumerStatefulWidget {
  const basketPage({Key? key}) : super(key: key);

  @override
  ConsumerState<basketPage> createState() => _basketPageState();
}

class _basketPageState extends ConsumerState<basketPage> {

  double totalCoin = 0 ;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size ;
    var productRiv = ref.read(productRiverpod);
    ref.watch(productRiverpod).state;
    List<String> orderId = [];
    productRiv.resetTotal();
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: dbFirebase().getUserBusketList(FirebaseAuth.instance.currentUser!.uid),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              var BusketList = snapshot.data;
              BusketList?.forEach((element) {
                productRiv.addTotal(double.tryParse(element.price!)!);
              });
              return Stack(
                children: [
                  Image.asset(
                    "assets/image/backgrounBsket.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    top: size.height * .02,
                    left:  size.width * .04,
                    child: Row(
                      children: [
                        GestureDetector(
                          child: const Icon(
                              Icons.arrow_back_outlined,
                            size: 26,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        SizedBox(width: size.width * .19),
                        Icon(Icons.shopping_basket),
                        SizedBox(width: size.width * .02),
                        textMod("Sepetim (${BusketList!.length} ürün)", 14, Colors.black),
                        SizedBox(width: size.width * .15),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white24,
                          ),
                          child: IconButton(
                              onPressed: () {
                                print("sepet boşaltıldı") ;
                                dbFirebase().update("users", FirebaseAuth.instance.currentUser!.uid, {"busket_list": []});
                                setState(() {
                                  BusketList = [];
                                });
                                productRiv.changeState();
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.restore_from_trash_outlined,
                                size: 26,
                              ),
                          ) ,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height * .1,
                    left: size.width * .06,
                    child: SizedBox(
                      height: size.height* .67,
                      width: size.width * .9,
                      child: ListView.builder(
                        itemCount: BusketList!.length,
                        itemBuilder: (context, index) {
                          orderId.add(BusketList![index].id!);
                          return basketPost(size,BusketList![index]);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width * .06, vertical: size.height * .02),
                      width: size.width ,
                      color: Colors.white,
                      height: size.height * .15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Seçilen Ürünler (${BusketList!.length})",
                            style: TextStyle(
                              fontSize: 22
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  textMod("${productRiv.totalCoin }", 25, Colors.black),
                                  Image.asset(
                                    "assets/image/coin.png",
                                    height: size.width * .07,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap:()  async {
                                  var user = await dbFirebase().getUser(FirebaseAuth.instance.currentUser!.uid);
                                  if(double.tryParse(user!.coin!)! < productRiv.totalCoin){
                                    print("${user!.coin} paran yok");
                                    final snackBar = SnackBar(
                                      content: Text("Yeterli Coin yok, Yanlzca ${user!.coin} Coin var"),
                                      duration: Duration(seconds: 1),
                                      backgroundColor: Colors.black,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }else{
                                    print("Sepeti onayladım");
                                    dbFirebase().update("users", FirebaseAuth.instance.currentUser!.uid, {"busket_list": []});
                                    ref.read(AuthenticationServiceRiverpod).refreshRiv();
                                    NTP.now().then((currenttime) {
                                      dbFirebase().createOrder(
                                          Orderinfo(
                                            user_id: user.id,
                                            product_id_list: orderId,
                                            datetime: "$currenttime",
                                          )
                                      );
                                    });
                                    setState(() {
                                      BusketList = [];
                                    });
                                    productRiv.changeState();
                                    Navigator.of(context).pop();
                                    var result = (double.tryParse(user!.coin!)! - productRiv.totalCoin).toString();
                                    dbFirebase().update("users", FirebaseAuth.instance.currentUser!.uid,{"coin" : result});
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: ColorConstants.pink2,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: textMod("Sepeti Onayla", 20, Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }else{
              return Center(child: CircularProgressIndicator(
                color: ColorConstants.pink2,
              ));
            }
          },
        ),
      ),
    );
  }

  Widget basketPost(Size size , Productinfo product){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(2),
          width: size.width * .85,
          height: size.height * .15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white70,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(0, 2),
              )
            ]
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    "${product.image}",
                  width: size.width * .2,
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: size.width * .05, vertical:  size.height * .015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * .45,
                      child: Text(
                          "${product.name}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight:  FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/image/coin.png",
                          height: size.width * .06,
                        ),
                        textMod("${product.price}",14, Colors.black)
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => productInfoPage()));
                },
                child: const Icon(
                  Icons.arrow_forward_ios_rounded
                ),
              )
            ],
          ),
        ),
        SizedBox(height: size.height * .01),
      ],
    );
  }
}

