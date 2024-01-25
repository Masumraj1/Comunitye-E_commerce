import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:community_ecommerce/utils/app_texts.dart';
import 'package:community_ecommerce/view/widgets/custom_elevated_button.dart';
import 'package:community_ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/controller.dart';
class WomenBrandPage extends StatefulWidget {
  const WomenBrandPage({super.key});

  @override
  State<WomenBrandPage> createState() => _WomenBrandPageState();
}

class _WomenBrandPageState extends State<WomenBrandPage> {
  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.This is BrandList Text List.>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.///
  final List brandList = [
    AppTexts.adidas,
    AppTexts.adidasOriginals,
    AppTexts.blend,
    AppTexts.boutiqueMoschino,
    AppTexts.champion,
    AppTexts.diesel,
    AppTexts.jackJones,
    AppTexts.nafNaf,
    AppTexts.redValentino,
    AppTexts.oliver
  ];

  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.Controller Put>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.///
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.This is AppBar.>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.///
        appBar: AppBar(
          title: const Text(AppTexts.brand),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.This is Search Container.>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.///
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.whiteColor),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppTexts.search,
                      prefixIcon: Icon(Icons.search),
                    ),
                  )),
            ),

            ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.This is Brand Page  Text List.>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.///
            SizedBox(
              height: 550.h,
              child: ListView.builder(
                  itemCount: brandList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(11),
                            child: Row(
                              children: [
                                CustomText(
                                  text: brandList[index],
                                  fontSize: 16.sp,
                                ),
                                const Spacer(),
                                Checkbox(
                                  activeColor: AppColors.errorMarkColor,
                                  value: true,
                                  onChanged: (bool? value) {},
                                )
                              ],
                            ))
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 190,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColors.grayColor),
                    child: const Center(child: Text(AppTexts.discard)),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  CustomElevatedButton(
                      onPressed: () {},
                      buttonHeight: 40,
                      buttonWidth: 150,
                      titleText: AppTexts.apply)
                ],
              ),
            )
          ],
        ));
  }
}
