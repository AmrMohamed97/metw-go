import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class RemovableChip extends StatelessWidget {
  const RemovableChip({
    super.key,
    required this.label,
    required this.onRemove,
  });

  final String label;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.redAccent.shade100, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTextStyle.medium12(context).copyWith(
              color: Colors.redAccent.shade200,
            ),
          ),
          8.horizontalSpace,
          GestureDetector(
            onTap: onRemove,
            child: Icon(
              Icons.close,
              size: 14.sp,
              color: Colors.redAccent.shade200,
            ),
          ),
        ],
      ),
    );
  }
}
