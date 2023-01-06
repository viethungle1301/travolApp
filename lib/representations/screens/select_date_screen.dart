import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel01/core/constance/color_constant.dart';
import 'package:travel01/core/constance/dismension_constane.dart';
import 'package:travel01/representations/widgets/app_bar.dart';
import 'package:travel01/representations/widgets/button.dart';
class SelectDateScreen extends StatelessWidget {
   SelectDateScreen({Key? key}) : super(key: key);
  static const routeName = '/select_date_screen';
  
  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return AppBarBuilderWidget(
      implementLeading: true,
      titleString: 'Select Date',
        child: Column(
          children: [
            SizedBox( height: kMediumPadding * 2),
            SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              selectionColor: ColorPalatte.yellowColor,
              startRangeSelectionColor: ColorPalatte.yellowColor,
              endRangeSelectionColor: ColorPalatte.yellowColor,
              rangeSelectionColor: ColorPalatte.yellowColor.withOpacity(0.25),
              todayHighlightColor: ColorPalatte.yellowColor,
              toggleDaySelection: false,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args){
                if( args.value is PickerDateRange){
                  rangeStartDate = args.value.startDate;
                  rangeEndDate = args.value.endDate;
                }
              },
            ),
            ButtonWidget(
              title: 'Select',
              ontap: (){
                Navigator.of(context).pop( [rangeStartDate, rangeEndDate]);
              },
            ),
            SizedBox(height:  kMediumPadding,),
            ButtonWidget(
                title: 'Cancle',
            ontap: (){
                  Navigator.of(context).pop(null);
            },)
          ],
        )
    );
  }
}
