import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ntp/ntp.dart';
import 'package:streetanimals/pages/home_page.dart';
import 'package:streetanimals/pages/login_and_register/login_view.dart';
import 'package:streetanimals/utils/db_firebase.dart';

import '../models/user_info.dart';

class AuthenticationServiceProvider extends ChangeNotifier{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();
  bool ?isActive ;
  bool ?refresh ; // sayfayı rebuild yapabilmek için tanımladım. Base_Paticoin de.
  Userinfo ? user;

  void loadUser(Userinfo user){
    this.user = user;
    notifyListeners();
  }

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

     DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await dbFirebase().isexistUSer("users", firebaseAuth.currentUser!.uid);

      if(documentSnapshot.exists) {
        print("0********************KULLANICI VARRR ****************");
      }else{
        print("0********************KULLANICI YOKK ${firebaseAuth.currentUser!.uid} ****************");
        List<String>? name_surname = firebaseAuth.currentUser?.displayName?.split(" ");
        String ?name;
        String ?surname;
        if (name_surname!.length > 2){
          name = "${name_surname[0]} ${name_surname[1]}";
          surname = name_surname[2] ;
        }else{
          name = name_surname[0];
          surname = name_surname[name_surname.length - 1];
        }
        await NTP.now().then((currentTime) {
          Userinfo user = Userinfo(
            name: name,
            surname: surname,
            email: firebaseAuth.currentUser?.email,
            rewards_list: [],
            picture: firebaseAuth.currentUser!.photoURL,
            phone: firebaseAuth.currentUser!.phoneNumber,
            join_us_datetime: "${currentTime}",
            donate: "0",
            coin: "0",
            advert_list: [],
            post_list: [],
            follow_list: [],
            followers_list: [],
            dm_list: [],
            busket_list: [],
            isactive: false,
            id: firebaseAuth.currentUser!.uid,
          );
          dbFirebase().createUser(user, firebaseAuth);

          setisActive(true);
        },);
      }

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
