import 'package:community_ecommerce/view/my_bag/inner/promo_code_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';

class PromoCodeTextField extends StatelessWidget {
  PromoCodeTextField({
    super.key,
    this.isContext = false,
    required this.controller,
    required this.textFieldPadding,
    required this.onTap,
  });

  bool isContext;
  final Controller controller;
  final double textFieldPadding;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: textFieldPadding),
      child: Container(
        width: 340.w,
        height: 36.h,
        decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColors.whiteColor,
        ),
        child: Obx(
          () {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                TextField(
                  controller: controller.promoCodeController,
                  onTap: () {},
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 10.0, left: 10.0),
                    suffixIcon: controller.isGetPromoCode.value
                        ? GestureDetector(
                            onTap: () {
                              controller.promoCodeController.text = '';
                              if(isContext){
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return PromoCodeBottomSheet();
                                  },
                                );
                              }
                              isContext = false;
                            },
                            child: Icon(
                              Icons.close,
                              color: AppColors.grayColor,
                            ))
                        : null,
                    hintText: AppTexts.enterPromoCode,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                if (!controller.isGetPromoCode.value || isContext)
                  Positioned(
                    right: -5,
                    child: GestureDetector(
                      onTap: onTap,
                      child: Container(
                        height: 36.h,
                        width: 36.w,
                        decoration: ShapeDecoration(
                            color: AppColors.blackColor,
                            shape: const CircleBorder()),
                        child: Icon(
                          Icons.arrow_forward,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
