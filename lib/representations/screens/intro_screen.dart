import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel01/core/constance/app_style.dart';
import 'package:travel01/core/constance/dismension_constane.dart';
import 'package:travel01/core/helper/asset_helper.dart';
import 'package:travel01/core/helper/images_helper.dart';
import 'package:travel01/representations/screens/main_app.dart';
import 'package:travel01/representations/widgets/button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);
 static const routeName = 'intro_screen';
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  final PageController _pageController = PageController();
  final StreamController<int>_pageStreamController = StreamController<int>.broadcast();

  @override
  void initState(){
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _builderIntroScreen( String image, String title, String description, AlignmentGeometry alignment){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: alignment,
            child: ImagesHelper.loadFromAsset(
                image,
            height: 420,
            fit: BoxFit.fitHeight,),
          ),
          const SizedBox(
            height: kMediumPadding *2,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text( title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.rubik,
                      fontSize: 24),),
                  const SizedBox(
                    height: kMediumPadding,
                  ),
                  Text(description,
                  style: const TextStyle(fontSize: 14,
                                    fontFamily: FontFamily.rubik,
                                    fontWeight: FontWeight.w400,
                  ),)
                ],
              ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _builderIntroScreen(AssetsHelper.imageIntro1,
                  'Book a flight',
                  'Found a flight that matches your destination and schedule? Book it instantly.',
                  Alignment.centerLeft),
              _builderIntroScreen(AssetsHelper.imageIntro2,
                  'Find a hotel room',
                  'Select the day, book your room. We give you the best price.',
                  Alignment.center),
              _builderIntroScreen(AssetsHelper.imageIntro3,
                  'Enjoy your trip',
                  'Easy discovering new places and share these between your friends and travel together.',
                  Alignment.centerRight)
            ],
          ),
          Positioned(
            left: kMediumPadding,
              right: kMediumPadding,
              bottom: kMediumPadding * 3,
              child: Row(
            children: [
              Expanded(
                flex: 6,
                child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                effect: const ExpandingDotsEffect(
                  dotHeight: kMinPadding,
                  dotWidth: kMinPadding,
                  activeDotColor: Colors.orange
                ),),
              ),
              StreamBuilder<int>(
                initialData: 0,
                stream: _pageStreamController.stream,
                builder: (context, snapshot) {
                  return Expanded(
                    flex: 4,
                      child: ButtonWidget(
                        title: snapshot.data != 2 ? 'Next': 'Get Started',
                        ontap: (){
                          if(_pageController.page != 2) {
                            _pageController.nextPage(
                                duration: const Duration(microseconds: 200),
                                curve: Curves.easeIn);
                          }else {Navigator.of(context).pushNamed(MainAppScreen.routeName);}
                          },
                      ));
                }
              )
            ],
          ))
        ],
      ),
    );
  }
}
