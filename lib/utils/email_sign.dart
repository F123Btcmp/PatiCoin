import 'package:firebase_auth/firebase_auth.dart';

Future<void> registerWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;
    print('Kullanıcı oluşturuldu: ${user!.email}');
  } catch (e) {
    print('Kayıt işlemi sırasında bir hata oluştu: $e');
  }
}

Future<void> signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;
    print('Kullanıcı giriş yaptı: ${user!.email}');
  } catch (e) {
    print('Giriş işlemi sırasında bir hata oluştu: $e');
  }
}
