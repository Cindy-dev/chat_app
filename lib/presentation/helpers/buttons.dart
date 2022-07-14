import 'package:chat_app/presentation/helpers/device_size.dart';
import 'package:chat_app/presentation/helpers/navigators.dart';
import 'package:chat_app/presentation/views/chat_home_screen.dart';
import 'package:chat_app/presentation/views/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'color.dart';

Widget gradientButton(
  BuildContext context,
  String text,
) {
  return Container(
    alignment: Alignment.center,
    height: context.height() * .075,
    width: context.width() * 31,
    margin: const EdgeInsets.fromLTRB(29, 15, 29, 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(colors: AppColors.gradientColor)),
    child: Text(
      text,
      style: const TextStyle(
          color: Color(0xffFAFAFA), fontSize: 18, fontWeight: FontWeight.w600),
    ),
  );
}

Widget textButton(String text1, String text2, void Function()? navigate) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text1,
        style: const TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
      ),
      GestureDetector(
        onTap: navigate,
        child: Text(
          text2,
          style: TextStyle(
              foreground: AppColors.paintText,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
      )
    ],
  );
}

Widget appBarNavigate(BuildContext context, IconData iconData, VoidCallback exitApp) {
  return GestureDetector(
    onTap: exitApp,
    child: Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 38,
      width: 38,
      decoration: BoxDecoration(
          color: const Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(10)),
      child: Icon(
        iconData,
        size: 16,
        color: Color(0xffA3A3A3),
      ),
    ),
  );
}

deleteMessage(BuildContext context, String docId) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Delete Message'),
            actions: [
              InkWell(
                onTap: navigatePop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              InkWell(
                onTap: () async {
                  await FirebaseFirestore.instance
                      .collection('messages')
                      .doc(docId)
                      .delete();
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
              )
            ],
          ));
}
