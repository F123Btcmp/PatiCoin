import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/riverpod_management.dart';

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var read = ref.read(incrementRiverpod);
    ref.watch(incrementRiverpod).number;
    return Scaffold(
      appBar: AppBar(
        title: Text("PatiCoin"),
      ),
      body: Center(
        child: Column(
        ),
      ),
    );
  }
}