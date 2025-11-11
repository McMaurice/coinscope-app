import 'package:coinscope_app/src/core/constants/app_colors.dart';
import 'package:coinscope_app/src/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.callBack});

  final VoidCallback callBack;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "An internet error occurred, please try again",
            textAlign: TextAlign.center,
            style: AppTextStyle.regular(size: 14.sp, color: Colors.red),
          ),
          SizedBox(height: 10.h),
          ElevatedButton(
            onPressed: callBack,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryAccent,
            ),
            child: Text(
              "Retry",
              style: AppTextStyle.medium(size: 14.sp, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
