import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class ListTileWidget extends StatelessWidget {
  final String title;

  final String subtitle;
  final IconData icons;

  const ListTileWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
        ),
        child: ListTile(
          title: CustomText(
            text: title,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          subtitle: CustomText(
            text: subtitle,
          ),
          trailing: Icon(icons),
        ),
      ),
    );
  }
}
