import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class HistorySearchView extends StatelessWidget {
  const HistorySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(24),
            ),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              AppLocalizations.of(context)!.search,
              style: AppTextStyle.regular14(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ),
        12.horizontalSpace,
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.surface,
            size: 24,
          ),
        ),
      ],
    );
  }
}
