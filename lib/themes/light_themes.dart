
import 'package:community_ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/dimentions.dart';

ThemeData light = ThemeData(
  fontFamily: 'Metropolis',
  // primaryColor: const Color(0xFFF9F9F9),
  scaffoldBackgroundColor: Color(0xFFF9F9F9),
  hintColor: const Color(0xFF9B9B9B),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
        elevation: MaterialStatePropertyAll(3),
      backgroundColor: MaterialStatePropertyAll(Color(0xFFDB3022)),
    )
  ),


  textTheme: const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.w300, fontSize: Dimensions.fontSizeXXXLarge),
    displayMedium: TextStyle(fontWeight: FontWeight.w400,fontSize: Dimensions.fontSizeDefault),
    displaySmall: TextStyle(fontWeight: FontWeight.w500, fontSize: Dimensions.fontSizeDefault),
    headlineMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeDefault),
    headlineSmall: TextStyle(fontWeight: FontWeight.w700,  fontSize: Dimensions.fontSizeDefault),
    titleLarge: TextStyle(fontWeight: FontWeight.w800,  fontSize: Dimensions.fontSizeDefault),
    bodySmall: TextStyle(fontWeight: FontWeight.w900,  fontSize: Dimensions.fontSizeDefault),
    titleMedium: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(fontSize: 12.0),
    bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
  ),
);