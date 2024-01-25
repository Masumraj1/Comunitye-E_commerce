//
// import 'package:community_ecommerce/controllers/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// class HomeListView extends StatelessWidget {
//   HomeListView({super.key});
//   Controller controller = Get.put(Controller());
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: controller.imagesList.length,
//         itemBuilder: (context, index){
//           return Container(
//             width: 150.w,
//             height: 260.h,
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     Image.asset(controller.imagesList[index]),
//                   ],
//                 )
//               ],
//             ),
//           );
//         }
//     );
//   }
// }
