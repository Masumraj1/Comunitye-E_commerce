import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    this.lineThrough,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.textHeight,
    this.letterSpacing,
  });


  final String text;
  TextDecoration? lineThrough;
  Color? color;
  double? fontSize;
  String? fontFamily;
  FontWeight? fontWeight;
  double? textHeight;
  double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: lineThrough,
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        height: textHeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
