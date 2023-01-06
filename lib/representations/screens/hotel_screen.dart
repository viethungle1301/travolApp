import 'package:flutter/material.dart';
import 'package:travel01/core/helper/asset_helper.dart';
import 'package:travel01/data/models/hotel_models.dart';
import 'package:travel01/representations/widgets/app_bar.dart';
import 'package:travel01/representations/widgets/item_hotel_widget.dart';
class HotelsScreen extends StatefulWidget {
  const HotelsScreen({Key? key}) : super(key: key);
  static const String routeName = '/hotel_screen';

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  final List<HotelModel>listHotel = [
    HotelModel(
        hotelImage: AssetsHelper.imageHotel1,
        hotelName: 'Royal Palm Heritage',
        location: 'Purwokerto, Jateng',
        awayKilometer: '364 m',
        star: 4.5,
        numberOfReview: 3241,
        price: 143
    ),
    HotelModel(
        hotelImage: AssetsHelper.imageHotel2,
        hotelName: 'Grand Luxury’s',
        location: 'Banyumas, Jateng',
        awayKilometer: '2.3 km',
        star: 4.2,
        numberOfReview: 2456,
        price: 234
    ),
    HotelModel(
        hotelImage: AssetsHelper.imageHotel3,
        hotelName: 'The Orlando House',
        location: 'Ajibarang, Jateng',
        awayKilometer: '1.1 km',
        star: 3.8,
        numberOfReview: 1234,
        price: 132,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarBuilderWidget(
      titleString: 'Hotels',
        implementTraling: true,
        child: SingleChildScrollView(
          child: Column(
            children: listHotel.map((e) => ItemHotelWidget(hotelModel: e)).toList(),
          ),
        ));
  }
}
