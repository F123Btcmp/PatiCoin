import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'App/material_root.dart';

void main() {
  runApp(const ProviderScope(
          child: MyApp()
      )
  );
}
