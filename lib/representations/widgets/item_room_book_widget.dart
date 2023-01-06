import 'package:flutter/material.dart';
import 'package:travel01/core/constance/color_constant.dart';
import 'package:travel01/core/constance/dismension_constane.dart';
import 'package:travel01/core/helper/asset_helper.dart';
import 'package:travel01/representations/widgets/button.dart';
import 'package:travel01/representations/widgets/dartline_widget.dart';
import 'package:travel01/representations/widgets/item_detail_widget.dart';
class ItemBookRoomWidget extends StatelessWidget {
  const ItemBookRoomWidget({Key? key, required this.nameRoom, required this.imageRoom, required this.roomSize, required this.roomPrice, required this.roomUlility, required this.onTap, this.numberOfRoom}) : super(key: key);
  final String nameRoom;
  final String imageRoom;
  final String roomSize;
  final String roomUlility;
  final int roomPrice;
  final Function()? onTap;
  final int? numberOfRoom;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nameRoom, style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),
                  Text('Room size:  ${roomSize}', style: TextStyle(
                    fontSize:14
                  ),),
                  SizedBox(height: 10,),
                  Text(roomUlility,style: TextStyle(
                    fontSize: 12
                  ),)
                ],
              ),
              Image.asset(imageRoom,height: 60,width: 60,)
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemDetailWidget(icon: AssetsHelper.icoFreeWifi, nameIcon: 'Free \nWifi'),
              ItemDetailWidget(icon: AssetsHelper.icoResfundable, nameIcon: '     Non- \nRefundable'),
              ItemDetailWidget(icon: AssetsHelper.icoBreakfast, nameIcon: '    Free \nBreafast'),
              ItemDetailWidget(icon: AssetsHelper.icoSmoking, nameIcon: '    Non- \nSmoking')
            ],
          ),
          SizedBox(height: 15,),
          DashLineWidget(height: 1, color: ColorPalatte.dashLineColor),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$${roomPrice}',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),),
                  SizedBox(height: 10,),
                  Text('/night',style: TextStyle(
                    fontSize: 10,
                  ),)
                ],
              ),),
              Spacer(),
              numberOfRoom == null ?
              Expanded(
                child: ButtonWidget(title: 'Choose',
                  ontap: onTap,
                  ),
              ) : Text('$numberOfRoom room'),
            ],
          ),
          SizedBox(height: 18,)
        ],
      ),
    );
  }
}
