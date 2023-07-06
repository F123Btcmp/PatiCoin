import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/riverpod_management.dart';

class camPage extends ConsumerWidget {
  const camPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _textcontroller = TextEditingController();
    var navbarRiv = ref.read(navbarRiverpod);
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: size.height * 0.92,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: size.width * 0.165,
                                width:  size.width * 0.165,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:size.width * 0.15,
                                  width: size.width * 0.15,
                                  child: Image.network("https://cdn-icons-png.flaticon.com/512/3135/3135715.png")//Hero
                              ),
                              Positioned(
                                bottom: 0.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    height: size.width * 0.04,
                                    width: size.width * 0.11,
                                    color: Colors.black,
                                    child: const Center(
                                      child: Text(
                                        "Admin",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]
                        ),
                        SizedBox(width: size.width * 0.07),
                        const Text(
                          "Name Surname",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    SizedBox( ///foto kutusu
                      height: size.height * .35,
                      width:  double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black45,
                            width: 2,
                            strokeAlign: 1,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, -3),
                              spreadRadius: 3,
                              blurRadius: 2
                            )
                          ]
                        ),
                        child: Icon(
                            Icons.add_a_photo_outlined,
                          size: size.width * 0.17,
                        ),
                      ),
                    ),
                    Container( //açıklama kutus
                      height: size.height * 0.17,
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 2,
                          color: Colors.black45,
                          strokeAlign: 1
,                      ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 3),
                            blurRadius: 3,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.normal
                          )
                        ]
                      ),
                      child: TextFormField(
                        maxLines: 9,
                        controller: _textcontroller,
                        decoration: const InputDecoration(
                          hintText: "Bir Açıklama Gir...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container( ///buton
                      height: size.width * 0.15,
                      width:  size.width * 0.4,
                      decoration: BoxDecoration(
                        color: ColorConstants.pink2,
                        borderRadius: BorderRadius.circular(23),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(2, 2),
                            spreadRadius: 1,
                            blurRadius: 2
,                      )
                        ]
                      ),
                      child: const Center(
                        child: Text(
                          "Paylaş",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          navbarRiv.setCurrentindex(0);
                        },
                        child: const Text("Paylaşmadan Devam Etmek istiyorum.")
                    ),
                  ],
                ) ,
              ),
            ),
          ),
        )
    );
  }
}
