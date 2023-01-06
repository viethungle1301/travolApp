import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel01/core/constance/color_constant.dart';
import 'package:travel01/core/constance/dismension_constane.dart';
import 'package:travel01/representations/screens/home_screen.dart';
class MainAppScreen extends StatefulWidget {
   MainAppScreen({Key? key}) : super(key: key);
  static String routeName = 'main_app';


  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
      children: [
        HomeScreen(),
      ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState((){
            _currentIndex = index;
          });
        },

        selectedItemColor: ColorPalatte.primaryColor,
        unselectedItemColor: ColorPalatte.primaryColor,
        margin: EdgeInsets.symmetric(horizontal: kMediumPadding,vertical: kDefaultIconSize),
        items: [
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.house,
              size: kDefaultIconSize,),
              title: Text('Home')),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.heart,
                size: kDefaultIconSize,),
              title: Text('Likes')),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.briefcase,
                size: kDefaultIconSize,),
              title: Text('Booking')),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.user,
                size: kDefaultIconSize,),
              title: Text('Profile'))
        ],

      ),

    );
  }
}
