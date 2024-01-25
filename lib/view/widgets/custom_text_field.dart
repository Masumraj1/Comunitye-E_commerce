
import 'package:community_ecommerce/controllers/controller.dart';
import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/app_icons.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    this.height = 64,
    this.isImage = false,
    this.isIcon = true,
    this.obscureText = false,
    this.maxLines = 1,
    this.validator,
  });

  TextEditingController textEditingController;
  final String labelText;
  final double height;
  bool isImage;
  bool isIcon;
  int maxLines;
  bool obscureText;
  final FormFieldValidator? validator;


  Controller textFieldController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration:BoxDecoration(
          border: textFieldController.isValided? null : Border.all(color: AppColors.errorMarkColor),
          borderRadius: BorderRadius.circular(4),
          color: AppColors.whiteColor,
        ),
        height: height,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    obscureText: obscureText,
                    maxLines: maxLines,
                    keyboardType: TextInputType.multiline,
                    controller: textEditingController,
                    onTap: (){

                    },
                    decoration: InputDecoration(
                      suffixIcon: textEditingController.text.isEmpty? null : isIcon? textFieldController.isValided? Icon(Icons.check, color: AppColors.successMarkColor,)
                          :  SvgPicture.asset(AppIcons.crossIcon, color:AppColors.errorMarkColor, height: 14.h,width: 14.w,)
                        : null,
                      labelStyle: TextStyle(
                        color: AppColors.grayColor,
                      ),
                      labelText: labelText,

                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      )
                    ),
                    validator: validator,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
