import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({
    super.key,
    required this.text,
    required this.iconPath,
  });

  final String text;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFF6B1A99).withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            iconPath,
            height: 24.h,
            width: 24.h,
            color: const Color(0xFF6B1A99),
          ),
          12.horizontalSpace,
          Expanded(
            child: Text(
              text,
              style: AppTextStyle.medium14(context).copyWith(
                color: const Color(0xFF6B1A99),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
