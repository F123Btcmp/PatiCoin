import 'package:flutter/material.dart';
import 'package:streetanimals/constans/text_pref.dart';
import 'package:streetanimals/models/post_info.dart';
import 'package:streetanimals/models/user_info.dart';
import 'package:streetanimals/utils/db_firebase.dart';
import 'package:streetanimals/utils/share_post.dart';

import '../constans/material_color.dart';

class postUi extends StatelessWidget {
  final Postinfo ? post;
  const postUi(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Future<Userinfo?> user = dbFirebase().getUser(post!.user_id);
    Future<String?> post_image = sharePost().downPostImage(post!);
    return FutureBuilder(
      future: user,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          var user = snapshot.data;
          return Stack(
            children: [
              FutureBuilder(
                future: post_image,
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return Padding(
                      padding: EdgeInsets.only(top:size.height * 0.02, bottom:  size.height * 0.05),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            "${snapshot.data}",
                          )
                      ),
                    );
                  }else{
                    return CircularProgressIndicator();
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.02),
                child: FittedBox( //isim etiketi
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.015, vertical: size.width * 0.007),
                    decoration: BoxDecoration(
                      color: ColorConstants.pink2,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(2, 2),
                        )
                      ]
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
                            "@${user!.name}${user.surname}",
                          style: const TextStyle(
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
                top: size.height * 0.33,
                child: FittedBox(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical:  size.width * 0.02),
                    decoration: const BoxDecoration(
                      color: ColorConstants.fillColorText,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(2, 2),
                        )
                      ]
                    ),
                    child: SizedBox(
                      width: size.width,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite_border,
                                size: 25,
                              ),
                              SizedBox(width: size.width * 0.03),
                              const Icon(
                                Icons.mode_comment_outlined,
                                size: 25,
                              ),
                              SizedBox(width: size.width * 0.03),
                              Text("${post!.comments_list!.length} Yorum"),
                              SizedBox(width: size.width * 0.03),
                              Text("${post!.like_list!.length} Beğeni"),
                            ],
                          ),
                          SizedBox(height: size.height * 0.005),
                          post!.comments_list!.isEmpty
                          ? const Text("Henüz bir yorum yapılmamış")
                          : ListView.builder(
                            itemCount: post!.comments_list!.length > 2 ? 2 : post!.comments_list!.length ,
                            itemBuilder: (context, index) {
                              Row( ///buraya yorum olayı yapılınca bakacağım
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  textMod("${post!.comments_list![index]}",12, Colors.black),
                                  SizedBox(width: size.width * 0.05),
                                  const textMod("I fed my dog Sirius and earned 5 coins",12, Colors.black),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }else{
          return Text("");
        }
      },
    );
  }
}
