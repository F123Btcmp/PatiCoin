import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:streetanimals/pages/home_page.dart';
import 'package:streetanimals/pages/login_and_register/login_view.dart';

class AuthenticationServiceProvider extends ChangeNotifier{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();
  bool ?isActive ;
  bool ?refresh ; // sayfayı rebuild yapabilmek için tanımladım. Base_Paticoin de.

  String? getUsereid(){
    return firebaseAuth.currentUser!.uid;
  }

  String? getUsername(){
    return firebaseAuth.currentUser!.displayName;
  }
  String? getUseremail(){
    return firebaseAuth.currentUser!.email;
  }

  Widget body(){
    switch(isActive){
      case false:
        return const LoginView();
      case true:
        return const MyHomePage();
      default:
        return const MyHomePage();
    }
  }
  void refreshRiv(){
    refresh != refresh;
    notifyListeners();
  }

  bool isUserLoggedIn() {
    final User? user = firebaseAuth.currentUser;
    return user != null;
  }

  void setisActive(bool status){
    isActive = status;
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      print("Kullanıcı giriş yaptı ${googleUser.email}");
      setisActive(true);
      return userCredential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> registerWithEmailAndPassword(String name, String surname, String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      print('Kullanıcı oluşturuldu: ${user!.email}');
      setisActive(true);
    } catch (e) {
      print('Kayıt işlemi sırasında bir hata oluştu: $e');
      }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      print('Kullanıcı giriş yaptı: ${user!.email}');
      setisActive(true);
    } catch (e) {
      print('Giriş işlemi sırasında bir hata oluştu: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut() ;
      await _googleSignIn.signOut();
      setisActive(false);
    }catch (e) {
      print(e.toString());
    }
  }
}
