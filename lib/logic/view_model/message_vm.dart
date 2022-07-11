import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../data/model/message_model.dart';

class MessageVM extends ChangeNotifier {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Future<Set<String>> token =
      FirebaseMessaging.instance.getToken().then((value) => {});

  messageInitializer() {
    token;
    FirebaseMessaging.instance.getInitialMessage();
    //foreground it is a stream so we have to listen for it
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if(message.notification != null){
        print(message.notification!.body);
        print(message.notification!.title);
      }

      });
    //background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      //acts when user taps the notification in the notification tray but your app should be in background
    });
  }

  Widget buildMessage(MessageModel messageModel) {
    return ListTile(
      title: Text(messageModel.title),
      subtitle: Text(messageModel.body),
    );
  }
}
