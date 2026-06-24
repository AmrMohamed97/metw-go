import 'package:flutter/material.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';

class LogoutView extends StatelessWidget {
  const LogoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        title: Text(
          AppLocalizations.of(context)!.logout,
          style: AppTextStyle.medium16(
            context,
          ).copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        leading: Icon(
          Icons.logout,
          color: Theme.of(context).colorScheme.primary,
          size: 20,
        ),
        onTap: () {
          // Add logout logic
        },
      ),
    );
  }
}
