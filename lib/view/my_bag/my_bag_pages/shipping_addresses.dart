

import 'package:community_ecommerce/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class ShippingAddresses extends StatelessWidget {
  ShippingAddresses({super.key});

  Controller controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
            child: const Icon(Icons.arrow_back_ios)),
        title: CustomText(
          text: AppTexts.shippingAddresses,
          fontSize: Dimensions.fontSizeXLarge,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35.h,),
            for(int index = 0; index < 3; index++)
              Column(
                children: [
                  Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0, right: 23.0, top: 18.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomText(text: AppTexts.clientName, color: AppColors.blackColor,
                                fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w500,),
                              const Spacer(),
                              GestureDetector(
                                onTap: (){
                                  Get.toNamed(RouteName.shippingAddresses);
                                },
                                child: CustomText(text: AppTexts.edit, color: AppColors.buttonsColor,
                                  fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w500,),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              CustomText(text: "${AppTexts.clientAddress1} \n${AppTexts.clientAddress2}", color: AppColors.blackColor,
                                fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w400,
                                letterSpacing: -0.15,),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Obx(() {
                            return CheckboxListTile(
                              visualDensity: const VisualDensity(
                                horizontal: -4,
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                              autofocus: false,
                              side: BorderSide(color: AppColors.grayColor),
                              activeColor: AppColors.blackColor,
                              checkColor: Colors.white,
                              selected: controller.isChecked.value,
                              value: controller.isChecked.value,
                              onChanged: (bool? value) {
                                controller.isChecked.value = value!;
                              },
                              title: CustomText(
                                text: AppTexts.defaultPaymentMethod,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w400,
                                fontSize: Dimensions.fontSizeDefault,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                ],
              ),
            SizedBox(height: 20.h,),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(RouteName.addShippingAddress);
                },
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: ShapeDecoration(
                    color: AppColors.blackColor,
                    shape: const OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
