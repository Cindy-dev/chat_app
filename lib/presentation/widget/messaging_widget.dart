import 'package:chat_app/logic/view_model_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    ref.read(messageVM).messageInitializer();

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(' receive messages soon'),
        ),
      ),
    );
  }
}
