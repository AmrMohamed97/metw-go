

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/features/profile/presentation/widgets/custom_section.dart';
import 'package:metw_go/features/profile/presentation/widgets/profile_item.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: AppLocalizations.of(context)!.settings,
      children: [
        ProfileItem(
          icon: Icons.notifications_none,
          title: AppLocalizations.of(context)!.notificationSettings,
          trailing: CupertinoSwitch(
            value: true,
            onChanged: (v) {},
            activeTrackColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        ProfileItem(
          icon: Icons.language,
          title: AppLocalizations.of(context)!.language,
          trailingText: AppLocalizations.of(context)!.arabic,
        ),
        ProfileItem(
          icon: Icons.dark_mode_outlined,
          title: AppLocalizations.of(context)!.darkMode,
          trailing: CupertinoSwitch(
            value: false,
            onChanged: (v) {},
            activeTrackColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        ProfileItem(
          icon: Icons.delete_outline,
          title: AppLocalizations.of(context)!.deleteAccount,
          isLast: true,
        ),
      ],
    );
  }
}
