import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_button.dart';

class HomePageStatusCard extends StatelessWidget {
  const HomePageStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: MyColors.green,
                  shape: BoxShape.circle,
                ),
              ),
              8.horizontalSpace,
              Text(
                "متاح للاستقبال",
                style: AppTextStyle.regular14(
                  context,
                ).copyWith(color: Colors.white),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.surface.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Theme.of(context).colorScheme.surface,
                      size: 16.sp,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "02:45:14",
                      style: AppTextStyle.regular14(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.surface),
                    ),
                  ],
                ),
              ),
            ],
          ),
          4.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Text(
                  "أنت الآن في وضع الاتصال، بانتظار طلباتك القادمة.",
                  style: AppTextStyle.regular12(context).copyWith(
                    color: Theme.of(context).colorScheme.surface,
                    height: 1.5,
                  ),
                ),
              ),
              16.horizontalSpace,
              CustomButton(
                text: "إيقاف الاستقبال",
                onPressed: () {},
                // fixedSize: false,
                height: 35,
                horizontalPadding: 16,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
