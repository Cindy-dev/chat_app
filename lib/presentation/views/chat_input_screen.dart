import 'package:chat_app/presentation/helpers/buttons.dart';
import 'package:chat_app/presentation/helpers/color.dart';
import 'package:chat_app/presentation/helpers/text_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatInputScreen extends StatefulHookConsumerWidget {
  const ChatInputScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatInputScreen> createState() => _ChatInputScreenState();
}

class _ChatInputScreenState extends ConsumerState<ChatInputScreen> {
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        elevation: 0,
        leading: appBarNavigate(context, Icons.arrow_back_ios,),
        title: chatTextDisplay(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 21, right: 169),
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 17),
                width: 186,
                decoration: const BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam',
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff262626)),
                )),
            Container(
                margin: const EdgeInsets.only(left: 172, top: 10),
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
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam',
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFFFFFF)),
                )),
            const Spacer(),
            typeBox(focusNode, context),
          ],
        ),
      ),
    );
  }
}
