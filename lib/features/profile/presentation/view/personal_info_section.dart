import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/features/profile/presentation/widgets/custom_section.dart';
import 'package:metw_go/features/profile/presentation/widgets/profile_item.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: AppLocalizations.of(context)!.personalInfo,
      children: [
        ProfileItem(
          icon: Icons.person_outline,
          title: AppLocalizations.of(context)!.personalData,
          onPressed: () => context.push(AppRoutes.personalInfoPage),
        ),
        ProfileItem(
          icon: Icons.language,
          title: AppLocalizations.of(context)!.delegateInfo,
          onPressed: () => context.push(AppRoutes.delegateInfoPage),
        ),
        ProfileItem(
          icon: Icons.directions_car_outlined,
          title: AppLocalizations.of(context)!.vehicleData,
          onPressed: () => context.push(AppRoutes.vehiclePage),
        ),
        ProfileItem(
          icon: Icons.location_on_outlined,
          title: AppLocalizations.of(context)!.serviceAreas,
          onPressed: () => context.push(AppRoutes.serviceAreasPage),
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
