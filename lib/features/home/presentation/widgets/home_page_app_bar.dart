import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          12.horizontalSpace,
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
                style: AppTextStyle.regular16(context).copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18.sp,
                ),
              ),
              Row(
                crossAxisAlignment: .start,
                children: [
                  Icon(
                    Icons.star,
                    color: Theme.of(context).colorScheme.primary,
                    size: 16.sp,
                  ),
                  3.horizontalSpace,
                  Text(
                    "4.9",
                    style: AppTextStyle.medium14(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          // Notification Bell
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
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
                // Positioned(
                //   top: 10.h,
                //   right: 12.w,
                //   child: Container(
                //     width: 10.w,
                //     height: 10.w,
                //     decoration: BoxDecoration(
                //       color: Theme.of(context).colorScheme.primary,
                //       shape: BoxShape.circle,
                //       border: Border.all(color: Colors.white, width: 1.5),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          12.horizontalSpace,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
