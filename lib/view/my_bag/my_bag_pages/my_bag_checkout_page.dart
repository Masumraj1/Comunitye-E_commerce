import 'package:community_ecommerce/controllers/controller.dart';
import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/utils/app_texts.dart';
import 'package:community_ecommerce/utils/dimentions.dart';
import 'package:community_ecommerce/view/widgets/custom_elevated_button.dart';
import 'package:community_ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/app_icons.dart';
import '../inner/custom_container.dart';

class MyBagCheckOutPage extends StatelessWidget {
  MyBagCheckOutPage({super.key});

  Controller controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  GestureDetector(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
        title: CustomText(
          text: AppTexts.checkoutAppbar,
          fontSize: Dimensions.fontSizeXLarge,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),

            ///<<<-------------------------Shipping Address------------------------->>>///

            CustomText(text: AppTexts.shippingAddressColon, color: AppColors.blackColor,
              fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w400,),
            SizedBox(height: 21.h,),
            Container(
              color: AppColors.whiteColor,
              height: 108.h,
              width: double.infinity,
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
                          child: CustomText(text: AppTexts.change, color: AppColors.buttonsColor,
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 50.h,),

            ///<<<-------------------------Payment Method------------------------->>>///

            Row(
              children: [
                  CustomText(text: AppTexts.payment, color: AppColors.blackColor,
                    fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w400,),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteName.paymentMethodsPage);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: CustomText(text: AppTexts.change, color: AppColors.buttonsColor,
                        fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w500,),
                    ),
                  ),
                ],
            ),
            SizedBox(height: 15.h,),

            Row(
              children: [
                CustomContainer(
                    containerHeight: 40.h,
                    containerWidth: 64.w,
                    borderRadius: 8,
                  imagePath: AppIcons.masterCardIconBlkText,
                  isImage: true,
                  blurRadius: 25,
                  isText: false,
                  text: '',
                ),
                SizedBox(width: 18.w,),
                CustomText(
                  text: AppTexts.cardNumDigits,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.fontSizeDefault,
                  letterSpacing: -0.15,
                ),
              ],
            ),
            SizedBox(height: 55.h,),

            ///<<<-------------------------Delivery Method------------------------->>>///

            CustomText(
              text: AppTexts.deliveryMethodColon,
              color: AppColors.blackColor,
              fontSize: Dimensions.fontSizeLarge,
              fontWeight: FontWeight.w400,),
            SizedBox(height: 20.h,),

            Row(
              children: [
                for(int index = 0; index < controller.courierList.length; index++)
                  Row(
                    children: [
                      CustomContainer(
                        containerHeight: 72.h,
                        containerWidth: 104.w,
                        borderRadius: 8,
                        blurRadius: 25,
                        imagePath: controller.courierList[index],
                        isImage: true,
                        text: AppTexts.deliveryTimes,
                        textColor: AppColors.grayColor,
                        textSize: Dimensions.fontSizeXSmall,
                        textWeight: FontWeight.w400,
                        isText: true,
                        spaceHeight: 11.h,
                      ),
                      if(index != controller.courierList.length - 1)
                        SizedBox(width: 15.w,),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 55.h,),

            ///<<<------------------------Place Order--------------------------->>>///

            Container(
              height: 100.h,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(text: AppTexts.order, color: AppColors.grayColor,fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w500,),
                      const Spacer(),
                      CustomText(text: '112\$', color: AppColors.blackColor,fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w400),
                    ],
                  ),
                  SizedBox(height: 14.h,),
                  Row(
                    children: [
                      CustomText(text: AppTexts.delivery, color: AppColors.grayColor,fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w500),
                      const Spacer(),
                      CustomText(text: '112\$', color: AppColors.blackColor,fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w400),
                    ],
                  ),
                  SizedBox(height: 14.h,),
                  Row(
                    children: [
                      CustomText(text: AppTexts.summary, color: AppColors.grayColor,fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w400),
                      const Spacer(),
                      CustomText(text: '112\$', color: AppColors.blackColor,fontSize: Dimensions.fontSizeXLarge, fontWeight: FontWeight.w400),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 26.h,),
            CustomElevatedButton(
                onPressed: (){
                  Get.toNamed(RouteName.successPage);
                },
                titleText: AppTexts.submitOrder.toUpperCase(),
              buttonWidth: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}

