import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.cF7F7F9,
    iconTheme: const IconThemeData(color: AppColors.c0D6EFD),
    primaryColor: AppColors.c0D6EFD,
    hintColor: AppColors.c707B81,
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.c2B2B2B,
        fontSize: 20.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ),
      backgroundColor: AppColors.cF7F7F9,
      iconTheme: const IconThemeData(color: AppColors.c0D6EFD),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.cF7F7F9,
      ),
    ),
    textTheme: TextTheme(
        //display
        displayLarge: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 57.sp,
            fontWeight: FontWeight.w800,
            fontFamily: 'Raleway'),
        displayMedium: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 45.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Raleway'),
        displaySmall: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 36.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Raleway'),
        //headline
        headlineLarge: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Raleway'),
        headlineMedium: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 28.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Raleway'),
        headlineSmall: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Raleway'),
        //title
        titleLarge: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Raleway'),
        titleMedium: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Raleway'),
        titleSmall: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Raleway'),
        //label
        labelLarge: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Raleway'),
        labelMedium: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Raleway'),
        labelSmall: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Raleway'),
        //body
        bodyLarge: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Raleway'),
        bodyMedium: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Raleway'),
        bodySmall: TextStyle(
            color: AppColors.c2B2B2B,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Raleway')),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(
          color: AppColors.c2B2B2B,
          fontSize: 10.sp,
          fontStyle: FontStyle.normal,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.c2B2B2B,
          fontSize: 10.sp,
          fontStyle: FontStyle.normal,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
        selectedIconTheme: IconThemeData(
          color: AppColors.c0D6EFD,
          size: 24.w,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.c707B81,
          size: 24.w,
        ),
        backgroundColor: AppColors.cF7F7F9,
        selectedItemColor: AppColors.c0D6EFD,
        unselectedItemColor: AppColors.c707B81),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.cF7F7F9,
      filled: true,
      hintStyle: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.c707B81,
        fontFamily: 'Raleway'
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.r)),
    ),


  );
}
