import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coinscope_app/src/core/constants/app_colors.dart';

class DetailLoadingView extends StatelessWidget {
  const DetailLoadingView({super.key});

  Widget _shimmerBox({double? width, double? height, BorderRadius? radius}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.secondaryAccent.withValues(alpha: 0.3),
        borderRadius: radius ?? BorderRadius.circular(8.r),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(14.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section (coin name and symbol)
          Row(
            children: [
              _shimmerBox(width: 30.w, height: 30.h, radius: BorderRadius.circular(30.r)),
              SizedBox(width: 8.w),
              _shimmerBox(width: 80.w, height: 16.h),
              SizedBox(width: 8.w),
              _shimmerBox(width: 40.w, height: 14.h),
            ],
          ),
          SizedBox(height: 20.h),

          // Coin name
          _shimmerBox(width: 120.w, height: 20.h),
          SizedBox(height: 10.h),

          // Price section
          Row(
            children: [
              _shimmerBox(width: 100.w, height: 28.h),
              SizedBox(width: 12.w),
              _shimmerBox(width: 50.w, height: 20.h),
              SizedBox(width: 8.w),
              _shimmerBox(width: 18.w, height: 18.h),
            ],
          ),

          SizedBox(height: 30.h),

          // Chart placeholder
          _shimmerBox(width: double.infinity, height: 200.h, radius: BorderRadius.circular(16.r)),

          SizedBox(height: 30.h),

          // Info title
          _shimmerBox(width: 60.w, height: 18.h),
          SizedBox(height: 14.h),

          // Info list
          Column(
            children: List.generate(4, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryAccent.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.secondaryAccent.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _shimmerBox(width: 120.w, height: 16.h),
                      _shimmerBox(width: 80.w, height: 16.h),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
