import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.icon,
    required this.iconColor,
  });
  final String title;
  final String date;
  final String amount;
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Theme.of(
            context,
          ).colorScheme.surfaceTint.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(icon, color: iconColor, size: 20)),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.medium14(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
                4.verticalSpace,
                Text(
                  date,
                  style: AppTextStyle.regular12(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: AppTextStyle.medium14(context).copyWith(
              color: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
    );
  }
}
