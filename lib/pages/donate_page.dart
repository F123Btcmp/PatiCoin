import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';
import 'package:streetanimals/riverpod_management.dart';
import 'package:streetanimals/utils/db_firebase.dart';

class donatePage extends ConsumerStatefulWidget {
  const donatePage({Key? key}) : super(key: key);

  @override
  ConsumerState<donatePage> createState() => _donatePageState();
}
class _donatePageState extends ConsumerState<donatePage>{
  late final TextEditingController _textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var authRiv = ref.read(AuthenticationServiceRiverpod);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF89C1B6),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * .02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                        size: 38 ,
                      ),
                    ),
                    SizedBox(width: size.width * .3),
                    textMod("Bağış Yap", 22, Colors.black),
                  ],
                ),
                SizedBox(height: size.height * .02),
                Image.network(
                  "https://bagis.ipekyoluasya.org/assets/uploads/files/08ff9-genel-nakdi-bagis.jpg",
                ),
                SizedBox(height: size.height * .02),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: size.width * .05),
                  child: Container(
                    padding: EdgeInsets.all(size.width * .06),
                    decoration: BoxDecoration(
                      color: ColorConstants.fillColorText.withOpacity(0.5),
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
                      height: size.height * .28,
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
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
                            ],
                          ),
                          const textMod("Lütfen Bağış Yapmak İstediğiniz Tutarı Giriniz.",11, Colors.black),
                          Container(
                            width: size.width * .25,
                            height: size.height * .045,
                            decoration: BoxDecoration(
                              color: ColorConstants.pink2.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                              ],
                              controller: _textcontroller,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                labelStyle: TextStyle(decoration: TextDecoration.none),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if(double.tryParse(_textcontroller.text)! < double.tryParse(authRiv.user!.coin!)!){
                                var newvalue = (double.tryParse(authRiv.user!.coin!)! - double.tryParse(_textcontroller.text)!).toStringAsFixed(2).toString() ;
                                var newDonateValue = (double.tryParse(authRiv.user!.donate!)! + double.tryParse(_textcontroller.text)!).toStringAsFixed(2).toString();
                                dbFirebase().update("users", FirebaseAuth.instance.currentUser!.uid, {"coin" : newvalue, "donate" : newDonateValue});
                                Navigator.of(context).pop();
                              }else{
                                final snackBar = SnackBar(
                                  content: Text("Yeterli Coin yok, Yanlzca ${authRiv.user!.coin} Coin var"),
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.black,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            },
                            child: Container(
                              width:size.width * .08,
                              height: size.width * .08,
                              decoration: BoxDecoration(
                                color: ColorConstants.black.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(Icons.transit_enterexit,color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
