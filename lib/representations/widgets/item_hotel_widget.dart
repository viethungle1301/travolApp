
import 'package:flutter/material.dart';
import 'package:travel01/core/constance/color_constant.dart';
import 'package:travel01/core/constance/dismension_constane.dart';
import 'package:travel01/core/helper/asset_helper.dart';
import 'package:travel01/core/helper/images_helper.dart';
import 'package:travel01/data/models/hotel_models.dart';
import 'package:travel01/representations/screens/hotel_detail_screen.dart';
import 'package:travel01/representations/widgets/button.dart';
import 'package:travel01/representations/widgets/dartline_widget.dart';


class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({Key? key, required this.hotelModel}) : super(key: key);
  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: ImagesHelper.loadFromAsset(AssetsHelper.imageHotel1,
            radius: BorderRadius.only(topLeft: Radius.circular(kDefaultPadding))),
          ),
          Padding(padding: EdgeInsets.only(left: kDefaultPadding,right: kDefaultPadding,top: 16,bottom: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hotelModel.hotelName,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
              SizedBox(height: kMediumPadding,),
              Row(
                children: [
                  Image.asset(AssetsHelper.icoLocation2,width: 12,height: 16,),
                  SizedBox(width: kTopPadding,),
                  Text(hotelModel.location,style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),),
                  Expanded(
                    child: Text(' - ${hotelModel.awayKilometer} from destination',style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorPalatte.subTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,),
                  )
                ],
              ),
              SizedBox(height: kMediumPadding,),
              Row(
                children: [
                  Image.asset(AssetsHelper.icoStar,width: 16,height: 16,),
                  SizedBox(width: kTopPadding,),
                  Text(hotelModel.star.toString(),style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                  ),),
                  Text(' - (${hotelModel.numberOfReview} reviews)',style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: ColorPalatte.subTextColor,
                  ),)
                ],
              ),
              SizedBox(height: 14.5),
              DashLineWidget(height: 1, color: ColorPalatte.dashLineColor),
              SizedBox(height: kMediumPadding,),
              Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('\$${hotelModel.price.toString()}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),),
                          SizedBox(height: 10,),
                          Text('/night',style: TextStyle(
                            fontSize: 12,
                          ),)
                        ],
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(title: 'Book a room',
                      ontap: (){
                        Navigator.of(context).pushNamed(HotelDetailScreen.routeName,arguments: hotelModel);
                      },
                      ),
                    )
                  ],
                ),




            ],
          ),
          )
        ],
      ),
    );
  }
}
