import 'package:flutter/material.dart';
import 'package:travel01/core/constance/dismension_constane.dart';
import 'package:travel01/core/helper/asset_helper.dart';
import 'package:travel01/core/helper/images_helper.dart';
class ItemGuestAndRoom extends StatefulWidget {
  const ItemGuestAndRoom({Key? key,required this.title, required this.icon, required this.innitData, this.callBack})
      : super(key: key);
  final String title;
  final String icon;
  final int innitData;
  final Function(int)? callBack;

  @override
  State<ItemGuestAndRoom> createState() => _ItemGuestAndRoomState();
}

class _ItemGuestAndRoomState extends State<ItemGuestAndRoom> {
 late final TextEditingController _textEditingController;
  final FocusNode _focusNode = FocusNode();
  late int number;

  @override
  void initState(){
    super.initState();
    number  = widget.innitData;
    _textEditingController = TextEditingController(
        text: widget.innitData.toString())..addListener(() {
          number = int.parse(_textEditingController.text);
        });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: kMediumPadding),
        padding: EdgeInsets.all(kMediumPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(kItemPadding))
        ),
        child: Row(
          children: [
            ImagesHelper.loadFromAsset(AssetsHelper.icoGuest),
            SizedBox(width: 20,),
            Text(widget.title, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
            Spacer(),
            GestureDetector(
              onTap: (){
                if (number > 1){
                  setState((){
                    number --;
                    _textEditingController.text = number.toString();
                    if (_focusNode.hasFocus){
                      _focusNode.unfocus();
                    }
                  });
                }
                widget.callBack?.call(number);
              },
              child: ImagesHelper.loadFromAsset(AssetsHelper.icoTru),
            ),
            Container(
              height: 35,
                width: 60,
                padding: EdgeInsets.only(left: 3),
                alignment: Alignment.center,
                child: TextField(
                  controller: _textEditingController,
                  textAlign: TextAlign.center,
                  focusNode: _focusNode,
                  enabled: true,
                  autocorrect: false,
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(bottom: 18),
                  ),
                  onChanged:  (value){},
                  onSubmitted: (String submitValue){},
                )),
            GestureDetector(
              onTap: (){
                setState((){
                  number++;
                });
                _textEditingController.text = number.toString();
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
                widget.callBack?.call(number);
              },
              child: ImagesHelper.loadFromAsset(AssetsHelper.icoPlus),
            ),
          ],
        ),
    );
  }
}
