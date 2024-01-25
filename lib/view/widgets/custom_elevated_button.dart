
import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String titleText;
  final Color titleColor;
  final Color buttonColor;
  final Color borderColor;
  final double titleSize;
  final FontWeight titleWeight;
  final double buttonRadius;
  final double buttonHeight;
  final double? buttonWidth;

  const CustomElevatedButton(
      {required this.onPressed,
        required this.titleText,
        this.titleColor = Colors.white,
        this.buttonColor = const Color(0xFFDB3022),
        this.titleSize = 18,
        this.buttonRadius = 25,
        this.titleWeight = FontWeight.w600,
        this.buttonHeight = 48,
        this.buttonWidth,
        this.borderColor = const Color(0xFFDB3022),
        super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight.h,
      width: buttonWidth?.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(
            color: borderColor,
          )),
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius),
              ),
            ),
            elevation: MaterialStateProperty.all(0)),
        child: CustomText(text: titleText, color: titleColor, fontWeight: titleWeight, fontSize: titleSize.sp,),
      ),
    );
  }
}
