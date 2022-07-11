import 'package:chat_app/presentation/helpers/device_size.dart';
import 'package:chat_app/presentation/widget/placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/buttons.dart';
import '../helpers/text_form.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        elevation: 0,
        leading: appBarNavigate(context, Icons.search),
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            'Home',
            style: TextStyle(
                color: Color(0xff262626),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(),
          ),
        ],
      ),
      body: placeHolder(context),
    );
  }
}
