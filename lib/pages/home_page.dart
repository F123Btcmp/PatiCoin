import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/UI/banner.dart';
import 'package:streetanimals/UI/post_ui.dart';
import 'package:streetanimals/UI/welcome.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/models/post_info.dart';
import 'package:streetanimals/riverpod_management.dart';
import 'package:streetanimals/utils/db_firebase.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState <MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var authRiv = ref.read(AuthenticationServiceRiverpod);
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.20),
        child: FutureBuilder(
          future: dbFirebase().readPosts(),
          builder: (context, snapshot) {
            if(snapshot .hasData){
              List<Postinfo>? posts_list = snapshot.data!;
              return SizedBox(
                height: size.height,
                child: ListView.builder(
                  itemCount: posts_list.length!,
                  itemBuilder: (context, index) {
                    if(index == 0 ){
                      return Column(
                        children: [
                          Welcoming(),
                          banner(),
                          postUi(posts_list[index])
                        ],
                      );
                    }else{
                      print(posts_list.length);//bu hep çalışıyor.
                      return postUi(posts_list[index]);
                    }
                  },
                ),
              );
            }else{
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorConstants.pink2,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
