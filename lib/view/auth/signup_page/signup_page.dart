
import 'package:community_ecommerce/controllers/controller.dart';
import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/utils/app_icons.dart';
import 'package:community_ecommerce/utils/app_texts.dart';
import 'package:community_ecommerce/utils/dimentions.dart';
import 'package:community_ecommerce/view/widgets/custom_elevated_button.dart';
import 'package:community_ecommerce/view/widgets/custom_text.dart';
import 'package:community_ecommerce/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';



class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: CustomText(text: AppTexts.signUp, color: Colors.black, fontSize: Dimensions.fontSizeXXXLarge, fontWeight: FontWeight.w700,),
            ),
            SizedBox(height: 73.h,),
            CustomTextField(textEditingController: controller.nameController, labelText: AppTexts.name),
            SizedBox(height: 8.h,),
            CustomTextField(textEditingController: controller.emailController, labelText: AppTexts.email),
            SizedBox(height: 8.h,),
            CustomTextField(textEditingController: controller.passwordController, labelText: AppTexts.password),
            SizedBox(height: 16.h,),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(RouteName.loginPage);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(text: AppTexts.alreadyAccount, fontSize: 14, fontWeight: FontWeight.w500),
                    Icon(Icons.arrow_right_alt_sharp, color: AppColors.buttonsColor,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 28.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomElevatedButton(onPressed: (){}, titleText: AppTexts.signUp.toUpperCase(), titleSize: 14, titleWeight: FontWeight.w500, buttonWidth: 343.w,),
            ),
            SizedBox(height: 126.h,),
            Align(
                alignment: Alignment.center,
                child: CustomText(text: AppTexts.socialAccountSignUP, fontSize: 14, fontWeight: FontWeight.w500,)),
            SizedBox(height: 32.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.googleIcon),
                SizedBox(width: 86.w,),
                SvgPicture.asset(AppIcons.facebookIcon, height: 24.h, width: 24.w,),
              ],
            )
          ],
        ),
      ),
    );
  }
}