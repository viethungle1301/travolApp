import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel01/core/constance/color_constant.dart';
import 'package:travel01/core/helper/local_storage.dart';
import 'package:travel01/representations/screens/splash_screen.dart';
import 'package:travel01/route.dart';
void main()async{
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorage();
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorPalatte.primaryColor,
        backgroundColor: ColorPalatte.scaffoldBackgroudColor,
        scaffoldBackgroundColor: ColorPalatte.scaffoldBackgroudColor,
      ),
      routes: routes,
      onGenerateRoute: generateRoutes,
      home: const SplashScreen(),
    );
  }
}



