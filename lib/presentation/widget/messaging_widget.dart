import 'package:chat_app/logic/view_model_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../logic/service/local_notification_servive.dart';

class MessagingWidget extends StatefulHookConsumerWidget {
  const MessagingWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<MessagingWidget> createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends ConsumerState<MessagingWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LocalNotificationService.initialize(context);
    ref.read(messageVM).messageInitializer(context);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(messageVM);
    final readViewModel = ref.read(messageVM);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('User').snapshots(),
                  builder: (context,snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, i) {
                          QueryDocumentSnapshot x = snapshot.data!.docs[i];

                              return Center(
                                child: Text('Title:' + x['email']),
                              );
                          })
                        : const CircularProgressIndicator();
                  }))
          //Text(' receive messages soon'),
          ),
    );
  }
}
