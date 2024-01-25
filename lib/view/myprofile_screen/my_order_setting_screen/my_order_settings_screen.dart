import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/utils/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/controller.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';
import 'my_order_setting_change_bottom_sheet.dart';

class MyOrderSettingScreen extends StatefulWidget {
  const MyOrderSettingScreen({super.key});

  @override
  State<MyOrderSettingScreen> createState() => _MyOrderSettingScreenState();
}

class _MyOrderSettingScreenState extends State<MyOrderSettingScreen> {
  Controller controller = Get.put(Controller());

  final List sales = [
    AppTexts.sales,
    AppTexts.newArrivals,
    AppTexts.deliverystatuschanges
  ];
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Icon(Icons.search)
      ],),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            CustomText(
              text: AppTexts.settings,
              fontSize: 34.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText(
              text: AppTexts.personalInformation,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              textEditingController: controller.settingFullNameController,
              labelText: AppTexts.fullName,
              isIcon: false,
            ),
            SizedBox(
              height: 17.h,
            ),
            CustomTextField(
              textEditingController: controller.settingDateOfBirthController,
              labelText: AppTexts.dateofBirth,
              isIcon: false,
            ),
            SizedBox(
              height: 35.h,
            ),
            Row(
              children: [
                CustomText(
                  text: AppTexts.password,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                          SettingChangeBottomSheet(controller: controller));
                    },
                    child: CustomText(
                      text: AppTexts.change,
                      fontSize: 14.sp,
                    ))
              ],
            ),
            CustomTextField(
              textEditingController: controller.settingPassword,
              labelText: AppTexts.password,
              isIcon: false,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText(
              text: AppTexts.notifications,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: sales.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            CustomText(
                              text: sales[index],
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            const Spacer(),
                            Switch(

                              activeColor: AppColors.successMarkColor,
                                value: isSwitch,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitch = value;
                                  });
                                })
                          ],
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
