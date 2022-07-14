// import 'package:chat_app/presentation/helpers/device_size.dart';
// import 'package:chat_app/presentation/widget/placeholder.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// import '../../logic/service/local_notification_servive.dart';
// import '../../logic/view_model_provider.dart';
// import '../helpers/buttons.dart';
// import '../helpers/text_form.dart';
//
// class ChatHomeScreen extends StatefulHookConsumerWidget {
//   const ChatHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<ChatHomeScreen> createState() => _ChatHomeScreenState();
// }
//
// class _ChatHomeScreenState extends ConsumerState<ChatHomeScreen> {
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     LocalNotificationService.initialize(context);
//     ref.read(messageVM).messageInitializer(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final viewModel = ref.watch(messageVM);
//     final readViewModel = ref.read(messageVM);
//     return Scaffold(
//         backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
//         appBar: AppBar(
//           backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
//           elevation: 0,
//           leading: appBarNavigate(context, Icons.search),
//           title: Container(
//             alignment: Alignment.center,
//             child: const Text(
//               'Home',
//               style: TextStyle(
//                   color: Color(0xff262626),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18),
//             ),
//           ),
//           actions: const [
//             Padding(
//               padding: EdgeInsets.only(right: 10),
//               child: CircleAvatar(),
//             ),
//           ],
//         ),
//         //listening to a stream of user data saved in firestore
//         body: StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection('User').snapshots(),
//             builder: (context, snapshot) {
//               return snapshot.hasData
//                   ? ListView.builder(
//                       itemCount: snapshot.data!.docs.length,
//                       itemBuilder: (context, i) {
//                         QueryDocumentSnapshot x = snapshot.data!.docs[i];
//
//                         return ListTile(
//                           leading: const CircleAvatar(),
//                           title: Text(x['email']),
//                           subtitle: Text(x['fullName']),
//                         );
//                       })
//                   : CircularProgressIndicator();
//               //placeHolder(context);
//             }));
//   }
// }
