import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
class DashLineWidget extends StatelessWidget {
  const DashLineWidget({Key? key, required this.height, required this.color}) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      dashColor: color,
      lineThickness: height,
    );
  }
}
