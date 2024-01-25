
import 'package:community_ecommerce/controllers/controller.dart';
import 'package:community_ecommerce/view/my_bag/inner/bottom_sheet_list_view.dart';
import 'package:community_ecommerce/view/my_bag/inner/promo_code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class PromoCodeBottomSheet extends StatelessWidget {
  PromoCodeBottomSheet({
    super.key,
  });
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 464.h,
      decoration: ShapeDecoration(
        color: AppColors.pagesColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34.w),
            topRight: Radius.circular(34.w),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 14.h,
            ),
            Center(
              child: GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  width: 60.w,
                  height: 6.h,
                  decoration: ShapeDecoration(
                    color: AppColors.hintTextColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.w)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            PromoCodeTextField(
                textFieldPadding: 0,
                controller: controller,
                onTap: (){

                }),
            SizedBox(
              height: 32.h,
            ),
            CustomText(
              text: AppTexts.yourPromoCode,
              fontSize: Dimensions.fontSizeXLarge,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
            Expanded(
              child: BottomSheetListView(),
            )
          ],
        ),
      ),
    );
  }
}
