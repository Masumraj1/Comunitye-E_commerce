import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../utils/app_texts.dart';
class CustomContainers extends StatelessWidget {
  const CustomContainers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 343,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.red),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            AppTexts.summerSales,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),

          Text(
            AppTexts.upTo,
            style: TextStyle(fontSize: 14,color: AppColors.whiteColor),
          ),
          ///>>>>>>>>>>>>>>>>>>>>>>>>>>>.....This is Problem<<<<<<<<<<<<<<<<<<///
          // CustomText(
          //   text: AppTexts.upTo,
          // fontSize: 14,
          //   color: Colors.white,
          // )
        ],
      ),
    );
  }
}