import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';
import 'package:streetanimals/riverpod_management.dart';

class postInfoPage extends ConsumerStatefulWidget {
  const postInfoPage({Key? key}) : super(key: key);

  @override
  ConsumerState<postInfoPage> createState() => _postInfoPageState();
}

class _postInfoPageState extends ConsumerState<postInfoPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var postRiv = ref.read(postRiverpod);
    var authRiv = ref.read(AuthenticationServiceRiverpod);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: size.height * .03, horizontal: size.width * .07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 33,
                    ),
                  ),
                  SizedBox(width: size.width * .27),
                  textMod("Gönderi", 16, Colors.black),
                ],
              ),
              SizedBox(height: size.height * .01),
              Row(
                children: [
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: size.width * 0.11,
                          width:  size.width * 0.11,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                            height:size.width * 0.1,
                            width: size.width * 0.1,
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
                    child: textMod("${authRiv.user?.name} ${authRiv.user!.surname}", 15, Colors.black),
                  ),
                ],
              ),
              SizedBox(height: size.height * .01),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    "${postRiv.imageadress}",
                ),
              ),
              SizedBox(height: size.height * .01),
              Text("${postRiv.myPost!.text}"),
              SizedBox(height: size.height * .01),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorConstants.pink2.withOpacity(0.8),
                ),
                child: FittedBox(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: size.width * .02,vertical: size.height * .004),
                    child: Row(
                      children: [
                        Text("${postRiv.myPost?.like_list?.length} beğeni      ${postRiv.myPost?.comments_list?.length} Yorum"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * .01),
              Text(
                "Yorumlar",
              ),
              SizedBox(height: size.height * .01),
              Center(child: Text("-Henüz Bir Yorum Yok-")),
              /*
              ListView.builder(
                itemCount: postRiv.myPost!.comments_list!.length,
                itemBuilder: (context, index) {

                },
              ),

               */

            ],
          ),
        ),
      ),
    );
  }
}
