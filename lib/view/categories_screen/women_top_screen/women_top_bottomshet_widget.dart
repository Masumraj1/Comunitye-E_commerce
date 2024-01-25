
import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_texts.dart';
import '../../widgets/custom_text.dart';

class WomenBottomSheet extends StatefulWidget {
   WomenBottomSheet({
    super.key,
    required this.bottomsheet,
  });

  final List<String> bottomsheet;

  @override
  State<WomenBottomSheet> createState() => _WomenBottomSheetState();
}

class _WomenBottomSheetState extends State<WomenBottomSheet> {
  bool isButtonRed = false;
  List selected = [];


  ///>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>_Lowest to height press and open bottom sheet>>>>>>>>>>>>>>///
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34))),
      height: 352.h,
      child: Column(
        children: [
          Padding(
            padding:  const EdgeInsets.all(8.0),
            child:
            CustomText(
              text: AppTexts.sortby,
            fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            )
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              height: 300.h,
              child: ListView.builder(
                  itemCount: widget.bottomsheet.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                     onTap: (){
                      isButtonRed = !isButtonRed;
                      if(isButtonRed){
                        selected.add(index);
                      }
                      if(!isButtonRed){
                        selected.remove(index);
                      }
                      // if(isButtonRed){
                      //   selected.add(index);
                      // }
                      setState(() {
                        // Toggle the color state
                      });
                    },
                      child: SizedBox(
                        height: 50.h,
                        child:
                        CustomText(
                          text: widget.bottomsheet[index],
                        fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: selected.contains(index)? AppColors.errorMarkColor : AppColors.blackColor,
                          // color:isButtonRed ? Colors.red : null,
                        )
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
