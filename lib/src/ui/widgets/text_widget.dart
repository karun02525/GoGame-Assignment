import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  bool isBold;
  Color color;
  double top;
  double left;
  double right;
  double bottom;
  double fontSize;

  TextWidget({
    this.title,
    this.color,
    this.isBold = false,
    this.top = 0.0,
    this.bottom = 0.0,
    this.left = 0.0,
    this.right = 0.0,
    this.fontSize = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top, bottom: bottom,left: left,right: right),
      child: isBold
          ? Text(title??'',
          style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.bold

          ))
          : Text(title??'',
          style: TextStyle(
              color: color,
              fontSize: fontSize,
             )),
    );
  }
}
