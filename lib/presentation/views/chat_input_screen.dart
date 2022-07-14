import 'package:chat_app/logic/view_model_provider.dart';
import 'package:chat_app/presentation/helpers/buttons.dart';
import 'package:chat_app/presentation/helpers/color.dart';
import 'package:chat_app/presentation/helpers/text_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/user_message.dart';

class ChatInputScreen extends StatefulHookConsumerWidget {
  final ValueChanged<String> onSubmit;
  const ChatInputScreen(this.onSubmit, {Key? key}) : super(key: key);

  @override
  ConsumerState<ChatInputScreen> createState() => _ChatInputScreenState();
}

class _ChatInputScreenState extends ConsumerState<ChatInputScreen> {
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(messageVM);
    final readViewModel = ref.read(messageVM.notifier);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        elevation: 0,
        leading: appBarNavigate(context, Icons.exit_to_app,
            () => ref.read(loginVM.notifier).signOut(context)),
        title: chatTextDisplay(viewModel.currentUser.displayName),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('messages')
                    .orderBy('time')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return UserMessage(snapshot.data!.docs);
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            typeBox(
                controller: viewModel.messageController,
                context: context,
                onChanged: (value) {
                  readViewModel.message = value;
                },
                onTap: () {
                  readViewModel.message == null ||
                          readViewModel.message!.isEmpty
                      ? null
                      : readViewModel.addMessage();
                  //resetting the text field after an image is sent so you dont have to set same image multiple times
                  readViewModel.message = '';
                  readViewModel.messageController.clear();
                }),
          ],
        ),
      ),
    );
  }
}

//constraints(BoxContraints, maxwidth)
