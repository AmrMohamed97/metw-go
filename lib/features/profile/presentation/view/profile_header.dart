import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 14.w,
              height: 14.w,
              margin: const EdgeInsets.only(bottom: 4, right: 4),
              decoration: BoxDecoration(
                color: MyColors.green,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
              ),
            ),
          ],
        ),
        12.verticalSpace,
        Text(
          AppLocalizations.of(context)!.ahmedMohamed,
          style: AppTextStyle.bold18(
            context,
          ).copyWith(color: Theme.of(context).colorScheme.tertiary),
        ),
        8.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTag(
              context,
              AppLocalizations.of(context)!.delegateIdMock,
              null,
            ),
            8.horizontalSpace,
            _buildTag(
              context,
              AppLocalizations.of(context)!.ratingMock,
              Icons.star,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTag(BuildContext context, String text, IconData? icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: AppTextStyle.medium12(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          if (icon != null) ...[
            4.horizontalSpace,
            Icon(icon, color: Theme.of(context).colorScheme.primary, size: 12),
          ],
        ],
      ),
    );
  }
}
