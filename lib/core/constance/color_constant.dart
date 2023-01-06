import 'package:flutter/material.dart';

class ColorPalatte {
  static const Color primaryColor = Color(0xff6357CC);
  static const Color secondColor = Color(0xff8F67E8);
  static const Color yellowColor = Color(0xffFE9C5E);
  static const Color scaffoldBackgroudColor = Color(0xffF2F2F2);
  static const Color textItemColor = Color(0xffFFFFFF);
  static const Color subTextColor = Color(0xffA5A5A7);
  static const Color dashLineColor = Color(0xffE5E5E5);
  static const Color heartColor = Color(0xffF5DCDC);
}
class Gradients {
  static const Gradient defaulGradientBackGround = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    colors: [
      ColorPalatte.secondColor,
      ColorPalatte.primaryColor
    ]
      );
}