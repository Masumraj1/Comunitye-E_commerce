
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class MyBagListView extends StatelessWidget {
  const MyBagListView({
    super.key,
    required this.controller,
  });

  final Controller controller;

  @override
  Widget build(BuildContext context) {
    RxList itemsList = [].obs;
    return ListView.builder(
      itemCount: controller.products.length,
      itemBuilder: (context, index) {
        var items = controller.products[index];
        itemsList.add(items);
        RxInt itemQuantity = items.quantity.obs;

        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16.0.w, vertical: 12.h),
          child: Container(
            height: 104.w,
            width: double.infinity,
            decoration: ShapeDecoration(
              color: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              shadows: [
                BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 25,
                    offset: const Offset(0, 1),
                    spreadRadius: 0),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    child: Image.asset(
                      items.image,
                      fit: BoxFit.cover,
                      height: 184.h,
                      width: 100.w,
                    )),
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: items.name,
                                  fontSize: Dimensions.fontSizeLarge.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: "${AppTexts.colorItem}: ",
                                      color: AppColors.grayColor,
                                      fontSize:
                                      Dimensions.fontSizeLarge.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CustomText(
                                      text: items.color,
                                      fontSize:
                                      Dimensions.fontSizeLarge.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      width: 13.w,
                                    ),
                                    CustomText(
                                      text: "${AppTexts.sizeItem}: ",
                                      color: AppColors.grayColor,
                                      fontSize:
                                      Dimensions.fontSizeLarge.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CustomText(
                                      text: items.size,
                                      fontSize:
                                      Dimensions.fontSizeLarge.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            ),
                            const Spacer(),

        ///<<<---------------------PopUp to delete ------------------>>>

                            GestureDetector(
                              onTap: (){
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(AppTexts.deleteItem),
                                        content: const SingleChildScrollView(
                                          child: ListBody(
                                            children: [
                                              Text(AppTexts.sureToDelete),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            child: const Text(AppTexts.no),
                                            onPressed: () {
                                              Get.back();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text(AppTexts.yes),
                                            onPressed: () {
                                              Get.back();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                );
                              },
                              child: Icon(
                                Icons.more_vert_rounded,
                                color: AppColors.grayColor,
                              ),
                            ),
                          ],
                        ),
                      ),

        ///<<<----------------------Quantity Increment and Decrement Portion---------------->>>>>.
                      Padding(
                        padding: EdgeInsets.only(right: 12.0.w),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                itemQuantity.value--;
                              },
                              child: Container(
                                width: 24.w,
                                height: 24.w,
                                decoration: ShapeDecoration(
                                  color: AppColors.whiteColor,
                                  shape: const CircleBorder(),
                                  shadows: [
                                    BoxShadow(
                                      color: AppColors.shadowColor,
                                      blurRadius: 4,
                                      offset: const Offset(0, 4),
                                    )
                                  ],
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: AppColors.grayColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 21.w,
                            ),
                            Obx(() => CustomText(
                              text: itemQuantity.toString(),
                              fontSize: Dimensions.fontSizeDefault.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w500,
                            ),),
                            SizedBox(
                              width: 21.w,
                            ),
                            GestureDetector(
                              onTap: (){
                                itemQuantity.value++;
                              },
                              child: Container(
                                width: 24.w,
                                height: 24.w,
                                decoration: ShapeDecoration(
                                  color: AppColors.whiteColor,
                                  shape: const CircleBorder(),
                                  shadows: [
                                    BoxShadow(
                                      color: AppColors.shadowColor,
                                      blurRadius: 4,
                                      offset: const Offset(0, 4),
                                    )
                                  ],
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.grayColor,
                                ),
                              ),
                            ),
                            const Spacer(),
                            CustomText(
                              text: items.price,
                              color: AppColors.blackColor,
                              fontSize: Dimensions.fontSizeDefault.sp,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}