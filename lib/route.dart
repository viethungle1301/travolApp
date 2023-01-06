import 'package:flutter/material.dart';
import 'package:travel01/data/models/hotel_models.dart';
import 'package:travel01/data/models/room_models.dart';
import 'package:travel01/representations/screens/checkout_screen.dart';
import 'package:travel01/representations/screens/guest_and_room_booking.dart';
import 'package:travel01/representations/screens/hotel_booking_screen.dart';
import 'package:travel01/representations/screens/hotel_detail_screen.dart';
import 'package:travel01/representations/screens/hotel_screen.dart';
import 'package:travel01/representations/screens/intro_screen.dart';
import 'package:travel01/representations/screens/main_app.dart';
import 'package:travel01/representations/screens/select_date_screen.dart';
import 'package:travel01/representations/screens/selete_room_screen.dart';
import 'package:travel01/representations/screens/splash_screen.dart';
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName : (context) => const SplashScreen(),
  IntroScreen.routeName : (context) => const IntroScreen(),
  MainAppScreen.routeName: (context) =>  MainAppScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(),
  GuestAndRoomBooking.routeName: (context) => const GuestAndRoomBooking(),
  HotelsScreen.routeName: (context) => const HotelsScreen(),
  SeleteRoomScreen.routeName: (context) => SeleteRoomScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings){
  switch (settings.name){
    case HotelDetailScreen.routeName:
      return MaterialPageRoute(
          builder: (context){
        final HotelModel hotelModel = (settings.arguments as HotelModel);
        return HotelDetailScreen(
          hotelModel: hotelModel,
        );
      },
      );
      case CheckoutScreen.routeName:
          return MaterialPageRoute(
            builder: (context){
              final RoomModel roomModel = (settings.arguments as RoomModel);
              return CheckoutScreen(
                roomModel: roomModel,
              );
            },
          );
    // case HotelBookingScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (context){
    //       final String nameDestination = (settings.arguments as String);
    //       return HotelBookingScreen(
    //         nameDestination: nameDestination,
    //       );
    //     },
    //   );
    }
    return null;
  }