import 'package:flutter/material.dart';
import 'package:travel01/core/helper/asset_helper.dart';
import 'package:travel01/representations/widgets/app_bar.dart';
import 'package:travel01/representations/widgets/button.dart';
import 'package:travel01/representations/widgets/item_guest_and_room.dart';
class GuestAndRoomBooking extends StatefulWidget {
  const GuestAndRoomBooking({Key? key}) : super(key: key);
  static String routeName = '/guest_and_room_booking';


  @override
  State<GuestAndRoomBooking> createState() => _GuestAndRoomBookingState();
}

class _GuestAndRoomBookingState extends State<GuestAndRoomBooking> {
  String? guestAndRoomData;
  int? guestNumber;
  int? roomNumber;

  @override
  Widget build(BuildContext context) {
    return AppBarBuilderWidget(
      implementLeading: true,

        titleString: 'Add guest and room',
        child: Column(
          children: [
            SizedBox(height: 70,),
            ItemGuestAndRoom(
              callBack: (value){
                guestNumber = value;
              },
                title: 'Guest',
                icon: AssetsHelper.icoGuest,
                innitData: guestNumber??0,
            ),
            SizedBox(height: 20,),
            ItemGuestAndRoom(
                callBack: (value){
                  roomNumber = value;
                },
                title: 'Room',
                icon: AssetsHelper.icoRoom,
                innitData: roomNumber??0),
            SizedBox(height: 20,),
            ButtonWidget(
                ontap: (){
                  Navigator.pop(context, GuestData(guestNumber, roomNumber));
                },
                title: 'Done')
          ],
        )
    );
  }
}
class GuestData {
  int? guestNumber;
  int? roomNumber;
  GuestData(this.guestNumber, this.roomNumber);
}

