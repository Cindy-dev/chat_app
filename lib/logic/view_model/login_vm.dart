import 'package:chat_app/presentation/views/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../presentation/helpers/constant.dart';
import '../../presentation/helpers/navigators.dart';

class LoginVm extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePasswordText = true;
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  Future<void> signIn(BuildContext context, VoidCallback onSuccess) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (user != null) {
        onSuccess.call();
      }
      //The password is invalid or the user does not have a password.
    } on FirebaseException catch (error) {
      print(error);
      return showdialog(
          context: context, text: 'Error', contentText: error.toString());
    }
  }

  Future<void> signOut(BuildContext context) async {
    showProgress(context);
    try {
      final user = await auth.signOut();
      navigatePush(context, LogInScreen());
      //The password is invalid or the user does not have a password.
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseException catch (error) {
      print(error);
      return showdialog(
          context: context, text: 'Error', contentText: error.toString());
    }
    notifyListeners();
  }
}
