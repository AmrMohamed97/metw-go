import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class CustomEmptyWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const CustomEmptyWidget({
    super.key,
    this.title = "لا توجد بيانات",
    this.subtitle = "سيتم إشعارك فور وصول بيانات جديدة في هذا القسم",
    this.icon = Icons.inventory_2_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 64.sp,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.5),
            ),
          ),
          24.verticalSpace,
          Text(
            title,
            style: AppTextStyle.bold18(
              context,
            ).copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
          ),
          8.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyle.regular14(context).copyWith(
                color: Theme.of(
                  context,
                ).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
