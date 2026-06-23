import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            title: "اليوم",
            value: "145.00 ج.م",
            icon: Icons.trending_up,
            iconColor: MyColors.green,
            subtitle: "12%+",
            subtitleColor: MyColors.green,
            borderColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        16.horizontalSpace,
        Expanded(
          child: _buildStatCard(
            context,
            title: "الطلبات",
            value: "12 طلب",
            icon: Icons.local_shipping_outlined,
            iconColor: MyColors.textColor,
            subtitle: "مكتمل",
            subtitleColor: MyColors.grey,
            borderColor: Theme.of(context).colorScheme.primary,
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
    required String subtitle,
    required Color subtitleColor,
    required Color borderColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: BorderDirectional(
          start: BorderSide(color: borderColor, width: 4.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.regular12(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          2.verticalSpace,
          Text(
            value,
            style: AppTextStyle.medium16(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
          4.verticalSpace,
          Row(
            children: [
              Icon(icon, size: 14.sp, color: iconColor),
              4.horizontalSpace,
              Text(
                subtitle,
                style: AppTextStyle.regular12(
                  context,
                ).copyWith(color: subtitleColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
