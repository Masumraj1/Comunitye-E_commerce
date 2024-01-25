

import 'package:community_ecommerce/controllers/controller.dart';
import 'package:community_ecommerce/utils/app_texts.dart';
import 'package:community_ecommerce/utils/dimentions.dart';
import 'package:community_ecommerce/view/widgets/custom_elevated_button.dart';
import 'package:community_ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class BottomSheetListView extends StatelessWidget {
  BottomSheetListView({super.key});

  Controller controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.promoCodesList.length,
      itemBuilder: (context, index) {
        var items = controller.promoCodesList[index];
        print("${items[0]}");
        return Padding(
          padding: EdgeInsets.only(top: 12.h, bottom: 12.h, right: 16.w),
          child: Container(
            height: 80.h,
            width: double.infinity,
            decoration: ShapeDecoration(
              color: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              shadows: [
                BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 25,
                    offset: const Offset(0, 1),
                    spreadRadius: 0),
              ],
            ),


            
            child: Row(
              children: [

                /// <<<<------------------Leading Container ---------------------->>>>>>>>>>

                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    child: Container(
                      color: items[0],
                      height: 80.h,
                      width: 90.w,
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: 10.w,),
                            CustomText(text: items[1], color: AppColors.whiteColor, fontSize: Dimensions.fontSizeXXXLarge, fontWeight: FontWeight.w700),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(text: '%', color: AppColors.whiteColor, fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w700),
                                CustomText(text: 'off', color: AppColors.whiteColor, fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w700,)
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 22.h,),
                      CustomText(text: items[2], fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w500, color: AppColors.blackColor,),
                      SizedBox(height: 4.h),
                      CustomText(text: items[3], fontSize: Dimensions.fontSizeXSmall, fontWeight: FontWeight.w400, color: AppColors.blackColor,),
                    ],
                  )
                ),
                Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 12.h,),
                        CustomText(text: items[4], fontSize: Dimensions.fontSizeXSmall, fontWeight: FontWeight.w400, color: AppColors.grayColor,),
                        SizedBox(height: 8.h,),
                        CustomElevatedButton(onPressed: (){
                          controller.isGetPromoCode.value = true;
                          controller.promoCodeController.text = items[3];
                        }, titleText: AppTexts.apply.toUpperCase(), buttonWidth: 93.w, buttonHeight: 36.h, titleSize: 14, titleWeight: FontWeight.w500,),
                      ],
                    )
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

