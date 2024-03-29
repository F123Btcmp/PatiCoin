import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'App/material_root.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,  // Sadece Dikeyde çalışması için .
  ]);
  await Firebase.initializeApp();
  runApp(const ProviderScope(
          child: MyApp()
      )
  );
}
