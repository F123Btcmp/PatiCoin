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
  }

  Future<List<Userinfo>> readUsers() async {
    Userinfo ? user ;
    List<Userinfo> users = [] ;
    var snapshot = await firestore.collection("users").get();
    if (snapshot != null && snapshot.docs.length > 0) {
      snapshot.docs.forEach((document) {
        user = Userinfo.fromJson(document.data());
        users.add(user!);
      });
    }
    return users ;
  }

  Future<List<Postinfo>> readPosts() async {
    Postinfo ? post ;
    List<Postinfo> posts = [] ;
    var snapshot = await firestore.collection("posts").get();
    if (snapshot != null && snapshot.docs.length > 0) {
      snapshot.docs.forEach((document) {
        post = Postinfo.fromJson(document.data());
        posts.add(post!);
      });
    }
    return posts ;
  }

  Future<Userinfo?> getUser(String ?uid) async {//girilen uid ye göre kullanıcıyı dönen fonksiyon.
    Userinfo ? userr ;
    print(uid);
    var snapshot = await firestore.collection("users").get();
    if (snapshot != null && snapshot.docs.length > 0) {
      snapshot.docs.forEach((document) {
        var user = Userinfo.fromJson(document.data());
        if (user!.id == uid){
          userr = user;
        }
      });
    }
    return userr ;
  }

  void update(String collection,String id,Map<String, Object> changes) {
    firestore
        .collection(collection)
        .doc(id)
        .update(changes);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> isexistUSer(String collectionName, String documentId) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(documentId)
        .get();

    return documentSnapshot;
  }

  Future<String?> foundUserid(String email) async { //çalışıyor.
    Future<List<Userinfo>> users = readUsers();
    String ?id ;
    users.then((users) {
      users.forEach((user) {
        if(user.email == email){
          print(user.name);
          id = user.id ;
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
    update("posts", docUser.id, {"id":docUser.id});
    var user = dbFirebase().getUser(FirebaseAuth.instance.currentUser!.uid).then((value) {
      print(value?.email);
      List? a = value!.post_list;
      a!.add(docUser.id);
      dbFirebase().update("users", FirebaseAuth.instance.currentUser!.uid, {"post_list" : a});
    });
  }

}

