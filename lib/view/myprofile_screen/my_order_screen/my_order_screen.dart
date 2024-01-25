import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../routes/routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/my_order_custom_button.dart';
import '../my_order_details.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({super.key});

  ///<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><This Is MyScreenOrder AllList Item>>>>>>>>>>>>>>>>>>>>>>>>>>>///
  final List myOrderTopText = [
    AppTexts.delivered,
    AppTexts.processing,
    AppTexts.cancelled,
  ];
  final List myOrderTnumber = [
    AppTexts.order1947034,
    AppTexts.order1947034,
    AppTexts.order1947034,
  ];
  final List myOrdrdate = [
    AppTexts.$05122019,
    AppTexts.$05122019,
    AppTexts.$05122019,
  ];
  final List myOrdrTracking = [
    AppTexts.trackingNumber,
    AppTexts.trackingNumber,
    AppTexts.trackingNumber,
  ];
  final List myOrdriwnumber = [
    AppTexts.iW3475453455,
    AppTexts.iW3475453455,
    AppTexts.iW3475453455,
  ];
  final List myOrdrquantity = [
    AppTexts.quantity,
    AppTexts.quantity,
    AppTexts.quantity,
  ];
  final List myOrdrThree = [
    AppTexts.three,
    AppTexts.three,
    AppTexts.three,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MyOrderScreen"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 50.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myOrderTopText.length,
                      itemBuilder: (context, index) {
                        ///>>>>>>>>>>>>>>>>>>>>>>>>>This is a order Custom Button>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>///
                        return OrderContainer(
                          label: myOrderTopText[index],
                          text: '',
                        );
                      }),
                ),
              ),
            ),
            Expanded(flex: 6,
              child: ListView.builder(
                  itemCount: myOrderTnumber.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Card(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        myOrderTnumber[index],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Spacer(),
                                      Text(
                                        myOrdrdate[index],
                                        style:
                                        TextStyle(fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        myOrdrTracking[index],
                                        style:
                                        TextStyle(fontSize: 14, color: Colors.grey),
                                      ),
                                      Text(
                                        myOrdriwnumber[index],
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        myOrdrquantity[index],
                                        style:
                                        TextStyle(fontSize: 14, color: Colors.grey),
                                      ),
                                      Text(
                                        myOrdrThree[index],
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                                            context,
                                            settings: RouteSettings(name: RouteName.myOrderDetails),
                                            screen: MyOrderDetails(),
                                            withNavBar: true,
                                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(40),
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black)),
                                          child: Center(
                                            child: CustomText(
                                              text: AppTexts.details,
                                              fontSize: 14.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      CustomText(
                                        text: AppTexts.delivered,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                        color: AppColors.successMarkColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    );
                  }),
            ),
          ],
        )
    );
  }
}
