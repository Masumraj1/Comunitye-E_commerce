import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/utils/app_texts.dart';
import 'package:community_ecommerce/utils/dimentions.dart';
import 'package:community_ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/routes.dart';
import '../../../my_bag/inner/custom_container.dart';
import '../../../widgets/custom_elevated_button.dart';
import 'category_filter_widget.dart';

class WomenFilterScreen extends StatefulWidget {
  const WomenFilterScreen({super.key});

  @override
  State<WomenFilterScreen> createState() => _WomenFilterScreenState();
}

class _WomenFilterScreenState extends State<WomenFilterScreen> {
  ///<<<<<<<<<<<<<<<<<<<<<<<<<This is Categorylist item >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
  final List cateGoryList = [
    AppTexts.all,
    AppTexts.women,
    AppTexts.men,
    AppTexts.boys,
    AppTexts.girls
  ];
  ///<<<<<<<<<<<<<<<<<<<<<<<<<This is Sizelist item >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
  final List sizeList = [
    AppTexts.xS,
    AppTexts.s,
    AppTexts.l,
    AppTexts.m,
    AppTexts.xL,
  ];

  List selectedSizeList = [];
  bool isTapped = false;
  ///<<<<<<<<<<<<<<<<<<<<<<<<<This is RangeValue >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///<<<<<<<<<<<<<<<<<<<<<<<<<This is AppBar >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
      appBar: AppBar(
        title: const Text(AppTexts.filters),
        centerTitle: true,
      ),
      ///<<<<<<<<<<<<<<<<<<<<<<<<<This is Body >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///<<<<<<<<<<<<<<<<<<<<<<<<<This is priceRange item >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: CustomText(
                text: AppTexts.priceRange,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                CustomText(
                  text: "\$${_currentRangeValues.start.round().toString()}",
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                CustomText(
                  text: "\$${_currentRangeValues.end.round().toString()}",
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            RangeSlider(
              min: 40,
              // onChangeStart: (value) => RangeValues(40, 100),
              activeColor: Colors.red,
              values: _currentRangeValues,
              max: 100,
              // divisions: 5,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                  // print(_currentRangeValues);
                });
              },
            ),
            ///<<<<<<<<<<<<<<<<<<<<<<<<<This is Colors item >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: CustomText(
                text: AppTexts.colors,
                fontSize: 16.sp,
                fontWeight:FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return  Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: SizedBox(
                          width: 44.w,
                          height: 44.h,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 4.w,
                                top: 4.h,
                                child: Container(
                                  width: 36.w,
                                  height: 36.h,
                                  decoration:  ShapeDecoration(
                                    color: AppColors.blackColor,
                                    shape: const OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 44.w,
                                  height: 44.h,
                                  decoration:  ShapeDecoration(
                                    shape: OvalBorder(
                                      side: BorderSide(width: 1,
                                          color: AppColors.errorMarkColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    );
                  }),
            ),
            ///<<<<<<<<<<<<<<<<<<<<<<<<<>This is Sizes item <>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: CustomText(
                text: AppTexts.sizes,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            ///<<<<<<<<<<<<<<<<<<<<<<<<<This is SizeGridview item >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
            Expanded(
              flex: 1,
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sizeList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        isTapped = !isTapped;
                        if(isTapped){
                          selectedSizeList.add(index);
                        }
                        setState(() {

                        });
                      },
                      onDoubleTap: (){
                        selectedSizeList.remove(index);
                        setState(() {

                        });
                      },
                      child: CustomContainer(
                        containerHeight: 40.h,
                        containerWidth: 40.w,
                        borderRadius: 20.w,
                        imagePath: '',
                        isImage: false,
                        text: sizeList[index],
                        isText: true,
                        textColor: AppColors.blackColor,
                        containerColor: selectedSizeList.contains(index)? AppColors.buttonsColor : AppColors.whiteColor,
                      ),
                    );
                  }),
            ),
            ///<<<<<<<<<<<<<<<<<<<<<<<<<This is Category item >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: CustomText(
                text: AppTexts.categories,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            ///<<<<<<<<<<<<<<<<<<<<<<<<<This is CategoryGriedview item >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..///
            CategoryFilter(cateGoryList: cateGoryList),

            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  ///<<<<<<<<<<<<<<<<<<<<<<<<<This is brand Cilik and open WomenBrandScreen class item >>>>>>>>>>>>>>>>>>>>>///
                  Get.toNamed(RouteName.womenBrandScreen);
                },
                child: SizedBox(
                  height: 58.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: AppTexts.brand,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 25.sp,
                          ),
                        ],
                      ),
                      CustomText(
                        text: AppTexts.addIdAsOriginals,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Row(
                  children: [
                    CustomElevatedButton(
                        onPressed: (){},
                        buttonHeight: 40,
                        buttonWidth: 150,
                        buttonColor: AppColors.whiteColor,
                        borderColor: AppColors.blackColor,
                        titleSize: Dimensions.fontSizeDefault,
                        titleColor: AppColors.blackColor,
                        titleText: AppTexts.discard),
                    SizedBox(
                      width: 20.w,
                    ),
                    CustomElevatedButton(
                        onPressed: (){},
                        buttonHeight: 40,
                        buttonWidth: 150,
                        titleSize: Dimensions.fontSizeDefault,
                        titleText: AppTexts.apply)
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}