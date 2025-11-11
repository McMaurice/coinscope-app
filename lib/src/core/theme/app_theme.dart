import 'package:coinscope_app/src/core/constants/app_colors.dart';
import 'package:coinscope_app/src/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  //----LIGHT THEME-----
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: AppColors.secondaryColor,
      onSecondary: Colors.white,
      error: AppColors.negativeColor,
      onError: Colors.white,
      surface: AppColors.cardColor,
      onSurface: AppColors.textColor,
    ),
    fontFamily: 'PrimaryFont',

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: AppTextStyle.h2(color: Colors.white, size: 20.sp),
    ),

    cardTheme: CardThemeData(
      color: AppColors.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: AppColors.dividerColor.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      shadowColor: Colors.black.withValues(alpha: 0.2),
    ),

    iconTheme: IconThemeData(color: AppColors.primaryAccent, size: 22.sp),

    textTheme: TextTheme(
      headlineLarge: AppTextStyle.h1(color: AppColors.textColor),
      headlineMedium: AppTextStyle.h2(color: AppColors.textColor),
      titleLarge: AppTextStyle.h2(color: AppColors.textColor),
      bodyLarge: AppTextStyle.medium(color: AppColors.textColor),
      bodyMedium: AppTextStyle.regular(color: AppColors.textColor),
      bodySmall: AppTextStyle.caption(
        color: AppColors.textColor.withValues(alpha: 0.6),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: AppTextStyle.regular(
        color: AppColors.textColor.withValues(alpha: 0.6),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5.w),
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        textStyle: AppTextStyle.semiBold(color: Colors.white, size: 16.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
      ),
    ),

    dividerTheme: DividerThemeData(color: AppColors.dividerColor, thickness: 1),
  );

  //---DARK THEME-----
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0E0E10),
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: const Color(0xFF1A1A1C),
      onSurface: Colors.white,
      error: AppColors.negativeColor,
      onError: Colors.white,
    ),
    fontFamily: 'PrimaryFont',
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1A1A1C),
      titleTextStyle: AppTextStyle.h2(color: Colors.white, size: 20.sp),
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 1,
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1A1A1C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      elevation: 2,
    ),
    iconTheme: IconThemeData(color: AppColors.primaryAccent, size: 22.sp),
    textTheme: TextTheme(
      headlineLarge: AppTextStyle.h1(color: Colors.white),
      headlineMedium: AppTextStyle.h2(color: Colors.white),
      titleLarge: AppTextStyle.h2(color: Colors.white),
      bodyLarge: AppTextStyle.medium(color: Colors.white),
      bodyMedium: AppTextStyle.regular(color: Colors.white),
      bodySmall: AppTextStyle.caption(
        color: Colors.white.withValues(alpha: 0.7),
      ),
    ),
  );
}
