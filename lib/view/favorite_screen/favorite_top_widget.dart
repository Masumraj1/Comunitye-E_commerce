import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FevoriteTopScreen extends StatelessWidget {
  final String headerText;
  final String subtitleText;
  final String price;
  final String images;
  final String cardColor;
  final String cardSize;
  FevoriteTopScreen({
    super.key,
    required this.headerText,
    required this.images,
    required this.subtitleText,
    required this.price, required this.cardColor, required this.cardSize,
  });

  bool isFavIconTapped = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        width: 350.w,
        height: 125.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows:  [
            BoxShadow(
              color: AppColors.womenTopContainerColor,
              blurRadius: 25,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 119.w,
              height: 157.h,
              decoration: ShapeDecoration(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        topLeft: Radius.circular(8))),
                image: DecorationImage(
                  image: AssetImage(images),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(subtitleText),
                  CustomText(
                    text: subtitleText,
                  ),
                  CustomText(
                    text: headerText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,

                  ),

                  Row(
                    children: [
                      CustomText(
                        text: cardColor,

                      ),
                      // const Spacer(),
                      CustomText(
                        text: cardSize,

                      ),
                    ],
                  ),
                  CustomText( text: price,),


                ],
              ),
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                      bottom: -10,
                      right: 0,
                      child: GestureDetector(
                        onTap: (){
                          isFavIconTapped = !isFavIconTapped;
                        },
                        child: CircleAvatar(
                            backgroundColor: AppColors.favoritePositionIconColor,
                            radius: 20,
                            child: isFavIconTapped?
                            Icon(
                              Icons.shopping_bag, color: AppColors.whiteColor,)
                                :Icon(Icons.favorite_border, color: AppColors.errorMarkColor,) ),
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
