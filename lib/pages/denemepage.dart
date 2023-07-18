import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/riverpod_management.dart';
import 'package:streetanimals/utils/db_firebase.dart';

import '../models/user_info.dart';

class denemePage extends ConsumerWidget {
  const denemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authref = ref.read(AuthenticationServiceRiverpod);
    var user = dbFirebase().getUser(authref.getUsereid());
    return Scaffold(
      body: FutureBuilder(
        future: user,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            Userinfo? user = snapshot.data;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${user?.name}"),
                  Text("${user?.email}"),
                  Text("${user?.id}"),
                  Text("${user?.phone}"),
                  Text("${user?.coin}"),
                  ElevatedButton(
                      onPressed: () {
                      },
                      child:const Text(
                        "test"
                      )
                  ),
                ],
              ),
            );
          }else{
            return Text("data");
          }
        },
      ),
    );
  }
}
