import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/utils/app_icons.dart';
import 'package:community_ecommerce/view/favorite_screen/favorite_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/app_texts.dart';
import '../../../utils/images.dart';
import '../widgets/custom_text.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final List favoriteCartItems = [
    [
      AppTexts.lIME,
      AppTexts.shirt,
      AppTexts.thirtyFor,
      AppImages.favoriteShirt,
      AppTexts.colorBlue,
      AppTexts.l,


    ],
    [
      AppTexts.mango,
      AppTexts.longsLeeveVioleta,
      AppTexts.fortySix,
      AppImages.favoriteLongs,
      AppTexts.colorGray,
      AppTexts.s,

    ],
    [
      AppTexts.tShirts,
      AppTexts.lOSTInk,
      AppTexts.thirtyNine,
      AppImages.favoritetshirt,
      AppTexts.colorOrange,
      AppTexts.l,

    ],
    [
      AppTexts.shirt,
      AppTexts.berries,
      AppTexts.twelve,
      AppImages.wshirts,
      AppTexts.colorBlack,
      AppTexts.s,

    ]
  ];

  final List<String> filters = const [
    AppTexts.summer,
    AppTexts.tShirts,
    AppTexts.shirt,
    AppTexts.apply
  ];
  final List<String> bottomSheet = const [
    AppTexts.popular,
    AppTexts.newest,
    AppTexts.customerReview,
    AppTexts.priceLowestToHigh,
    AppTexts.priceHighestLow
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: CustomText(
                    text:AppTexts.favorites,
                    fontSize: 34.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // padding: EdgeInsets.all(8),
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chip(
                          backgroundColor: AppColors.blackColor,
                          label:
                          CustomText(
                            text: filter,
                            color: AppColors.whiteColor
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.womenFilter,
                        ),
                        CustomText(text: AppTexts.filters,),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.womenPriceLowToHigh,
                        ),
                        CustomText( text: AppTexts.priceLowestToHigh,)
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            AppIcons.womenGriedIcon,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 9,
                child: ListView.builder(
                    itemCount: favoriteCartItems.length,
                    itemBuilder: (context, index) {
                      return FevoriteTopScreen(
                        headerText: favoriteCartItems[index][1],
                        images: favoriteCartItems[index][3],
                        subtitleText: favoriteCartItems[index][0],
                        price: favoriteCartItems[index][2], cardColor: favoriteCartItems[index][4], cardSize:favoriteCartItems[index][5],
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
