import 'package:flutter/material.dart';
import 'package:travel01/core/constance/dismension_constane.dart';
class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget({Key? key, required this.data, required this.description, required this.icon, required this.onTap}) : super(key: key);
  final String icon;
  final String data;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(kItemPadding))
        ),
        child: Row(
          children: [
            Image.asset(icon,width: 32,height: 32,),
            SizedBox(width:20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                SizedBox(height: 6,),
                Text(description,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),)

              ],
            )

          ],
        ),
      ),
    );
  }
}
