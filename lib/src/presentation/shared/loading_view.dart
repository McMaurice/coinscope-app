import 'package:coinscope_app/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: EdgeInsets.all(12.w),
            child: Container(
              height: 70.h,
              decoration: BoxDecoration(
                color: AppColors.secondaryAccent,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
