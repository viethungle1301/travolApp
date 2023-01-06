import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel01/core/constance/color_constant.dart';
import 'package:travel01/core/constance/dismension_constane.dart';
import 'package:travel01/core/helper/asset_helper.dart';
import 'package:travel01/core/helper/images_helper.dart';
import 'package:travel01/data/models/destination_model.dart';
import 'package:travel01/representations/screens/hotel_booking_screen.dart';
import 'package:travel01/representations/widgets/app_bar.dart';
class HomeScreen extends StatefulWidget {
 HomeScreen({Key? key}) : super(key: key);



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _builderItemDestination(String nameDes,String imageDes,bool isNow){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(HotelBookingScreen.routeName,arguments: nameDes);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: kMediumPadding),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ImagesHelper.loadFromAsset(imageDes,fit: BoxFit.fitWidth,radius: BorderRadius.all(Radius.circular(kDefaultPadding))),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Icon(
                FontAwesomeIcons.solidHeart,
                color: isNow != true ? Colors.white : Colors.red ),
            ),
            Positioned(
              left: 10,
                bottom: 5,
                child: Column(
              children: [
                Text(nameDes,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),
                SizedBox(height: 10,),
                Container(
                  width: 50,
                  height: 24,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white.withOpacity(0.8)
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImagesHelper.loadFromAsset(AssetsHelper.icoStar),
                        SizedBox(width: 5,),
                        Text('4,5')
                      ],
                    ),
                  ),
                )
              ],
            ))
          ],

        ),
      ),
    );
  }
  Widget _builderItemCategory( Widget icon,Color color, Function() onTap, String title){
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 98.33,
            height: 75,
            padding: EdgeInsets.symmetric(vertical: kMediumPadding),
            child: icon,
            decoration: BoxDecoration(color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(kItemPadding)),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Text(title)
        ],
      ),
    );
  }
  final List<DestinationModel> listDestination = [
    DestinationModel(
        destinationName: 'Korea',
        destinationImage: AssetsHelper.imageKorea),
    DestinationModel(destinationName: 'Dubai',
        destinationImage: AssetsHelper.imageDubai)
  ];


  @override
  Widget build(BuildContext context) {
    return AppBarBuilderWidget(
      title: Padding(padding:EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Hi Patrick!',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                height: kMediumPadding,
              ),
              Text('Where are you going day?',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),)
            ],
          ),
          Spacer(),
          Icon(
            FontAwesomeIcons.bell,
            size: kDefaultIconSize,
            color: Colors.white,
          ),
          SizedBox(
            width: kMediumPadding,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kItemPadding),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(kMinPadding),
            child: ImagesHelper.loadFromAsset(AssetsHelper.imageAvatar),
          )
        ],
      )),
      child: Column(
        children: [
          TextField(
            decoration:  InputDecoration(
              hintText: 'Search your destination',
              prefixIcon: Padding(
                  padding: EdgeInsets.all(kTopPadding),
              child: Icon(FontAwesomeIcons.magnifyingGlass,
              color: Colors.black38,
              size: kDefaultPadding,),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(kItemPadding))
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding)
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _builderItemCategory(
                  ImagesHelper.loadFromAsset(AssetsHelper.icoHotel,width: 24,height: 24),
                  Color(0xffFE9C5E),
                      () {
                    Navigator.of(context).pushNamed(HotelBookingScreen.routeName);
                      },
                  'Hotels')),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(child: _builderItemCategory(
                  ImagesHelper.loadFromAsset(AssetsHelper.icoPlane,width: 24,height: 24),
                  Color(0xffF77777),
                      () {},
                  'Flights')),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(child: _builderItemCategory(
                  ImagesHelper.loadFromAsset(AssetsHelper.icoHotelPlane,width: 34,height: 34),
                  Color(0xff3EC8BC),
                      () {},
                  'All')),
            ],
          ),
          SizedBox(height: kMediumPadding,),
          Row(
            children: [
              Text('Popular Destinations',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              Spacer(),
              Text('See All',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: ColorPalatte.primaryColor),)
            ],
          ),
          SizedBox(height: kDefaultPadding,),
          Row(
            children:[
              Expanded(
                child: Column(children: [
                _builderItemDestination('Korea', AssetsHelper.imageKorea,true),
                _builderItemDestination('Dubai', AssetsHelper.imageDubai, false)
            ]),
              ),
              SizedBox(width: 25,),
              Expanded(
                child: Column(children: [
                  _builderItemDestination('Turkey', AssetsHelper.imageTurkey,false),
                  _builderItemDestination('Japan', AssetsHelper.imageJapan,false)
                ]),
              )

            ]
          )]
    ),
    );
  }
}
