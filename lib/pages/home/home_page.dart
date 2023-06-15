import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/Page/profile_page.dart';
import '../../classes/app_bar_profile.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size ;
    return const SafeArea(
      child: Scaffold(
        //extendBodyBehindAppBar: true,
        appBar:  appBarCustom(title: "Profil"),
        body: SingleChildScrollView(
          
        )
      ),
    );
  }
}