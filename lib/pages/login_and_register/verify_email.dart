// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mypersonelnotes/constants/routes.dart';
// import 'package:streetanimals/pages/login_and_register/register_view.dart';

// class VerifyEmailView extends StatefulWidget {
//   const VerifyEmailView({super.key});

//   @override
//   State<VerifyEmailView> createState() => _VerifyEmailViewState();
// }

// class _VerifyEmailViewState extends State<VerifyEmailView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Verify Email'),
//       ),
//       body: Column(children: [
//         const Text(
//             "We've sent you a email verificcation. Please open it to verify. "),
//         const Text(
//             "If you haven't received a verification email yet, press the button below."),
//         TextButton(
//           onPressed: () async {
//             final user = FirebaseAuth.instance.currentUser;
//             await user?.sendEmailVerification();
//           },
//           child: const Text('Send email verification'),
//         ),
//         TextButton(
//           onPressed: () async {
//             await FirebaseAuth.instance.signOut();
//             Navigator.of(context)
//                 .pushNamedAndRemoveUntil(RegisterView(), (route) => false);
//           },
//           child: const Text('Restart'),
//         )
//       ]),
//     );
//   }
// }