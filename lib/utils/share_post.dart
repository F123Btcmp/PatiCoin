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

  Future<String?> uploadFileToStorage(List posts ,TextEditingController textcontroller) async {
    File ?imageFile1;
    File ?imageFile2;





    for( int i = 0 ; i < posts.length; i++){
      if (imageFile1 == null){
        String fileName1 = Uuid().v4();
        Reference storageRef = _storage.ref().child("posts").child("kullanıcı_id").child(fileName1);
        imageFile1 = posts[i];
        await storageRef.putFile(File(imageFile1!.path));
        print("**********************1");
      }else if(imageFile2 == null){
        String fileName2 = Uuid().v4();
        Reference storageRef = _storage.ref().child("posts").child("kullanıcı_id").child(fileName2);
        imageFile2 = posts[i];
        await storageRef.putFile(File(imageFile2!.path));
        print("**********************2");

      }
      print("girmiyor");
    }
    //await storageRef.putFile(File(imageFile1!.path));
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