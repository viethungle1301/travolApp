import 'package:flutter/material.dart';
import 'package:travel01/core/constance/color_constant.dart';
import 'package:travel01/core/constance/dismension_constane.dart';
import 'package:travel01/core/helper/asset_helper.dart';
import 'package:travel01/core/helper/images_helper.dart';
import 'package:travel01/data/models/room_models.dart';
import 'package:travel01/representations/screens/main_app.dart';
import 'package:travel01/representations/widgets/app_bar.dart';
import 'package:travel01/representations/widgets/button.dart';
import 'package:travel01/representations/widgets/item_room_book_widget.dart';
import 'package:travel01/route.dart';
class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key, required this.roomModel}) : super(key: key);

  static const String routeName = '/checkout_screen';

  final RoomModel roomModel;
  List<String> listStep =[
    'book and review',
    'Payment',
    'Confirm',
  ];
  Widget _builderOptionCheckout(String imageItem,String nameOption,String value) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImagesHelper.loadFromAsset(imageItem),
              SizedBox(width: 15,),
              Text(nameOption,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 20,),
          Container(

            width: 200,
            decoration: BoxDecoration(
              color: ColorPalatte.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(Icons.add),
                ),
                SizedBox(width: kDefaultPadding,),
                Text(value,style: TextStyle(fontWeight: FontWeight.bold,)),
              ]
            ),
          ),
        ],
      ),
    );
  }

  Widget _builderItemStepCheckout(int step, String stepName,bool isEnd, bool isCheck){
     return Row(
         children: [
           Container(
             height: 24,
             width: 24,
             decoration: BoxDecoration(
               color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
               borderRadius: BorderRadius.circular(24)),
             alignment: Alignment.center,
             child: Text(step.toString(),style: TextStyle(fontSize: 12),),
             ),
           SizedBox(width: 5,),
           Text(stepName,
           style: TextStyle(
             fontSize: 12,
             color: Colors.white,
           ),),
           SizedBox(width: 11,),
           if (!isEnd) const SizedBox(
               width: 11,
               child: Divider(
                 height: 1,
                 thickness: 1,
                 color: Colors.white,
               ),
             ),
           if(!isEnd)
             const SizedBox(
               width: 11,
             ),
         ],
       );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarBuilderWidget(
        titleString: 'Checkout Screen',
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: listStep.map((e) => _builderItemStepCheckout(
                    listStep.indexOf(e) + 1,
                    e,
                    listStep.indexOf(e) == listStep.length - 1,
                    listStep.indexOf(e)== 0,
                ),
                )
                .toList(),
              ),
              SizedBox(height: kDefaultPadding,),
              ItemBookRoomWidget(
                  nameRoom: roomModel.roomName,
                  imageRoom: roomModel.roomImage,
                  roomSize: roomModel.roomSize,
                  roomPrice: roomModel.roomPrice,
                  roomUlility: roomModel.roomUtility,
                  onTap: (){},
                numberOfRoom: 1,
              ),
              SizedBox(height: kDefaultPadding,),
              _builderOptionCheckout(
                  AssetsHelper.icoContact,
                  'Contact Details',
                  'Add Contact'),
              SizedBox(height: kDefaultPadding,),
              _builderOptionCheckout(AssetsHelper.icoPromo, 'Promo Code', 'Add Promo Code'),
              SizedBox(height: kDefaultPadding,),
              ButtonWidget(title: 'Payment',
              ontap: (){
                Navigator.of(context).popUntil((route) => route.settings.name == MainAppScreen.routeName);
              },)

            ],
          ),
        ));
  }
}
