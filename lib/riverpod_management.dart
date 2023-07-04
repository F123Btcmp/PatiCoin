import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/Riverpod/Profile_provider.dart';
import 'package:streetanimals/Riverpod/increment_provider.dart';
import 'package:streetanimals/Riverpod/navbar_provider.dart';

final incrementRiverpod = ChangeNotifierProvider((ref) => IncrementProvider());
final profileRiverpod = ChangeNotifierProvider((ref) => profileProvider());
final navbarRiverpod = ChangeNotifierProvider((ref) => navbarProvider());