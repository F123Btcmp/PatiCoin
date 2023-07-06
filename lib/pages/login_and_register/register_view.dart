import 'package:flutter/material.dart';
import 'package:streetanimals/constans/material_color.dart';
import 'package:streetanimals/constans/text_pref.dart';
import 'package:streetanimals/pages/login_and_register/components/button.dart';
import 'package:streetanimals/pages/login_and_register/components/cat.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/background.bmp', // Arka plan resminin dosya yolu
            fit: BoxFit
                .cover, // Resmi tam ekran kapsaması için uygun hale getirir
            width: double.infinity,
            height: double.infinity,
          ),
          const Cat(),
          const RegisterForm(),
        ],
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final TextEditingController _isim = TextEditingController();
  late final TextEditingController _soyisim = TextEditingController();
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _isim.dispose();
    _soyisim.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    final TextEditingController textcontrollername = TextEditingController();
    TextEditingController ?textcontrollersurname = TextEditingController();
    TextEditingController ?textcontrollerademail = TextEditingController();
    TextEditingController ?textcontrolleradpassword = TextEditingController();


    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Container(
          height: 450,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ColorConstants.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 1.0, left: 1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 200),
                      child: Text(
                        "Kayıt Ol",
                        style: TextStyle(
                          fontFamily: FontConstants.montserratBold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 15,
                  ),
                  child: TextFormField(
                    controller: _isim,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(hintText: 'İsim'),
<<<<<<< Updated upstream
                  ),
<<<<<<< Updated upstream
                  child: UserTextFormField(hintTextTitle: "isim")
=======
>>>>>>> Stashed changes
                  child: TextFormField(
                    controller: _isim,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(hintText: 'İsim'),
=======
>>>>>>> Stashed changes
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 15,
                  ),
                  child: TextFormField(
                    controller: _soyisim,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(hintText: 'Soyisim'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 15,
                  ),
                  child: TextFormField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'E-posta'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: TextFormField(
                    controller: _password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(hintText: 'Şifre'),
                  ),
                ),
                // TextButton(
                //   onPressed: () async {
                //     final email = _email.text;
                //     final password = _password.text;
                //     try {
                //       await FirebaseAuth.instance
                //           .createUserWithEmailAndPassword(
                //         email: email,
                //         password: password,
                //       );
                //       final user = FirebaseAuth.instance.currentUser;
                //       user?.sendEmailVerification();
                //       Navigator.of(context).pushNamed(verifyEmailRoute);
                //     } on FirebaseAuthException catch (e) {
                //       if (e.code == 'weak-password') {
                //         await showErrorDialog(
                //           context,
                //           'Şifre güçsüz.',
                //         );
                //       } else if (e.code == 'email-already-in-use') {
                //         await showErrorDialog(
                //           context,
                //           'E-mail kullanılıyor. ',
                //         );
                //       } else if (e.code == 'invalid-email') {
                //         await showErrorDialog(
                //           context,
                //           'Geçersiz email',
                //         );
                //       } else {
                //         await showErrorDialog(
                //           context,
                //           'Error ${e.code}',
                //         );
                //       }
                //     }
                //   },
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomButton(
                    buttonText: "Kayıt Ol",
                    onPressed: () {
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
                      //registerWithEmailAndPassword();
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
                      //registerWithEmailAndPassword();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
