
import 'package:community_ecommerce/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_texts.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

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
              child: CustomText(text: AppTexts.forgotPassword, color: Colors.black, fontSize: Dimensions.fontSizeXXXLarge, fontWeight: FontWeight.w700,),
            ),
            SizedBox(height: 87.h,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: CustomText(text: AppTexts.pleaseEnterYourMail, fontSize: 14, color: AppColors.blackColor,),
            ),
            SizedBox(height: 16.h,),
            CustomTextField(textEditingController: controller.emailController,labelText: AppTexts.email,),
            SizedBox(height: 4.h,),
            Padding(
              padding: const EdgeInsets.only(left: 36.0),
              child: CustomText(text: AppTexts.notValidAddress, fontSize: 11, color: AppColors.errorMarkColor),
            ),
            SizedBox(height: 55.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomElevatedButton(onPressed: (){}, titleText: AppTexts.send.toUpperCase(), titleSize: 14, titleWeight: FontWeight.w500, buttonWidth: 343.w,),
            ),
          ],
        ),
      ),
    );
  }
}
