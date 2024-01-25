
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../my_bag/inner/custom_container.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({
    super.key,
    required this.cateGoryList,
  });

  final List cateGoryList;

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  bool isRed =false;
  List select = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.cateGoryList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 10,
              mainAxisExtent: 100
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                isRed =!isRed;
                if(isRed){
                  select.add(index);
                }
                if(!isRed){
                  select.remove(index);
                }
                setState(() {

                });

              },
              child: CustomContainer(
                containerHeight: 20.h,
                containerWidth: 100.w,
                borderRadius: 10.w,
                imagePath: '',
                isImage: false,
                text: widget.cateGoryList[index],
                isText: true,
                textColor:AppColors.whiteColor,
                containerColor: select.contains(index)? AppColors.errorMarkColor : AppColors.blackColor,
              ),
            );
          }),
    );
  }
}