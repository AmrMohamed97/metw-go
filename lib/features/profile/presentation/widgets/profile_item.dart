import 'package:flutter/material.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    this.isLast = false,
    this.trailing,
    this.trailingText,
  });
  final IconData icon;
  final String title;
  final bool isLast;
  final Widget? trailing;
  final String? trailingText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceTint.withValues(alpha:0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.tertiary,
              size: 20,
            ),
          ),
          title: Text(
            title,
            style: AppTextStyle.medium14(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
          trailing:
              trailing ??
              (trailingText != null
                  ? Text(
                      trailingText!,
                      style: AppTextStyle.medium14(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.primary),
                    )
                  : Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Theme.of(context).colorScheme.primary,
                    )),
        ),
        if (!isLast)
          Divider(
            color: Theme.of(context).colorScheme.surfaceTint.withValues(alpha:0.5),
            height: 1,
            indent: 56,
          ),
      ],
    );
  }
}
