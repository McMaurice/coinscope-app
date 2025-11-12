import 'package:coinscope_app/src/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderedTwoColumn extends StatelessWidget {
  final String title;
  final String description;

  const BorderedTwoColumn({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(title, style: AppTextStyle.medium(size: 14.sp)),
          ),
          SizedBox(width: 10.w),
          Expanded(
            flex: 2,
            child: Text(
              description,
              style: AppTextStyle.regular(
                size: 14.sp,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
