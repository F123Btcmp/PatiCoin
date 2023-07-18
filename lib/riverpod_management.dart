import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/Riverpod/Profile_provider.dart';
import 'package:streetanimals/Riverpod/email_sign_provider.dart';
import 'package:streetanimals/Riverpod/navbar_provider.dart';
import 'Riverpod/product_riverpod.dart';

final profileRiverpod = ChangeNotifierProvider((ref) => profileProvider());
final navbarRiverpod = ChangeNotifierProvider((ref) => navbarProvider());
final AuthenticationServiceRiverpod = ChangeNotifierProvider((ref) => AuthenticationServiceProvider());
final productRiverpod = ChangeNotifierProvider((ref) => productProvider());
