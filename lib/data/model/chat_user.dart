import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatUsers {
  String name;
  String messageText;
  String id;
  ChatUsers(
      {required this.name, required this.messageText, required this.id});
}
