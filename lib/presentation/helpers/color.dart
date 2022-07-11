import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors{
  static const Color iconColor = Color.fromRGBO(
    197,
    197,
    199,
    1,
  );

  static Paint paintText =  Paint()
    ..shader = const LinearGradient(colors: <Color>[
      Color(0xffFF7841),
      Color(0xffFFA925),
    ]).createShader(Rect.fromLTWH(0, 0, 200, 100));

  static const List<Color> gradientColor = [
    Color(0xffFF7841),
    Color(0xffFFA925),
  ];

}


// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import '../../data/model/message_model.dart';
//
// class MessageVM extends ChangeNotifier {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   Future<Set<String>> token =
//   FirebaseMessaging.instance.getToken().then((value) => {});
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   late AndroidNotificationChannel channel;
//
//   messageInitializer() {
//     if (!kIsWeb) {
//       channel = const AndroidNotificationChannel(
//         'high_importance_channel', // id
//         'High Importance Notifications', // title
//         // 'This channel is used for important notifications.', // description
//         importance: Importance.high,
//       );
//     }
//     token;
//     FirebaseMessaging.instance.getInitialMessage();
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               //channel.description,
//               icon: 'launch_background',
//             ),
//           ),
//         );
//       }
//     });
//   }
//
//   Widget buildMessage(MessageModel messageModel) {
//     return ListTile(
//       title: Text(messageModel.title),
//       subtitle: Text(messageModel.body),
//     );
//   }
// }
