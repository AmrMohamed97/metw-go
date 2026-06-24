
import 'package:flutter/material.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/features/profile/presentation/widgets/custom_section.dart';
import 'package:metw_go/features/profile/presentation/widgets/profile_item.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: AppLocalizations.of(context)!.personalInfo,
      children: [
        ProfileItem(
          icon: Icons.person_outline,
          title: AppLocalizations.of(context)!.personalData,
        ),
        ProfileItem(icon: Icons.language, title: AppLocalizations.of(context)!.delegateInfo),
        ProfileItem(
          icon: Icons.directions_car_outlined,
          title: AppLocalizations.of(context)!.vehicleData,
        ),
        ProfileItem(
          icon: Icons.location_on_outlined,
          title: AppLocalizations.of(context)!.serviceAreas,
        ),
        ProfileItem(
          icon: Icons.description_outlined,
          title: AppLocalizations.of(context)!.documents,
          isLast: true,
        ),
      ],
    );
  }
}
