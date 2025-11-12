import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static const _primaryFont = 'PrimaryFont';
  static const _secondaryFont = 'SecondaryFont';
  //----HEADERS----
  static TextStyle currency({Color? color, double? size}) => TextStyle(
    fontSize: size ?? 24.sp,
    fontWeight: FontWeight.w400,
    color: color,
    fontFamily: _secondaryFont,
  );

  static TextStyle h1({Color? color, double? size}) => TextStyle(
    fontSize: size ?? 60.sp,
    fontWeight: FontWeight.w600,
    color: color,
    fontFamily: _secondaryFont,
  );

  static TextStyle h2({Color? color, double? size}) => TextStyle(
    fontSize: size ?? 40.sp,
    fontWeight: FontWeight.w500,
    color: color,
    fontFamily: _secondaryFont,
  );

  //----BODY----
  static TextStyle semiBold({Color? color, double? size}) => TextStyle(
    fontSize: size ?? 20.sp,
    fontWeight: FontWeight.w600,
    color: color,
    fontFamily: _primaryFont,
  );

  static TextStyle medium({Color? color, double? size}) => TextStyle(
    fontSize: size ?? 16.sp,
    fontWeight: FontWeight.w500,
    color: color,
    fontFamily: _primaryFont,
  );

  static TextStyle regular({Color? color, double? size}) => TextStyle(
    fontSize: size ?? 14.sp,
    fontWeight: FontWeight.w400,
    color: color,
    fontFamily: _primaryFont,
  );

  static TextStyle light({Color? color, double? size, double opacity = 0.6}) =>
      TextStyle(
        fontSize: size ?? 14.sp,
        fontWeight: FontWeight.w300,
        color: color!.withValues(alpha: opacity),
        fontFamily: _primaryFont,
      );

  static TextStyle caption({
    Color? color,
    double? size,
    double opacity = 0.7,
  }) => TextStyle(
    fontSize: size ?? 12.sp,
    fontWeight: FontWeight.w500,
    color: color!.withValues(alpha: opacity),
    fontFamily: _primaryFont,
  );

  static TextStyle small({Color? color, double? size, double opacity = 0.7}) =>
      TextStyle(
        fontSize: size ?? 10.sp,
        fontWeight: FontWeight.w400,
        color: color!.withValues(alpha: opacity),
        fontFamily: _primaryFont,
      );
}
