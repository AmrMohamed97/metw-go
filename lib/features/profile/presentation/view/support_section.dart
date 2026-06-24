
import 'package:flutter/material.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/features/profile/presentation/widgets/custom_section.dart';
import 'package:metw_go/features/profile/presentation/widgets/profile_item.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: AppLocalizations.of(context)!.supportAndHelp,
      children: [
        ProfileItem(icon: Icons.support_agent, title: AppLocalizations.of(context)!.contactUs),
        ProfileItem(
          icon: Icons.privacy_tip_outlined,
          title: AppLocalizations.of(context)!.privacyPolicy,
        ),
        ProfileItem(
          icon: Icons.help_outline,
          title: AppLocalizations.of(context)!.faq,
          isLast: true,
        ),
      ],
    );
  }
}