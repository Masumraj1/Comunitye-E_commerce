
import 'package:community_ecommerce/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_texts.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  RxDouble height = 64.0.obs;

  final _formKey = GlobalKey<FormState>();

  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: CustomText(text: AppTexts.login, color: Colors.black, fontSize: Dimensions.fontSizeXXXLarge.w, fontWeight: FontWeight.w700,),
              ),
              SizedBox(height: 73.h,),
          
              Obx(() => CustomTextField(
                height: height.value,
                textEditingController: controller.emailController,
                labelText: AppTexts.email,
                validator: (value) {
                  if (!value!.contains("@") || value!.isEmpty) {
                    height.value = 80.h;
                    controller.isValided = false;
                    return 'Enter your valid email';
                  }
                },
              )),
          
              SizedBox(height: 8.h,),

              Obx(() => CustomTextField(
                height: height.value,
                textEditingController: controller.passwordController,
                labelText: AppTexts.password,
                obscureText: true,
                validator: (value) {
                  if (value!.toString().length < 6 || value!.isEmpty) {
                    height.value = 80.h;
                    controller.isValided = false;
                    return 'Must enter more than 6 digits';
                  }
                },
              )),
          
              SizedBox(height: 16.h,),
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteName.forgotPassword);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(text: AppTexts.forgetYourPassword, fontSize: 14, fontWeight: FontWeight.w500),
                      Icon(Icons.arrow_right_alt_sharp, color: AppColors.buttonsColor,),
                    ],
                  ),
                ),
              ),
          
              SizedBox(height: 28.h,),

              ///<<<----------------Login Button------------------>>>>>
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomElevatedButton(onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    Get.toNamed(RouteName.myBagCheckoutPage);
                  }
                }, titleText: AppTexts.login.toUpperCase(), titleSize: 14, titleWeight: FontWeight.w500, buttonWidth: 343.w,),
              ),
              
              SizedBox(height: 10.h,),
              Center(
                child: Wrap(
                  children: [
                    CustomText(text: AppTexts.notHaveAccount, fontWeight: FontWeight.w400, fontSize: Dimensions.fontSizeDefault,),
                    SizedBox(width: 5.w,),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteName.signUpPage);
                      },
                        child: CustomText(
                          text: AppTexts.signUp,
                          fontWeight: FontWeight.w600,
                          fontSize: Dimensions.fontSizeDefault,
                          color: AppColors.errorMarkColor,
                        ),
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: 180.h,),
              Align(
                  alignment: Alignment.center,
                  child: CustomText(text: AppTexts.loginWithSocialAccount, fontSize: 14, fontWeight: FontWeight.w500, color: const Color(0xFF222222),)),
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
      ),
    );
  }
}
