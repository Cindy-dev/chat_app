import 'package:chat_app/logic/service/local_notification_servive.dart';
import 'package:chat_app/presentation/helpers/navigators.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../data/model/message_model.dart';

class MessageVM extends ChangeNotifier {
  String? message;
  TextEditingController messageController = TextEditingController();


  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Future<Set<String>> token =
      FirebaseMessaging.instance.getToken().then((value) => {});
  final user = FirebaseAuth.instance.currentUser;

  getUsers(user) {
    return FirebaseFirestore.instance
        .collection('User')
        .doc(user?.uid)
        .snapshots()
        .listen((userData) {
      var myId = userData.data()!['uid'];
      var myUsername = userData.data()!['name'];
    });
  }

  messageInitializer(BuildContext context) {
    token;
    //gives us the message on which the user taps and it opens the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data['route'];

        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });
    //foreground it is a stream so we have to listen for it
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
      LocalNotificationService.displayNotifications(message);
    });
    //background  //acts when user taps the notification in the notification tray but your app should be in background
    //when the user taps on the notification with app opened but in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      final routeFromMessage = message.data['route'];

      Navigator.of(context).pushNamed(routeFromMessage);
    });

    //when app is not in background
  }
}
