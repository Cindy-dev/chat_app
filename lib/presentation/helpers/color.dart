import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors{
  static const Color iconColor = Color.fromRGBO(
    197,
    197,
    199,
    1,
  );

  static Paint paintText =  Paint()
    ..shader = const LinearGradient(colors: <Color>[
      Color(0xffFF7841),
      Color(0xffFFA925),
    ]).createShader(Rect.fromLTWH(0, 0, 200, 100));

  static const List<Color> gradientColor = [
    Color(0xffFF7841),
    Color(0xffFFA925),
  ];

}
