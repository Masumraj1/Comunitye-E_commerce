import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/utils/dimentions.dart';
import 'package:community_ecommerce/view/widgets/custom_elevated_button.dart';
import 'package:community_ecommerce/view/widgets/custom_text.dart';
import 'package:community_ecommerce/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../controllers/controller.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_texts.dart';
import '../../../utils/images.dart';

class RatingsReviewsPage extends StatelessWidget {
  RatingsReviewsPage({super.key});

  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0.h,
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: CustomText(
                      text: AppTexts.ratingNReviews,
                      fontSize: Dimensions.fontSizeXXXLarge.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: AppTexts.ratingRatio,
                              fontSize: Dimensions.fontSizeXXXLarge.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.blackColor,
                            ),
                            CustomText(
                              text:
                                  "${controller.ratingsList[0]["totalRatings"]} ${AppTexts.ratings}",
                              fontSize: Dimensions.fontSizeDefault.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grayColor,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          for (int indexI = controller.ratingsList.length - 1;
                              indexI > 0;
                              indexI--)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                for (int indexJ = indexI; indexJ > 0; indexJ--)
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppIcons.starIconSolid),
                                      Text(' '),
                                    ],
                                  ),
                                Text(''),
                              ],
                            ),
                        ],
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 80,
                          width: 120,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.reviewProgressList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    LinearPercentIndicator(
                                      barRadius: Radius.circular(4),
                                      backgroundColor: AppColors.pagesColor,
                                      width: 100.0,
                                      lineHeight: 8.0,
                                      percent:
                                          controller.reviewProgressList[index],
                                      progressColor: AppColors.buttonsColor,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            children: [
                              for (int index = 0;
                                  index < controller.reviewerList.length;
                                  index++)
                                CustomText(
                                  text: "${controller.reviewerList[index]}",
                                  color: AppColors.blackColor,
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                    height: 30.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        CustomText(
                          text:
                              "${controller.ratingsList.length} ${AppTexts.review}",
                          color: AppColors.blackColor,
                          fontSize: Dimensions.fontSizeXXLarge.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        Spacer(),
                        Obx(
                          () => Checkbox(
                            visualDensity: const VisualDensity(
                              horizontal: -4,
                            ),
                            side: BorderSide(color: AppColors.grayColor),
                            fillColor: controller.isChecked.value
                                ? MaterialStateProperty.all(AppColors.blackColor)
                                : null,
                            checkColor: AppColors.whiteColor,
                            value: controller.isChecked.value,
                            onChanged: (bool? value) {
                              controller.isChecked.value = value!;
                            },
                          ),
                        ),
                        CustomText(
                          text: AppTexts.withPhoto,
                          color: AppColors.blackColor,
                          fontSize: Dimensions.fontSizeDefault.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.41,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
          
                  ///<<<<------------------------------Reviewer Feedback-------------------->>>>
                  Container(
                    height: 480.h,
                    width: double.infinity,
                    child: SingleChildScrollView(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0.w, vertical: 10.0.h),
                      child: Column(
                        children: [
                          HelloComments(
                              profileImg: AppImages.categoryCloths,
                              name: AppTexts.reviewer,
                              comments: AppTexts.reviewDescription),
                          HelloComments(
                              profileImg: AppImages.categoryCloths,
                              name: AppTexts.reviewer,
                              comments: AppTexts.reviewDescription),
                          HelloComments(
                              profileImg: AppImages.categoryCloths,
                              name: AppTexts.reviewer,
                              comments: AppTexts.reviewDescription),
                        ],
                      ),
                    )),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 180.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0, -1.50),
                      end: Alignment(0, 1),
                      colors: [
                        AppColors.pagesColor.withOpacity(0.3),
                        AppColors.pagesColor
                      ],
                    ),
                  ),
                ),
              ),
          
              ////<<<<<---------------------------------------Bottom Sheet Open----------------------->>>>>
          
              Positioned(
                bottom: 20.h,
                right: 10.w,
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 600.h,
                            width: double.infinity,
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
                              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  GestureDetector(
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
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  CustomText(
                                    text: AppTexts.addNewCard,
                                    fontSize: Dimensions.fontSizeXLarge,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blackColor,
                                  ),
                                  SizedBox(height: 15.h,),
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children: [
                                      for(int index = 0; index < 5; index ++ )
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                controller.isStarTapped.value = !controller.isStarTapped.value;
                                              },
                                              child: Obx(() => controller.isStarTapped.value?
                                                Icon(Icons.star_outlined, color: AppColors.goldColor,)
                                                  : Icon(Icons.star_outline_outlined, color: AppColors.grayColor,),)
                                            ),
                                            SizedBox(width: 20.w,),
                                          ],
                                        )
                                    ],
                                  ),
                                  SizedBox(height: 30.h,),
                                  CustomText(
                                    text: AppTexts.shareReview,
                                    color: AppColors.blackColor,
                                    fontSize: Dimensions.fontSizeXLarge.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
          
                                  CustomText(
                                    text: AppTexts.aboutProduct,
                                    color: AppColors.blackColor,
                                    fontSize: Dimensions.fontSizeXLarge.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
          
                                  SizedBox(height: 15.h,),
                                  CustomTextField(
                                      textEditingController: controller.reviewController,
                                      labelText: AppTexts.yourReview,
                                    isIcon: false,
                                    height: 120.h,
                                  ),
                                  SizedBox(height: 75.h,),

             ///<<<<--------------------Image Add From gallery--------------------->>>>

                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: GestureDetector(
                                      onTap: (){

                                      },
                                      child: Container(
                                        width: 104.w,
                                        height: 104.w,
                                        decoration: ShapeDecoration(
                                          color: AppColors.pagesColor,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                          shadows: [
                                            BoxShadow(
                                              color: AppColors.shadowColor,
                                              blurRadius: 16,
                                              offset: Offset(0, 1),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.h),
                                              child: Container(
                                                width: 40.w,
                                                height: 40.h,
                                                decoration: ShapeDecoration(
                                                  color: AppColors.buttonsColor,
                                                  shape: const OvalBorder(),
                                                ),
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: AppColors.whiteColor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                                              child: CustomText(text: AppTexts.addPhotos, letterSpacing: -0.41,),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 40.h,),
                                  CustomElevatedButton(
                                      onPressed: (){

                                      },
                                      titleText: AppTexts.sendReview,
                                    buttonWidth: double.infinity,
                                    titleWeight: FontWeight.w500,
                                    titleSize: Dimensions.fontSizeDefault,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        isScrollControlled: true,
                      );
                    },
                    child: Container(
                      width: 135.w,
                      height: 36.h,
                      decoration: ShapeDecoration(
                        color: AppColors.buttonsColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.w),
                        ),
                        shadows: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 5,
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: AppColors.whiteColor,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          CustomText(
                            text: AppTexts.reviewBtn,
                            color: AppColors.whiteColor,
                            fontSize: Dimensions.fontSizeSmall.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 35.h,),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HelloComments extends StatelessWidget {
  HelloComments({
    super.key,
    required this.profileImg,
    required this.name,
    required this.comments,
    this.postImgList,
  });

  final String profileImg;
  final String name;
  final String comments;
  List? postImgList;

  Controller controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 15.0.h, vertical: 10.0.w),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(8.w)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.0.w, vertical: 10.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomText(
                        text: name,
                        color: AppColors.blackColor,
                        fontSize: Dimensions.fontSizeDefault.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          for (int index = 1; index <= 5; index++)
                            index == 5
                                ? SvgPicture.asset(AppIcons.starOutline)
                                : SvgPicture.asset(
                                    AppIcons.starIconSolid,
                                  ),
                          Spacer(),
                          CustomText(
                            text: AppTexts.orderDate,
                            color: AppColors.grayColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomText(
                        text: comments,
                        fontSize: Dimensions.fontSizeDefault.w,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.15,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                            text: AppTexts.helpful,
                            color: AppColors.grayColor,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Icon(
                            Icons.thumb_up_sharp,
                            color: AppColors.grayColor,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // if(controller.isChecked.value)
                      if (controller.isChecked.value)
                        Row(
                          children: [
                            for (int index = 0;
                                index < controller.reviewerPhotoList.length;
                                index++)
                              Row(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.fill,
                                    child: Container(
                                      height: 80.w,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              controller
                                                  .reviewerPhotoList[index],
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.w)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                ],
                              )
                          ],
                        ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -10.h,
              left: -5.w,
              child: SizedBox(
                height: 40.h,
                width: 40.w,
                child: ClipOval(
                    child: Image.asset(
                  profileImg,
                  fit: BoxFit.fill,
                )),
              ),
            ),
          ],
        ));
  }
}
