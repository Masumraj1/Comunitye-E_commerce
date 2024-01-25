import 'package:community_ecommerce/routes/routes.dart';
import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/utils/app_texts.dart';
import 'package:community_ecommerce/utils/images.dart';
import 'package:community_ecommerce/view/widgets/listtile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../widgets/custom_text.dart';
import 'my_order_screen/my_order_screen.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  final List myProfileHeaderText = [
    AppTexts.myOrders,
    AppTexts.shippingAddresses,
    AppTexts.paymentMethods,
    AppTexts.promoCodes,
    AppTexts.myreviews,
    AppTexts.settings,
  ];
  final List myProfileSubTileText = [
    AppTexts.already,
    AppTexts.ddRese,
    AppTexts.Visa,
    AppTexts.youHave,
    AppTexts.reviews,
    AppTexts.Notifications,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.search)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: CustomText(
              text:AppTexts.myProfile,
              fontSize: 34.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  backgroundColor: AppColors.blackColor,
                  radius: 50,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(AppImages.myProfile),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text:AppTexts.matildaBrown,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text:AppTexts.matildaBrownCom,
                    fontSize: 14.sp,
                  ),

                ],
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: myProfileHeaderText.length,
                itemBuilder: (context, index) {
                  if(index == 0){
                    return GestureDetector(
                      onTap: (){
                        PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                          context,
                          settings: RouteSettings(name: RouteName.myOrderScreen),
                          screen: MyOrderScreen(),
                          withNavBar: true,
                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        );
                      },
                      child: ListTileWidget(
                        title: myProfileHeaderText[index],
                        subtitle: myProfileSubTileText[index], icons: Icons.arrow_forward_ios_sharp,
                      ),
                    );
                  }
                  else if(index == 5){
                    return GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteName.myOrderSettingScreen);
                      },
                      child: ListTileWidget(
                        title: myProfileHeaderText[index],
                        subtitle: myProfileSubTileText[index], icons: Icons.arrow_forward_ios_sharp,
                      ),
                    );
                  }
                  return ListTileWidget(
                    title: myProfileHeaderText[index],
                    subtitle: myProfileSubTileText[index], icons: Icons.arrow_forward_ios_sharp,
                  );
                }),
          ),
        ],
      ),
    );
  }
}