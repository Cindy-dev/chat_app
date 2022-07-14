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
    margin: const EdgeInsets.only(
      left: 33,
      right: 33,
      top: 24,
    ),
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

Widget chatTextDisplay(String? user) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: [
              Text(
                user!.toUpperCase(),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff262626),
                    fontSize: 15,
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
        ),
      ),
      Expanded(
        child: Row(
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
                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
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
        ),
      )
    ],
  );
}

typeBox(
    {required BuildContext context,
    void Function(String value)? onChanged,
    void Function()? onTap,
    required TextEditingController controller}) {
  return Container(
    //height: context.height() * .08,
    width: double.infinity,
    alignment: Alignment.center,
    color: Color(0xffFAFAFA),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
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
          child: TextField(
              controller: controller,
              onChanged: onChanged,
              maxLines: 10,
              minLines: 1,
              decoration: const InputDecoration(
                  hintText: 'Type something..',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 5))),
        ),
        GestureDetector(
            onTap: onTap,
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.arrow_upward,
                  color: Color(0xffFFA925),
                ))),
      ],
    ),
  );
}
