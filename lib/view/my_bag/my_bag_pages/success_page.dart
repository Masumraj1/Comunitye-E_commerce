
import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/utils/app_texts.dart';
import 'package:community_ecommerce/utils/dimentions.dart';
import 'package:community_ecommerce/utils/images.dart';
import 'package:community_ecommerce/view/widgets/custom_elevated_button.dart';
import 'package:community_ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(AppImages.successImage, fit: BoxFit.fill,)),
          Positioned(
            top: 120.h,
              left: 120.w,
              child: CustomText(
                  text: AppTexts.success,
                color: AppColors.fullBlackColor,
                fontSize: Dimensions.fontSizeXXXLarge,
                fontWeight: FontWeight.w700,
              ),
          ),
          Positioned(
            top: 172.h,
            left: 60.w,
            child: CustomText(
              text: AppTexts.successTexts,
              color: AppColors.fullBlackColor,
              fontSize: Dimensions.fontSizeLarge,
              fontWeight: FontWeight.w400,
            ),
          ),

          Positioned(
            top: 235.h,
              left: 100,
              child: CustomElevatedButton(
                  onPressed: (){
                    Get.toNamed(RouteName.homePage);
                  },
                  titleText: AppTexts.continueShopping.toUpperCase(),
                buttonHeight: 40.h,
                titleSize: Dimensions.fontSizeDefault,
                titleWeight: FontWeight.w400,
              ),
          )
        ],
      ),
    );
  }
}
