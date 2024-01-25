import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controllers/controller.dart';
import '../../../utils/app_texts.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class SettingChangeBottomSheet extends StatelessWidget {
  const SettingChangeBottomSheet({
    super.key,
    required this.controller,
  });

  final Controller controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 472.h,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(34), topRight: Radius.circular(34))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child:
            CustomText(
              text: AppTexts.passwordChange,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            )
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                CustomTextField(
                  textEditingController: controller.settingChangeOldPassword,
                  labelText: AppTexts.oldPassword,
                  isIcon: false,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: CustomText(
                          text: AppTexts.forgotPassword,
                        ))),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextField(
                  textEditingController: controller.settingChangeNewPassword,
                  labelText: AppTexts.newPassword,
                  isIcon: false,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextField(
                  textEditingController: controller.settingChangeRepeatPassword,
                  labelText: AppTexts.repeatNewPassword,
                  isIcon: false,
                ),
                CustomElevatedButton(
                  onPressed: () {  },
                  titleText: AppTexts.sAVEPASSWORD,
                  buttonWidth: 343,

                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
