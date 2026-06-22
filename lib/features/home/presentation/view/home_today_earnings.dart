import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class HomeTodayEarnings extends StatelessWidget {
  const HomeTodayEarnings({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.062),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              border: BorderDirectional(
                start: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 4,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children: [
                Text(
                  "أرباح اليوم",
                  style: AppTextStyle.regular12(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
                SizedBox(height: 8),
                Text(
                  "245.50 م.ج",
                  style: AppTextStyle.medium16(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                // SizedBox(height: 4.h),
              ],
            ),
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.062),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children: [
                Text(
                  "الطلبات المكتملة",
                  style: AppTextStyle.regular12(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
                SizedBox(height: 2),
                Text(
                  "14",
                  style: AppTextStyle.medium18(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
                // SizedBox(height: 2),
                Text(
                  "من أصل 18 مخطط",
                  style: AppTextStyle.regular12(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
