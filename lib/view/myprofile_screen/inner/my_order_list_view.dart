import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class MyOrderListView extends StatelessWidget {
  const MyOrderListView({
    super.key,
    required this.controller,
  });

  final Controller controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.products.length,
      itemBuilder: (context, index) {
        var items = controller.products[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Container(
            height: 120.w,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    child: Image.asset(
                      items.image,
                      fit: BoxFit.cover,
                      height: 184.h,
                      width: 100.w,
                    )),
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0.h),
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: items.name,
                                  fontSize: Dimensions.fontSizeLarge.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  text: items.type,
                                  color: AppColors.grayColor,
                                  fontSize: Dimensions.fontSizeXSmall.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    CustomText(
                                      text: "${AppTexts.colorItem}: ",
                                      color: AppColors.grayColor,
                                      fontSize: Dimensions.fontSizeXSmall.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CustomText(
                                      text: items.color,
                                      fontSize: Dimensions.fontSizeXSmall.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      width: 13.w,
                                    ),
                                    CustomText(
                                      text: "${AppTexts.sizeItem}: ",
                                      color: AppColors.grayColor,
                                      fontSize: Dimensions.fontSizeXSmall.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CustomText(
                                      text: items.size,
                                      fontSize: Dimensions.fontSizeXSmall.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 12.0.w),
                        child: Row(
                          children: [
                            CustomText(
                              text: AppTexts.units,
                              fontSize: Dimensions.fontSizeXSmall.sp,
                              color: AppColors.grayColor,
                              fontWeight: FontWeight.w400,
                            ),
                            CustomText(
                              text: " ${items.units}",
                              fontSize: Dimensions.fontSizeXSmall.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            const Spacer(),
                            CustomText(
                              text: items.price,
                              color: AppColors.blackColor,
                              fontSize: Dimensions.fontSizeDefault.sp,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}