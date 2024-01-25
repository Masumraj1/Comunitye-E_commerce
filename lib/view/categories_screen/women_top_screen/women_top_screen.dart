import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/utils/app_icons.dart';
import 'package:community_ecommerce/view/categories_screen/women_top_screen/women_top_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../../../utils/app_texts.dart';
import '../../../utils/images.dart';
import '../../widgets/custom_text.dart';
import 'women_top_bottomshet_widget.dart';
class WomenTopScreen extends StatelessWidget {
  WomenTopScreen({super.key});
    ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..Women card item Lists >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
  final List womenCartItems = [
    [
      AppTexts.pullover,
      AppTexts.mango,
      AppTexts.fiftyOne,
      AppImages.pullovers,
    ],
    [
      AppTexts.blouse,
      AppTexts.dorothyPerkins,
      AppTexts.thirtyFor,
      AppImages.wblOus,
    ],
    [
      AppTexts.tShirts,
      AppTexts.lOSTInk,
      AppTexts.twelve,
      AppImages.tShirt,
    ],
    [
      AppTexts.shirt,
      AppTexts.topShop,
      AppTexts.twelve,
      AppImages.wshirts,
    ]
  ];
  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..Women Filter Lists >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
  final List<String> womenFilterList = const [
    AppTexts.tShirts,
    AppTexts.cropTops,
    AppTexts.sleeveless,
    AppTexts.apply
  ];
  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..Women bottomsheet Lists >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

  final List<String> bottomsheet = const [
    AppTexts.popular,
    AppTexts.newest,
    AppTexts.customerReview,
    AppTexts.priceLowestToHigh,
    AppTexts.priceHighestLow
  ];
  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..Women settingChangeBottomSheet Lists >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

  final List<String> lowestBottomSheet = const [
    AppTexts.popular,
    AppTexts.newest,
    AppTexts.customerReview,
    AppTexts.priceLowestToHigh,
    AppTexts.priceHighestLow
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Icon(Icons.search)
      ],),
        body: Column(
      children: [
         SizedBox(
          height: 20.h,
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  CustomText(
                    text:AppTexts.womenTops,
                  fontSize: 34.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..Women Filter Listview >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

              Expanded(
                flex: 1,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: womenFilterList.length,
                    itemBuilder: (context, index) {
                      final filter = womenFilterList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        Chip(
                          backgroundColor: AppColors.blackColor,
                          label:
                          CustomText(
                            text:filter,
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      );
                    }),
              ),
              ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..Women WomenFilters Lists >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..Press filter and open filterScreen >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

                        Get.toNamed(RouteName.filterScreen);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.womenFilter,
                          ),
                          CustomText(text: AppTexts.filters,),
                        ],
                      ),
                    ),
                    ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..Press \lowest and open bottomSheet >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          WomenBottomSheet(bottomsheet: bottomsheet),
                        );
                        // Get.toNamed(RouteName.womenLowestTo);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.womenPriceLowToHigh,
                          ),
                          CustomText(
                            text:   AppTexts.priceLowestToHigh,)
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              AppIcons.womenGriedIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..WomenTop All Text Show by ListView >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
              Expanded(
                flex: 5,
                child: ListView.builder(
                    itemCount: womenCartItems.length,
                    itemBuilder: (context, index) {
                      return WomenTopWidgets(
                        headerText: womenCartItems[index][1],
                        subtitleText: womenCartItems[index][0],
                        images: womenCartItems[index][3],
                        price: womenCartItems[index][2],
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
