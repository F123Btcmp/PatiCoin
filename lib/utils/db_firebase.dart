import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:streetanimals/models/user_info.dart';
import '../models/post_info.dart';

class dbFirebase {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void createUser(Userinfo user, FirebaseAuth firebaseAuth) async {
    final docUser = firestore.collection("users").doc(firebaseAuth.currentUser!.uid);
    final json = user.toJson();
    await docUser.set(json);
    //updateUser("users", docUser.id, {"id":docUser.id}); // Database rastgele atanan id değerini atıyoruz.
  }

  Future<List<Userinfo>> readUsers() async {
    Userinfo ? user ;
    List<Userinfo> users = [] ;
    var snapshot = await FirebaseFirestore.instance.collection("users").get();
    if (snapshot != null && snapshot.docs.length > 0) {
      snapshot.docs.forEach((document) {
        user = Userinfo.fromJson(document.data());
        users.add(user!);
      });
    }
    return users ;
  }

  void updateUser(String collection,String id,Map<String, Object> changes) {
    firestore
        .collection(collection)
        .doc(id)
        .update(changes);
  }

  Future<String?> foundUserid(String email) async { //çalışıyor.
    Future<List<Userinfo>> users = readUsers();
    String ?id ;
    users.then((users) {
      users.forEach((user) {
        if(user.email == email){
          print(user.name);
        }
      });
    },
    );
    return id;
  }
/*
  void syncDbUSer(){ // Kullanıcı google veya email ile oturum açarsa bu fonksiyon sayesinde database ile aktivasyonunu gerçekleştireceğiz.
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      createUser(Userinfo(
        name: user.displayName,
        surname: "",
        email: user.email,
        phone: user.phoneNumber,
        picture: user.photoURL,
        coin: 0,
        donate: 0,
        busket_list: [],
        dm_list: [],
        follow_list: [],
        followers_list: [],
        rewards_list: [],
        post_list: [],
      ));
      print("user id = ${user.uid}");
    }else{
      print("Kullanıcı oturum açmamış.");
    }
  }

 */

  void createPost(Postinfo post) async {
    final docUser = firestore.collection("posts").doc();
    final json = post.toJson();
    await docUser.set(json);
    updateUser("posts", docUser.id, {"id":docUser.id});
  }

}

