import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel01/core/constance/color_constant.dart';
import 'package:travel01/core/constance/dismension_constane.dart';
import 'package:travel01/core/helper/asset_helper.dart';
import 'package:travel01/core/helper/images_helper.dart';
class AppBarBuilderWidget extends StatelessWidget {
  const AppBarBuilderWidget({Key? key,required this.child, this.title, this.titleString, this.implementLeading = true, this.implementTraling = false}) : super(key: key);
  final Widget child;
  final Widget? title;
  final String? titleString;
  final bool implementLeading;
  final bool implementTraling;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 200,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalatte.scaffoldBackgroudColor,
              title: title ??
                  Row(
                    children: [
                      if(implementLeading)
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(kItemPadding),
                            child: Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.black,
                              size: kDefaultIconSize,
                            ),
                          ),
                        ),
                      Expanded(child: Center(
                        child: Column(
                          children: [
                            Text(titleString ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30,
                            ),)
                          ],
                        ),
                      )),
                      if(implementTraling)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(kItemPadding),
                          child: Icon(
                            FontAwesomeIcons.bars,
                            size: kDefaultPadding,
                            color: Colors.black,
                          ),
                        )

                    ],
                  ),
              flexibleSpace: Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: Gradients.defaulGradientBackGround,
                        borderRadius: BorderRadius.only(bottomLeft: const Radius.circular(35))
                      ),
                    ),
                  ),
                  Positioned(
                          top: 0,
                          left: 0,
                          child: ImagesHelper.loadFromAsset(AssetsHelper.imageOval1)),
                  Positioned(
                          bottom: 0,
                          right: 0,
                          child: ImagesHelper.loadFromAsset(AssetsHelper.imageOval2))
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 156),
            padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: child,
          )
        ],
      ),
    );
  }
}
