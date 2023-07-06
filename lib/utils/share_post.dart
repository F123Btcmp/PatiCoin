import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:streetanimals/models/post_info.dart';
import 'package:streetanimals/utils/db_firebase.dart';
import 'package:uuid/uuid.dart';

class sharePost {

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> uploadFileToStorage(List posts ,TextEditingController textcontroller) async {
    List <String> postImageFileName = [];
    if (posts.length > 1){
      File ?imageFile1;
      File ?imageFile2;
      if (imageFile1 == null){
        String fileName1 = Uuid().v4();
        postImageFileName.add(fileName1);
        Reference storageRef = _storage.ref().child("posts").child("kullanıcı_id").child("post_ID").child(fileName1);
        imageFile1 = posts[0];
        await storageRef.putFile(File(imageFile1!.path));
        print("**********************1");
      }
      if(imageFile2 == null){
        String fileName2 = Uuid().v4();
        postImageFileName.add(fileName2);
        Reference storageRef = _storage.ref().child("posts").child("kullanıcı_id").child("post_ID").child(fileName2);
        imageFile2 = posts[1];
        await storageRef.putFile(File(imageFile2!.path));
        print("**********************2");
      }
    }else if (posts.length == 1){
      File ?imageFile1;

      if (imageFile1 == null){
        String fileName1 = Uuid().v4();
        postImageFileName.add(fileName1);
        Reference storageRef = _storage.ref().child("posts").child("kullanıcı_id").child("post_ID").child(fileName1);
        imageFile1 = posts[0];
        await storageRef.putFile(File(imageFile1!.path));
        print("**********************1");
      }
    }
    publish(postImageFileName , textcontroller);
  }

  Future<void> publish(List images, TextEditingController textcontroller) async {
    Postinfo post = Postinfo(
        text: textcontroller.text,
        user_id: "SfdsIUqcWTeuzMkGniX2",
        Province: "İstanbul",
        district: "Başakşehir",
        image_list: images,
    );
    dbFirebase().createPost(post);
  }
}