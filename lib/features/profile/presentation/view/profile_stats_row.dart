import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';

class ProfileStatsRow extends StatelessWidget {
  const ProfileStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            title: AppLocalizations.of(context)!.totalEarnings,
            value: AppLocalizations.of(context)!.earningsValueMock,
            icon: Icons.account_balance_wallet_outlined,
            iconColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: _buildStatCard(
            context,
            title: AppLocalizations.of(context)!.completedOrders,
            value: AppLocalizations.of(context)!.completedOrdersValueMock,
            icon: Icons.check_circle_outline,
            iconColor: MyColors.green,
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: _buildStatCard(
            context,
            title: AppLocalizations.of(context)!.totalOrders,
            value: AppLocalizations.of(context)!.totalOrdersValueMock,
            icon: Icons.shopping_bag_outlined,
            iconColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 18.sp),
          ),
          12.verticalSpace,
          Text(
            title,
            style: AppTextStyle.regular12(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 10.sp,
            ),
            textAlign: TextAlign.center,
          ),
          4.verticalSpace,
          Text(
            value,
            style: AppTextStyle.medium14(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.tertiary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
