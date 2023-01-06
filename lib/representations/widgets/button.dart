import 'package:flutter/material.dart';
import 'package:travel01/core/constance/app_style.dart';
import 'package:travel01/core/constance/color_constant.dart';
import 'package:travel01/core/constance/dismension_constane.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.title, this.ontap}) : super(key: key);
final String title;
final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaulGradientBackGround,
        ),
        alignment: Alignment.center,
        child: Text(title,
          style: TextStyle(
                      fontFamily: FontFamily.rubik,
                       color: ColorPalatte.textItemColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),),
      ),
    );
  }
}

