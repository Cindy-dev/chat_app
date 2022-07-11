import 'package:chat_app/presentation/helpers/device_size.dart';
import 'package:chat_app/presentation/helpers/navigators.dart';
import 'package:chat_app/presentation/views/chat_home_screen.dart';
import 'package:chat_app/presentation/views/login_screen.dart';
import 'package:flutter/material.dart';

import 'color.dart';

Widget gradientButton(BuildContext context, String text,) {
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

Widget appBarNavigate(BuildContext context, IconData iconData) {
  return GestureDetector(
    onTap: () => navigatePush(context, const ChatHomeScreen()),
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
