
import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key,
    required this.containerHeight,
    required this.containerWidth,
    this.containerColor = Colors.white,
    this.borderRadius = 8,
    required this.imagePath,
    required this.isImage,
    required this.text,
    required this.isText,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.blurRadius = 0,
    this.shadowDx = 0,
    this.shadowDy = 0,
    this.spaceHeight,
  });

  final double containerHeight;
  final double containerWidth;
  Color containerColor;
  final double borderRadius;
  final double blurRadius;
  final String imagePath;
  final bool isImage;
  final String text;
  final bool isText;
  Color? textColor;
  double? textSize;
  FontWeight? textWeight;
  double? spaceHeight;
  double shadowDx;
  double shadowDy;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: ShapeDecoration(
        color: containerColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        shadows: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: blurRadius,
            offset: Offset(shadowDx, shadowDy),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(isImage)
            SvgPicture.asset(imagePath),
          SizedBox(height: spaceHeight,),
          if(isText)
            CustomText(text: text, color: textColor, fontSize: textSize, fontWeight: textWeight),
        ],
      ),
    );
  }
}