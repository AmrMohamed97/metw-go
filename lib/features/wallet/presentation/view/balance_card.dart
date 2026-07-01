import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient:   LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.secondary,
            MyColors.primaryColor,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.availableBalance,
            style: AppTextStyle.regular14(
              context,
            ).copyWith(color: Colors.white.withValues(alpha: 0.9)),
          ),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "1,250.50",
                style: AppTextStyle.medium18(context).copyWith(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 20.sp,
                ),
              ),
              4.horizontalSpace,
              Text(
                AppLocalizations.of(context)!.egp,
                style: AppTextStyle.medium14(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.surface),
              ),
            ],
          ),
          16.verticalSpace,
          Material(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(36.r),
              bottomStart: Radius.circular(16.r),
              topEnd: Radius.circular(16.r),
              topStart: Radius.circular(16.r),
            ),
            child: InkWell(
              onTap: () {},
              // borderRadius: BorderRadius.circular(16.r),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                    8.horizontalSpace,
                    Text(
                      AppLocalizations.of(context)!.withdrawProfits,
                      style: AppTextStyle.medium14(context).copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
