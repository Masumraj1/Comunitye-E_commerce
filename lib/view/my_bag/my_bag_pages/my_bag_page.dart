import 'package:community_ecommerce/controllers/controller.dart';
import 'package:community_ecommerce/routes/routes.dart';
import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/utils/dimentions.dart';
import 'package:community_ecommerce/view/widgets/custom_elevated_button.dart';
import 'package:community_ecommerce/view/widgets/custom_text.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_icons.dart';
import '../../../utils/app_texts.dart';
import '../inner/my_bag_list_view.dart';
import '../inner/promo_code_bottom_sheet.dart';
import '../inner/promo_code_text_field.dart';

class MyBagPage extends StatefulWidget {
  MyBagPage({super.key});

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  Controller controller = Get.put(Controller());
  String searchValue = '';
  List<String> suggestions = ["Shoes", "Jens Jacket", "Jens Pants", "Locket", "t-Shirt", "Sport Dress", "Evening Dress", "Blouse"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
          searchBackgroundColor: AppColors.whiteColor,
        iconTheme: IconThemeData(
          color: AppColors.blackColor,
        ),
        elevation: 0,
        backgroundColor: AppColors.pagesColor,
          title: Text(''),
          onSearch: (value) => setState(() => searchValue = value),
          suggestions: suggestions
      ),
      // appBar: AppBar(
      //   actions: [
      //     SvgPicture.asset(AppIcons.searchIcon),
      //     SizedBox(
      //       width: 11.w,
      //     )
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 14.w),
              child: CustomText(
                  text: AppTexts.myBag,
                  fontSize: 34.w,
                  fontWeight: FontWeight.w700),
            ),
            Container(
              height: 410.h,
              width: double.infinity,
              child: MyBagListView(controller: controller),
            ),
            SizedBox(
              height: 25.h,
            ),
            PromoCodeTextField(
                textFieldPadding: 16.0,
                controller: controller,
                isContext: true,
                onTap: () {

                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return PromoCodeBottomSheet();
                    },
                  );
                }),
            SizedBox(
              height: 28.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                children: [
                  CustomText(
                    text: AppTexts.totalAmounts,
                    color: AppColors.grayColor,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimensions.fontSizeDefault.sp,
                  ),
                  const Spacer(),
                  CustomText(
                    text: AppTexts.totalPrice,
                    fontSize: Dimensions.fontSizeDefault.sp,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 26.h,
            ),

            ///<<<----------------------checkout Button------------->>>>
            ///
            ///
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                  child: CustomElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Center(child: CustomText(text: AppTexts.loginFirst, fontSize: Dimensions.fontSizeLarge,)),
                              content: const SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                  ],
                                ),
                              ),
                              actions:
                              [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomElevatedButton(
                                      onPressed: (){
                                        Get.back();
                                      },
                                      titleText: AppTexts.no,
                                      titleSize: Dimensions.fontSizeSmall,
                                      buttonHeight: 30,
                                    ),
                                    SizedBox(width: 10.w,),
                                    CustomElevatedButton(
                                      onPressed: (){
                                        Get.toNamed(RouteName.loginPage);
                                      },
                                      titleText: AppTexts.yes,
                                      titleSize: Dimensions.fontSizeSmall,
                                      buttonHeight: 30,
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        );
                      },
                      titleText: AppTexts.checkOut.toUpperCase(),
                      buttonWidth: double.infinity.w,
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




