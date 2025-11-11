import 'dart:async';
import 'package:coinscope_app/src/core/constants/app_colors.dart';
import 'package:coinscope_app/src/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (mounted) context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 90.h,
              width: 90.w,
              decoration: BoxDecoration(
                color: AppColors.primaryAccent,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryAccent, width: 2),
              ),
              child: Icon(
                Icons.currency_bitcoin,
                size: 50.sp,
                color: AppColors.secondaryColor,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Coin Scope".toUpperCase(),
              style: AppTextStyle.h1(
                size: 22.sp,
                color: AppColors.secondaryColor,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "An enhanced crypto watch dog",
              style: AppTextStyle.medium(
                size: 13.sp,
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
