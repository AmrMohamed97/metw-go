
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile Image
        CircleAvatar(
          radius: 24.r,
          backgroundImage: const NetworkImage(
            "https://i.pravatar.cc/150?img=11",
          ), // Placeholder image
        ),
        12.horizontalSpace,
        // Welcome Text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "أهلاً، محمد",
              style: AppTextStyle.bold16(context).copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 18.sp,
              ),
            ),
            Row(
              children: [
                Text(
                  "4.9",
                  style: AppTextStyle.medium14(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                SizedBox(width: 4.w),
                Icon(
                  Icons.star,
                  color: Theme.of(context).colorScheme.primary,
                  size: 16.sp,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        // Notification Bell
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outline,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.notifications_none,
                color: Theme.of(context).colorScheme.onSurface,
                size: 24.sp,
              ),
              Positioned(
                top: 10.h,
                right: 12.w,
                child: Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
