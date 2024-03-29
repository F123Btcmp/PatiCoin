import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/riverpod_management.dart';
import 'package:streetanimals/utils/db_firebase.dart';
import 'package:streetanimals/utils/share_post.dart';

class camPage extends ConsumerStatefulWidget {
  const camPage({Key? key}) : super(key: key);
  @override
  ConsumerState<camPage> createState() => _camPage();
}

class _camPage extends ConsumerState<camPage> {
  List <File> images = [] ;
  File ?imageFile1;
  File ?imageFile2;



  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );


    if (pickedFile != null) {
      img.Image? originalImage = img.decodeImage(await pickedFile.readAsBytes());

      if (originalImage != null) {
        img.Image resized = img.copyCrop(originalImage, x: 100, y: 200, width: 800, height: 600);
        File resizedFile = File(pickedFile.path)..writeAsBytesSync(img.encodeJpg(resized));
        setState(() {
          if (imageFile1 == null){
            imageFile1 = File(resizedFile!.path);
          }else{
            imageFile2 = File(resizedFile!.path);
          }
        });
        // Do something with the resizedFile (e.g., display or upload)
      }
    }



  }
  TextEditingController _textcontroller = TextEditingController();
  PageController _pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var authRiv = ref.read(AuthenticationServiceRiverpod);
    var navbarRiv = ref.read(navbarRiverpod);
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstants.fillColorText,
          body: SingleChildScrollView(
            child: SizedBox(
              height: size.height * 0.85,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: size.width * 0.165,
                                width:  size.width * 0.165,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:size.width * 0.15,
                                  width: size.width * 0.15,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(
                                        "${authRiv.user!.picture}",
                                    ),
                                  )//Hero
                              ),
                            ]
                        ),
                        SizedBox(width: size.width * 0.07),
                        Text(
                          "${authRiv.user!.name} ${authRiv.user!.surname}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: () {
                        if(imageFile2 == null){
                          _getFromCamera();
                        }
                      },
                      child: SizedBox( ///foto kutusu
                        height: size.height * .32,
                        width:  double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.black45,
                              width: 2,
                              strokeAlign: 1,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, -3),
                                spreadRadius: 3,
                                blurRadius: 2
                              )
                            ]
                          ),
                          child: imageFile1 != null
                          ? Stack(
                            children :[
                              PageView(
                                controller: _pagecontroller,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Center(
                                    child: Image.file(imageFile1!)
                                  ),
                                  imageFile2 != null
                                  ?Center(
                                    child: Image.file(imageFile2!),
                                    )
                                  :const Center(
                                    child: Text("Daha fazla resim eklenmedi"),
                                  )
                                ]
                              ),
                              Positioned(
                                  right: 5,
                                  top: 5,
                                  child: IconButton(
                                      onPressed: () {
                                        if(_pagecontroller.page == 0){
                                          setState(() {
                                            imageFile1!.deleteSync();
                                            imageFile1 = imageFile2;
                                            imageFile2 = null;
                                          });
                                        }else{
                                          setState(() {
                                            imageFile2!.deleteSync();
                                            imageFile2 = null;
                                          });
                                        }
                                      },
                                      icon: const Icon(
                                          Icons.restore_from_trash_rounded,
                                        color: ColorConstants.purple,
                                      ),
                                  ),
                              ),
                              Positioned(
                                  bottom: size.height * 0.01,
                                  left: size.width * 0.4,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: size.width * 0.025,
                                        height: size.width * 0.025,
                                        decoration: const BoxDecoration(
                                          color: ColorConstants.lightpink,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      imageFile2 != null
                                      ? Container(
                                        width: size.width * 0.025,
                                        height: size.width * 0.025,
                                        decoration: const BoxDecoration(
                                          color: ColorConstants.lightpink,
                                          shape: BoxShape.circle,
                                          ),
                                        )
                                      : SizedBox(width: 1),
                                    ],
                                  )
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  height: size.width * 0.12,
                                  width: size.width * 0.12,
                                  decoration: BoxDecoration(
                                    color: imageFile2 == null
                                      ?ColorConstants.purple
                                      :Colors.grey,
                                    shape: BoxShape.circle,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                        offset: Offset(2, 2),
                                      )
                                    ]
                                  ),
                                  child:Icon(
                                    Icons.add_a_photo_outlined,
                                    size: size.width * 0.06,
                                  ),
                                ),
                              ),
                            ]
                          )
                          : Icon(
                              Icons.add_a_photo_outlined,
                            size: size.width * 0.17,
                          ),
                        ),
                      ),
                    ),
                    Container( ///açıklama kutus
                      height: size.height * 0.14,
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 2,
                          color: Colors.black45,
                          strokeAlign: 1
,                      ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 3),
                            blurRadius: 3,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.normal
                          )
                        ]
                      ),
                      child: TextFormField(
                        maxLines: 9,
                        controller: _textcontroller,
                        decoration: const InputDecoration(
                          hintText: "Bir Açıklama Gir...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector (
                      onTap: () async {
                        if (imageFile1 != null){
                          images.add(imageFile1!);
                        }if(imageFile2 != null){
                          images.add(imageFile2!);
                        }
                        await sharePost().uploadFileToStorage(images, _textcontroller, authRiv.firebaseAuth).then((value) {
                          var newvalue = (double.tryParse(authRiv.user!.coin!)! + 0.3).toString();
                          dbFirebase().update("users", authRiv.user!.id!, {"coin" : newvalue});
                          authRiv.refreshRiv();
                          Navigator.of(context).pop();
                        });

                        images.clear();
                      },
                      child: Container( ///buton
                        height: size.width * 0.15,
                        width:  size.width * 0.4,
                        decoration: BoxDecoration(
                          color: ColorConstants.pink2,
                          borderRadius: BorderRadius.circular(23),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(2, 2),
                              spreadRadius: 1,
                              blurRadius: 2
,                      )
                          ]
                        ),
                        child: const Center(
                          child: Text(
                            "Paylaş",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Paylaşmadan Devam Etmek istiyorum.")
                    ),
                  ],
                ) ,
              ),
            ),
          ),
        )
    );
  }
}
