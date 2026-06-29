import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/core/cubit/app_cubit.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/features/profile/presentation/manager/profile_cubit.dart';
import 'package:metw_go/features/profile/presentation/manager/profile_state.dart';
import 'package:metw_go/features/profile/presentation/widgets/custom_section.dart';
import 'package:metw_go/features/profile/presentation/widgets/profile_item.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({
    super.key,
  });

  void _showLanguageMenu(BuildContext context, AppCubit appCubit) {
    final isArabic = appCubit.currentLocale.languageCode == 'ar';
    showMenu<Locale>(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width - 160,
        kToolbarHeight * 4,
        16,
        0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      items: [
        PopupMenuItem(
          value: const Locale('ar'),
          child: Row(
            children: [
              Text('🇸🇦  العربية'),
              const Spacer(),
              if (isArabic)
                Icon(
                  Icons.check,
                  size: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
            ],
          ),
        ),
        PopupMenuItem(
          value: const Locale('en'),
          child: Row(
            children: [
              Text('🇬🇧  English'),
              const Spacer(),
              if (!isArabic)
                Icon(
                  Icons.check,
                  size: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
            ],
          ),
        ),
      ],
    ).then((selected) {
      if (selected != null) {
        appCubit.changeLanguage(selected);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    final appCubit = context.read<AppCubit>();
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (prev, curr) => curr is ChangeLanguageState,
      builder: (context, appState) {
        final isArabic = appCubit.currentLocale.languageCode == 'ar';
        return BlocBuilder<ProfileCubit, ProfileState>(
          buildWhen: (prev, curr) => curr is ToggleNotificationsState,
          builder: (context, profileState) {
            return CustomSection(
              title: AppLocalizations.of(context)!.settings,
              children: [
                ProfileItem(
                  icon: Icons.notifications_none,
                  title: AppLocalizations.of(context)!.notificationSettings,
                  trailing: CupertinoSwitch(
                    value: profileCubit.notificationsEnabled,
                    onChanged: (v) => profileCubit.toggleNotifications(v),
                    activeTrackColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
                ProfileItem(
                  icon: Icons.language,
                  title: AppLocalizations.of(context)!.language,
                  trailingText: isArabic ? 'العربية' : 'English',
                  onPressed: () => _showLanguageMenu(context, appCubit),
                ),
                ProfileItem(
                  icon: Icons.dark_mode_outlined,
                  title: AppLocalizations.of(context)!.darkMode,
                  trailing: CupertinoSwitch(
                    value: appCubit.isDarkMode,
                    onChanged: (v) => appCubit.toggleTheme(v),
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
          },
        );
      },
    );
  }
}
