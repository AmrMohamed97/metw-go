import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image with online indicator
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.3),
                      width: 2,
                    ),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Container(
                //   width: 12.w,
                //   height: 12.w,
                //   margin: const EdgeInsets.only(bottom: 2, right: 2),
                //   decoration: BoxDecoration(
                //     color: MyColors.green,
                //     shape: BoxShape.circle,
                //     border: Border.all(
                //       color: Theme.of(context).scaffoldBackgroundColor,
                //       width: 2,
                //     ),
                //   ),
                // ),
              ],
            ),
            12.horizontalSpace,
            // Welcome Text & Rating
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "أهلاً بك، محمد",
                    style: AppTextStyle.bold16(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                  ),
                  4.verticalSpace,
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "4.9",
                          style: AppTextStyle.medium12(context).copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            height: 1.2,
                          ),
                        ),
                        4.horizontalSpace,
                        Icon(
                          Icons.star_rounded,
                          color: Theme.of(context).colorScheme.primary,
                          size: 14.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Notification Bell
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(
                      context,
                    ).colorScheme.shadow.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.notifications_none_rounded,
                    color: Theme.of(context).colorScheme.tertiary,
                    size: 24.sp,
                  ),
                  PositionedDirectional(
                    top: 10.w,
                    end: 10.w,
                    child: Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                        color: MyColors.red,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surface,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
