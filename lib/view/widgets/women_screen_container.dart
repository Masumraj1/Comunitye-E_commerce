import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WomenScreenContainer extends StatelessWidget {
  final String child;

  final String images;

  const WomenScreenContainer(
      {super.key, required this.child, required this.images});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.cover,
                child:
                // CustomContainer(
                //     containerHeight: 100,
                //     containerWidth: 171,
                //     borderRadius: 8,
                //     imagePath: "",
                //     isImage: false,
                //     text: child,
                //     isText: true,
                // containerColor:AppColors.whiteColor ,
                //   textSize: 18,
                //
                // ),
                Container(
                  height: 100.h,
                  width: 171.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.whiteColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child:
                    Text(child,
                        style: GoogleFonts.metrophobic(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  height: 100.h,
                  width: 171.w,
                  child: Image.asset(images),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
