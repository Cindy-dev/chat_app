import 'package:chat_app/presentation/helpers/device_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget placeHolder(BuildContext context) {
  return Column(children: [
    Container(
      margin: const EdgeInsets.only(top: 30),
      height: 153,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 14, right: 24),
            width: 116,
            decoration: BoxDecoration(
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(16.54)),
          ),
          Container(
            margin: const EdgeInsets.only(right: 24),
            width: 116,
            decoration: BoxDecoration(
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(16.54)),
          ),
          Container(
            margin: const EdgeInsets.only(right: 14),
            width: 116,
            decoration: BoxDecoration(
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(16.54)),
          ),
          Container(
            margin: const EdgeInsets.only(right: 24),
            width: 116,
            decoration: BoxDecoration(
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(16.54)),
          ),
          Container(
            margin: const EdgeInsets.only(right: 14),
            width: 116,
            decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(16.54)),
          ),
          Container(
            margin: const EdgeInsets.only(right: 24),
            width: 116,
            decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(16.54)),
          ),
          Container(
            margin: const EdgeInsets.only(right: 14),
            width: 116,
            decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(16.54)),
          ),
        ],
      ),
    ),
    Container(
      margin: const EdgeInsets.only(right: 14, left: 14, top: 24),
      width: 347,
      height: 171,
      decoration: BoxDecoration(
          color: const Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(16.54)),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 24, left: 14),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 14),
            width: 103,
            height: 125,
            decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(16.54)),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 14),
                width: 231,
                height: 20,
                decoration: BoxDecoration(
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(16.54)),
              ),
              Container(
                margin: const EdgeInsets.only(right: 14, top: 15),
                width: 231,
                height: 20,
                decoration: BoxDecoration(
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(16.54)),
              ),
              Container(
                margin: const EdgeInsets.only(right: 14, top: 15),
                width: 231,
                height: 20,
                decoration: BoxDecoration(
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(16.54)),
              ),
              Container(
                margin: const EdgeInsets.only(right: 14, top: 15),
                width: 231,
                height: 20,
                decoration: BoxDecoration(
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(16.54)),
              ),
            ],
          )
        ],
      ),
    )
  ]);
}
