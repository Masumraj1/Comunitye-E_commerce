

import 'package:community_ecommerce/controllers/controller.dart';
import 'package:community_ecommerce/view/widgets/custom_elevated_button.dart';
import 'package:community_ecommerce/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class AddShippingAddressPage extends StatelessWidget {
  AddShippingAddressPage({super.key});

  Controller controller = Controller();

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
          text: AppTexts.addShippingAddress,
          fontSize: Dimensions.fontSizeXLarge,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.h),
          child: Column(
            children: [
              SizedBox(height: 45.h,),
              CustomTextField(
                height: 68,
                  textEditingController: controller.fullNameController,
                  labelText: AppTexts.fullName,
                isIcon: false,
              ),
              SizedBox(height: 20.h,),
              CustomTextField(
                height: 68,
                  textEditingController: controller.addressController,
                  labelText: AppTexts.address,
                isIcon: false,
              ),
              SizedBox(height: 20.h,),
              CustomTextField(
                height: 68,
                  textEditingController: controller.cityController,
                  labelText: AppTexts.city,
                isIcon: false,
              ),
              SizedBox(height: 20.h,),
              CustomTextField(
                height: 68,
                textEditingController: controller.stateProvinceController,
                labelText: AppTexts.stateProvinceRegion,
                isIcon: false,
              ),
              SizedBox(height: 20.h,),
              CustomTextField(
                height: 68,
                textEditingController: controller.zipCodeController,
                labelText: AppTexts.zipCode,
                isIcon: false,
              ),
              SizedBox(height: 20.h,),
              CustomTextField(
                height: 68,
                textEditingController: controller.countryController,
                labelText: AppTexts.country,
                isIcon: true,
              ),
              SizedBox(height:50.h,),
              CustomElevatedButton(
                  onPressed: (){

                  },
                  titleText: AppTexts.saveAddress.toUpperCase(), buttonWidth: double.infinity,)
            ],
          ),
        ),
      ),
    );
  }
}
