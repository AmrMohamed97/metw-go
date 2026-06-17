import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';

class RuralServiceToggle extends StatelessWidget {
  const RuralServiceToggle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Colors.lightGreen.shade300,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Image.asset(
              AppImages.countryIcon, // user preferred this
              width: 24.w,
              height: 24.w,
            ),
          ),

          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.medium16(context),
                  textAlign: TextAlign.start,
                ),
                4.verticalSpace,
                Text(
                  subtitle,
                  style: AppTextStyle.regular12(
                    context,
                  ).copyWith(color: Colors.grey.shade500),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          16.horizontalSpace,
          CupertinoSwitch(
            value: value,
            activeTrackColor: Theme.of(context).primaryColor,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
