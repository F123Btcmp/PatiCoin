import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streetanimals/Riverpod/increment_provider.dart';

final incrementRiverpod = ChangeNotifierProvider((ref) => IncrementProvider());