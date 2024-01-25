import 'package:community_ecommerce/routes/routes.dart';
import 'package:community_ecommerce/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../utils/app_texts.dart';
import '../widgets/women_screen_container.dart';
import '../widgets/container_widgets.dart';
import 'women_top_screen/women_top_screen.dart';

class CategoreTabScreen extends StatelessWidget {
  CategoreTabScreen({super.key});
         ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>categoriesHeaderText List >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
  final List categoriesHeaderText = [
    AppTexts.neww,
    AppTexts.clothes,
    AppTexts.shoes,
    AppTexts.accesories,

  ];

  final List images = [
    AppImages.categoryNew,
    AppImages.categoryCloths,
    AppImages.categoryShoes,
    AppImages.categoryAccesories,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
         SizedBox(
          height: 20.h,
        ),
        const CustomContainers(),
         SizedBox(
          height: 10.h,
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: (){
              ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>womenTopScreen>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///

              PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                context,
                settings: RouteSettings(name: RouteName.womenTopScreen),
                screen: WomenTopScreen(),
                withNavBar: true,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            child: ListView.builder(
                itemCount: categoriesHeaderText.length,
                itemBuilder: (context, index) {
                  return WomenScreenContainer(
                    images: images[index],
                    child: categoriesHeaderText[index],
                  );
                }),
          ),
        ),
      ],
    ));
  }
}
