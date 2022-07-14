import 'dart:ffi';

import 'package:chat_app/logic/view_model_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../helpers/color.dart';

class UserMessage extends StatefulHookConsumerWidget {
  final List<QueryDocumentSnapshot> messages;
  const UserMessage(this.messages, {Key? key}) : super(key: key);

  @override
  ConsumerState<UserMessage> createState() => _UserMessageState();
}

class _UserMessageState extends ConsumerState<UserMessage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(messageVM);
    final readViewModel = ref.read(messageVM.notifier);
    return ListView.builder(
        itemCount: widget.messages.length,
        itemBuilder: (context, i) {
          final user = FirebaseAuth.instance.currentUser;
          if (user != null && user.uid == widget.messages[i]['author_id']) {
            return Container(
                margin: const EdgeInsets.only(left: 172, top: 10, right: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 17),
                alignment: Alignment.center,
                width: 186,
                decoration: const BoxDecoration(
                    color: Color(0xffF5F5F5),
                    gradient: LinearGradient(colors: AppColors.gradientColor),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.messages[i]['chat'],
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.messages[i]['author'],
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF)),
                      ),
                    ]));
          }
          return Container(
              margin: const EdgeInsets.only(left: 21, right: 169, top: 10),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 17),
              width: 186,
              decoration: const BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.messages[i]['chat'],
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff262626)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.messages[i]['author'],
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff262626)),
                  ),
                ],
              ));
        });
  }
}
