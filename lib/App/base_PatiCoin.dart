import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/riverpod_management.dart';

class base_PatiCoin extends ConsumerStatefulWidget {
  const base_PatiCoin({Key? key}) : super(key: key);

  @override
  ConsumerState<base_PatiCoin> createState() => _base_PatiCoinState();
}

class _base_PatiCoinState extends ConsumerState<base_PatiCoin> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(navbarRiverpod);
    return Scaffold(
      body: watch.body(),
    ) ;
  }
}
