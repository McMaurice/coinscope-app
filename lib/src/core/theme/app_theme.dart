import 'package:coinscope_app/src/core/constants/app_colors.dart';
import 'package:coinscope_app/src/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  //----LIGHT THEME-----
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.secondaryColor,
    primaryColor: AppColors.secondaryAccent,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: AppColors.primaryColor,
      onSecondary: Colors.white,
      error: AppColors.negativeColor,
      onError: Colors.white,
      surface: AppColors.cardColor,
      onSurface: AppColors.textColor,
    ),
    fontFamily: 'PrimaryFont',

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: AppColors.primaryAccent,
      elevation: 2,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.primaryAccent),
      titleTextStyle: AppTextStyle.h2(
        color: AppColors.primaryAccent,
        size: 20.sp,
      ),
    ),

    cardTheme: CardThemeData(
      color: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
        side: BorderSide(
          color: AppColors.secondaryAccent.withValues(alpha: 0.2),
          width: 1.w,
        ),
      ),
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      shadowColor: Colors.black.withValues(alpha: 0.2),
    ),

    iconTheme: IconThemeData(color: AppColors.primaryColor, size: 22.sp),

    textTheme: TextTheme(
      headlineLarge: AppTextStyle.h1(color: AppColors.primaryColor),
      headlineMedium: AppTextStyle.h2(color: AppColors.primaryColor),
      titleLarge: AppTextStyle.h2(color: AppColors.primaryColor),
      bodyLarge: AppTextStyle.medium(color: AppColors.primaryColor),
      bodyMedium: AppTextStyle.regular(color: AppColors.primaryColor),
      bodySmall: AppTextStyle.caption(
        color: AppColors.textColor.withValues(alpha: 0.6),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.primaryColor.withValues(alpha: 0.6),
      hintStyle: AppTextStyle.regular(color: AppColors.secondaryColor),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor..withValues(alpha: 0.6),
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryAccent, width: 1.5.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondaryAccent,
        foregroundColor: AppColors.primaryColor,
        textStyle: AppTextStyle.semiBold(
          size: 16.sp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
      ),
    ),

    dividerTheme: DividerThemeData(
      color: AppColors.primaryAccent,
      thickness: 1,
    ),
  );

  //---DARK THEME-----
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.primaryAccent.withValues(alpha: 5.0),
    primaryColor: AppColors.primaryAccent.withValues(alpha: 5.0),
    colorScheme: ColorScheme.dark(
      primary: AppColors.secondaryAccent,
      secondary: AppColors.primaryAccent,
      surface: const Color(0xFF1A1A1C),
      onSurface: AppColors.secondaryAccent,
      error: AppColors.negativeColor,
      onError: AppColors.secondaryAccent,
    ),
    fontFamily: 'PrimaryFont',
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor.withValues(alpha: 1),
      titleTextStyle: AppTextStyle.h2(size: 20.sp),
      iconTheme: const IconThemeData(color: AppColors.secondaryAccent),
      elevation: 1,
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: AppColors.primaryAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      elevation: 2,
    ),
    iconTheme: IconThemeData(color: AppColors.secondaryAccent, size: 22.sp),
    textTheme: TextTheme(
      headlineLarge: AppTextStyle.h1(color: AppColors.secondaryColor),
      headlineMedium: AppTextStyle.h2(color: AppColors.secondaryColor),
      titleLarge: AppTextStyle.h2(color: AppColors.secondaryColor),
      bodyLarge: AppTextStyle.medium(color: AppColors.secondaryColor),
      bodyMedium: AppTextStyle.regular(color: AppColors.secondaryAccent),
      bodySmall: AppTextStyle.caption(
        color: AppColors.secondaryAccent.withValues(alpha: 0.7),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secondaryAccent,
        textStyle: AppTextStyle.semiBold(size: 16.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
      ),
    ),
  );
}
