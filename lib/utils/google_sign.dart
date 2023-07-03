import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

void signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = userCredential.user;

    print('Google ile giriş yapıldı. Kullanıcı adı: ${user!.displayName}');
  } catch (e) {
    print('Google ile giriş yaparken hata oluştu: $e');
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
  print('Oturum kapatıldı');
}
