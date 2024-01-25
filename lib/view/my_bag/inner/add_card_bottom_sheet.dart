
import 'package:community_ecommerce/controllers/controller.dart';
import 'package:community_ecommerce/utils/app_texts.dart';
import 'package:community_ecommerce/utils/dimentions.dart';
import 'package:community_ecommerce/view/widgets/custom_elevated_button.dart';
import 'package:community_ecommerce/view/widgets/custom_text.dart';
import 'package:community_ecommerce/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';

class AddCardBottomSheet extends StatelessWidget {
  AddCardBottomSheet({super.key});

  Controller controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {


      return Container(
        width: double.infinity,
        height: 600,
        decoration: ShapeDecoration(
          color: AppColors.pagesColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                          borderRadius: BorderRadius.circular(3)),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 15.h,
              ),

              Center(
                child: CustomText(
                  text: AppTexts.addNewCard,
                  fontSize: Dimensions.fontSizeXLarge,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),

              SizedBox(
                height: 20.h,
              ),
              
              CustomTextField(textEditingController: controller.cardNameController,labelText: AppTexts.nameOfCard, height: 64.h, isIcon: false,),
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  CustomTextField(textEditingController: controller.cardNumberController,labelText: AppTexts.cardNumber, height: 64.h, isIcon: false,),
                  Positioned(
                    top: 23,
                      right: 20,
                      child: SvgPicture.asset(AppIcons.masterCardIconBlkText))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(textEditingController: controller.expiryDateController,labelText: AppTexts.expiryDate, height: 64.h, isIcon: false,),
              SizedBox(
                height: 20.h,
              ),

              Stack(
                children: [
                  CustomTextField(textEditingController: controller.cvvController,labelText: AppTexts.cvv, height: 64.h, isIcon: false,),
                  Positioned(
                    top: 25,
                      right: 20,
                      child: Image.asset(AppIcons.helpOutlineIcon))
                ],
              ),
              SizedBox(height: 20.h,),
              Obx(() => Row(
                children: [
                  Checkbox(
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                    ),
                    fillColor: controller.isChecked.value? MaterialStateProperty.all(AppColors.blackColor): null,
                    checkColor: AppColors.whiteColor,
                    value: controller.isChecked.value,
                    onChanged: (bool? value) {
                      controller.isChecked.value = value!;
                    },
                  ),
                  CustomText(
                    text: AppTexts.defaultPaymentMethodSet,
                    fontSize: Dimensions.fontSizeDefault,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.41,
                  )
                ],
              ),
              ),

              SizedBox(height: 25.h,),
              CustomElevatedButton(
                buttonWidth: double.infinity,
                  onPressed: (){},
                  titleText: AppTexts.addCard.toUpperCase())
            ],
          ),
        ),
      );

  }
}
