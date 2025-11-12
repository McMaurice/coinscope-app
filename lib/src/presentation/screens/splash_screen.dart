import 'dart:async';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 90.h,
              width: 90.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2),
              ),
              child: Icon(Icons.currency_bitcoin, size: 50.sp),
            ),
            SizedBox(height: 20.h),
            Text(
              "Coin Scope".toUpperCase(),
              style: AppTextStyle.h2(size: 24.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              "Tracking Coins, Tracking Gains",
              style: AppTextStyle.semiBold(size: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
