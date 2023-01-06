import 'package:flutter/material.dart';
import 'package:travel01/core/constance/dismension_constane.dart';
import 'package:travel01/core/helper/asset_helper.dart';
import 'package:travel01/core/helper/images_helper.dart';
import 'package:travel01/data/models/room_models.dart';
import 'package:travel01/representations/screens/checkout_screen.dart';
import 'package:travel01/representations/widgets/app_bar.dart';
import 'package:travel01/representations/widgets/item_detail_widget.dart';
import 'package:travel01/representations/widgets/item_room_book_widget.dart';
class SeleteRoomScreen extends StatelessWidget {
  SeleteRoomScreen({Key? key}) : super(key: key);
  static String routeName = '/SeleteRoomScreen';
  final List<RoomModel> listRoom = [
    RoomModel(
      roomImage: AssetsHelper.imageRoom1,
      roomName: 'Deluxe Room',
      roomSize: '27 m2',
      roomUtility: 'Free Cancellation',
      roomPrice: 245,),
    RoomModel(
        roomImage: AssetsHelper.imageRoom2,
        roomName: 'Executive Suite', roomSize: '32 m2', roomUtility: 'Non-refundable',
        roomPrice: 289),
    RoomModel(roomImage: AssetsHelper.imageRoom3,
        roomName: 'King Bed Only Room',
        roomSize: '24 m2',
        roomUtility: 'Non-refundable',
        roomPrice: 214)
    ];

  @override
  Widget build(BuildContext context) {
    return AppBarBuilderWidget(
      titleString: 'Selete Room',

        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.only(bottom: kMediumPadding),
            child: Column(
              children: [
                SizedBox(height: kMediumPadding*2,),
                ...listRoom.map((e) => ItemBookRoomWidget(
                    nameRoom: e.roomName,
                    imageRoom: e.roomImage,
                    roomSize: e.roomSize,
                    roomPrice: e.roomPrice,
                    roomUlility: e.roomUtility,
                    onTap: (){
                      Navigator.of(context).pushNamed(CheckoutScreen.routeName, arguments: e);
                    }))
                .toList(),
                SizedBox(height: kMediumPadding*2,)

              ],
            ),
          ),
        ));
  }
}
