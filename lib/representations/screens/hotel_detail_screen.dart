import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel01/core/constance/color_constant.dart';
import 'package:travel01/core/constance/dismension_constane.dart';
import 'package:travel01/core/helper/asset_helper.dart';
import 'package:travel01/core/helper/images_helper.dart';
import 'package:travel01/data/models/hotel_models.dart';
import 'package:travel01/representations/screens/selete_room_screen.dart';
import 'package:travel01/representations/widgets/button.dart';
import 'package:travel01/representations/widgets/dartline_widget.dart';
import 'package:travel01/representations/widgets/item_detail_widget.dart';
class HotelDetailScreen extends StatefulWidget {
   const HotelDetailScreen({Key? key, required this.hotelModel}) : super(key: key);
  static const String routeName = '/hotel_detail_screen';
  final HotelModel hotelModel;

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: ImagesHelper.loadFromAsset(
                  AssetsHelper.imageDetail,
                  fit: BoxFit.fill)),
          Positioned(
              top: 20 * 3,
              left: kMediumPadding,
              child: GestureDetector(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(kItemPadding),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)
                    )),
              child: Icon(FontAwesomeIcons.arrowLeft),

            ),
          )),Positioned(
              top: 20 * 3,
              right: 38,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(kItemPadding),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)
                      )),
                  child: Icon(FontAwesomeIcons.solidHeart,
                  size: 18,
                  color: ColorPalatte.heartColor,),

                ),
              )),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
          maxChildSize: 0.8,
          minChildSize: 0.3,
              builder: (context, scrollController){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding * 2),
                  topRight: Radius.circular(kDefaultPadding * 2),
                ),
              ),
              child:  Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: kDefaultPadding),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(kItemPadding)
                          )),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding,),
                    Expanded(child: ListView(
                      controller: scrollController,
                      children: [
                        Row(
                          children: [
                            Text(widget.hotelModel.hotelName,
                              style:TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ) ,),
                            Spacer(),
                            Text('\$${widget.hotelModel.price}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),),
                            Text('/night',style: TextStyle(
                              fontSize: 10,
                            ),)
                          ],
                        ),
                        SizedBox(height: kDefaultPadding,),
                        Row(
                          children: [
                            Image.asset(AssetsHelper.icoLocation2),
                            SizedBox(width: 10,),
                            Text(widget.hotelModel.location, style: TextStyle(
                              fontSize: 12,
                            ),)
                          ],
                        ),
                        SizedBox(height: kDefaultPadding,),
                        DashLineWidget(height: 1, color: ColorPalatte.dashLineColor),
                        SizedBox(height: kDefaultPadding,),
                        Row(
                          children: [
                            Image.asset(AssetsHelper.icoStar,width: 20,height: 20,),
                            SizedBox(width: 8,),
                            Text(widget.hotelModel.star.toString() + '/5 ',style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff313131),
                            ),),
                            Text('(${widget.hotelModel.numberOfReview} reviews)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff838383),
                            ),),
                            Spacer(),
                            Text('See All',style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff6155CC),
                            ),)
                          ],
                        ),
                        SizedBox(height: kDefaultPadding,),
                        DashLineWidget(height: 1, color: ColorPalatte.dashLineColor),
                        SizedBox(height: kDefaultPadding,),
                        Text('Information',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        SizedBox(height: 15,),
                        Text('You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.',
                          style: TextStyle(
                            fontSize: 14,
                          ),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ItemDetailWidget(icon: AssetsHelper.icoRestaurant, nameIcon: 'Restaurant'),
                            ItemDetailWidget(icon: AssetsHelper.icoWWifi, nameIcon: 'Wifi'),
                            ItemDetailWidget(icon: AssetsHelper.icoCurrency, nameIcon: 'Currency \nExchange'),
                            ItemDetailWidget(icon: AssetsHelper.icoFrontDesk, nameIcon: '24-hour \nFront Desk'),
                            ItemDetailWidget(icon: AssetsHelper.icoMore, nameIcon: 'More'),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text('Location',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 15,),
                        Text('Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.',
                        style: TextStyle(
                          fontSize: 14,
                        ),),
                        SizedBox(height: kDefaultPadding,),
                        Image.asset(AssetsHelper.imageMap),
                        ButtonWidget(title: 'Selete Room',
                        ontap: (){
                          Navigator.of(context).pushNamed(SeleteRoomScreen.routeName);
                        },
                        )



                      ],
                    ))
                  ],
                ),
              );
          })
        ],
      ),
    );
  }
}
