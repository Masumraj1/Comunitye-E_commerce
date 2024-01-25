import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';
class OrderContainer extends StatelessWidget {
  final String label;
  final String text;

  const OrderContainer({
    super.key,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
              margin: const EdgeInsets.all(10),
              width: 115.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34), color: AppColors.blackColor),
              child: Center(
                  child:
                CustomText(
                  text: label,
                  color: Colors.white,
                )
              )),
        ),
      ],
    );
  }
}
