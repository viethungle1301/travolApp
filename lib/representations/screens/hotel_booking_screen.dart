import 'package:flutter/material.dart';
import 'package:travel01/core/constance/dismension_constane.dart';
import 'package:travel01/core/extensions/date_ext.dart';
import 'package:travel01/core/helper/asset_helper.dart';
import 'package:travel01/representations/screens/guest_and_room_booking.dart';
import 'package:travel01/representations/screens/hotel_screen.dart';
import 'package:travel01/representations/screens/select_date_screen.dart';
import 'package:travel01/representations/widgets/app_bar.dart';
import 'package:travel01/representations/widgets/button.dart';
import 'package:travel01/representations/widgets/item_booking_widget.dart';
class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key,}) : super(key: key);
  static String routeName = '/hotel_booking_screen';

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;
  String? guestData ;

  @override
  Widget build(BuildContext context) {
    return AppBarBuilderWidget(
      implementLeading: true,
       titleString: 'Hotel Booking',
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: kMediumPadding * 3,),
              ItemBookingWidget(
                  data: 'Destination',
                  description: 'Korea',
                  icon: AssetsHelper.icoLocation,
                  onTap: (){}),
              SizedBox(height: 20),
              ItemBookingWidget(
                  data: 'Select Date',
                  description: dateSelected ?? '13 Feb - 18 Feb 2022',
                  icon: AssetsHelper.icoCalendar,
                  onTap: () async{
                    final result  = await Navigator.of(context).pushNamed(SelectDateScreen.routeName);
                    if (!( result as List<DateTime?>).any((element) => element == null)){
                      dateSelected = '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                      setState((){});
                    }
                  }),
              SizedBox(height: 20),
              ItemBookingWidget(
                  data: 'Guest and Room',
                  description:guestData?? '2 Guest, 1 Room',
                  icon: AssetsHelper.icoBed,
                  onTap: (){
                    Navigator.of(context).pushNamed(GuestAndRoomBooking.routeName).then((value){
                      if (value is GuestData){
                        guestData = value.guestNumber.toString() + ' Guest, '  + value.roomNumber.toString() + ' Room';
                        setState((){
                        });
                      }
                    });
                  }),
              SizedBox(height: 20),
              ButtonWidget(title: 'Seach',
              ontap: (){
                Navigator.of(context).pushNamed(HotelsScreen.routeName);
              },)
            ],
          ),
        ));
  }
}
