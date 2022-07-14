import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupVM extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool obscurePasswordText = true;
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  //this is a method called to create user with email and password
  Future<void> signUP(BuildContext context, VoidCallback onSuccess) async {
    try {
      final newUser = await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      if (newUser != null) {
        fireStore.collection('User').add({
          'id': newUser.user?.uid,
          'email': emailController.text,
          'displayName': nameController.text,
        });

        final user = newUser.user;
        await user?.updateDisplayName(nameController.text);
        onSuccess.call();
      }
    } catch (error) {
      print(error.toString());
    }
    notifyListeners();
  }
}
