import 'package:flutter/material.dart';
import 'package:travel01/core/constance/dismension_constane.dart';

class ItemDetailWidget extends StatelessWidget {
  const ItemDetailWidget({Key? key, required this.icon, required this.nameIcon}) : super(key: key);
  final String icon;
  final String nameIcon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: [
            Container(
                child: Image.asset(icon,width: 32,height: 32,)),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.topCenter,
              child: Text(nameIcon,style: TextStyle(
                fontSize: 10,
              ),),
            )
          ],
        ),
    );
  }
}
