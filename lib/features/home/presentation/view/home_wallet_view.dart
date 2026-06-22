import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class HomeWalletView extends StatelessWidget {
  const HomeWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outline,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.secondary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.account_balance_wallet_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          12.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "المحفظة",
                style: AppTextStyle.medium12(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              Text(
                "1,240 ج.م",
                style: AppTextStyle.medium16(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
            ],
          ),
          const Spacer(),
          Text(
            "سحب الرصيد",
            style: AppTextStyle.medium14(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
          SizedBox(width: 4.w),
          Icon(
            Icons.arrow_forward,
            size: 16.sp,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}
