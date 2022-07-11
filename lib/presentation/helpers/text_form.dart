import 'package:chat_app/presentation/helpers/color.dart';
import 'package:chat_app/presentation/helpers/device_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTextForm(BuildContext context,
    {required TextEditingController controller,
    required bool obscure,
    required String hintText,
    required Widget icon,
    String? errorText,
    Widget? suffixIcon,
    String? Function(String? val)? validator}) {
  return Container(
    alignment: Alignment.center,
    width: context.width() * 31,
    padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
    height: context.height() * .075,
    margin: const EdgeInsets.only(left: 33, right: 33, top: 24,),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(246, 247, 251, 1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(

      validator: validator,
      obscureText: obscure,
      controller: controller,
      cursorHeight: 25,
      cursorColor: Colors.black,
      style: const TextStyle(
          color: Color(0xff262626), fontSize: 14, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 15),
        icon: icon,
        suffixIconColor: AppColors.iconColor,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0xffE5E5E5),
            fontSize: 14,
            fontWeight: FontWeight.w500),
        border: InputBorder.none,
      ),
    ),
  );
}

Widget chatTextDisplay() {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const CircleAvatar(
        backgroundColor: Color(0xffFF7841),
      ),
      Column(
        children: [
          const Text(
            'cindy dev',
            style: TextStyle(
                color: Color(0xff262626),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          Text(
            'online now',
            style: TextStyle(
                foreground: AppColors.paintText,
                fontSize: 10,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
      Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                  color: const Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(6)),
              child: const Icon(
                Icons.video_call,
                size: 16,
                color: Color(0xffA3A3A3),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                  color: const Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(6)),
              child: const Icon(
                Icons.phone,
                size: 16,
                color: Color(0xffA3A3A3),
              ),
            ),
          ),
        ],
      )
    ],
  );
}

typeBox(FocusNode focusNode, BuildContext context) {
  return Container(
    height: context.height() * .08,
    width: double.infinity,
    alignment: Alignment.center,
    color: Color(0xffFAFAFA),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 38,
            width: 38,
            decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              color: const Color(0xffFFA925),
            )),
        const VerticalDivider(
          color: Color(0xffD4D4D4),
          width: 1,
          endIndent: 10,
          indent: 10,
        ),
        Expanded(
          child: TextFormField(
              focusNode: focusNode,
              decoration: const InputDecoration(
                  hintText: 'Type something..',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 5))),
        ),
        Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 38,
            width: 38,
            decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_upward,
                  color: Color(0xffFFA925),
                ))),
      ],
    ),
  );
}
