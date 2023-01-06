
import 'package:flutter/material.dart';
import 'package:travel01/core/helper/asset_helper.dart';
import 'package:travel01/core/helper/images_helper.dart';
import 'package:travel01/representations/screens/intro_screen.dart';
import 'package:travel01/representations/screens/main_app.dart';
import '../../core/helper/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
 static String routeName = 'Splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){ //chuyen vao initState
    super.initState();
    redirectIntroScreen();
  }
  void redirectIntroScreen() async{
    final IgnoreIntroScreen = LocalStorageHelper.getValue('ignoreIntroScreen') as bool? ;
    await Future.delayed( const Duration(seconds: 2));
    if ( IgnoreIntroScreen != null && IgnoreIntroScreen){
      Navigator.of(context).pushNamed(MainAppScreen.routeName);
    }else {
      LocalStorageHelper.setValue('ignoreIntroScreen', true);
      Navigator.of(context).pushNamed(IntroScreen.routeName);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Positioned.fill(child:ImagesHelper.loadFromAsset(AssetsHelper.imageBackGroundSplash, fit: BoxFit.fitWidth)),
        Positioned.fill(child: ImagesHelper.loadFromAsset(AssetsHelper.imageGroup))
      ],
    );
  }
}
