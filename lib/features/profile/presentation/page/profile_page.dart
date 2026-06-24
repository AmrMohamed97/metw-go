import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/profile/presentation/manager/profile_cubit.dart';
import 'package:metw_go/features/profile/presentation/manager/profile_state.dart';
import 'package:metw_go/features/profile/presentation/view/logout_view.dart';
import 'package:metw_go/features/profile/presentation/view/personal_info_section.dart';
import 'package:metw_go/features/profile/presentation/view/profile_header.dart';
import 'package:metw_go/features/profile/presentation/view/profile_stats_row.dart';
import 'package:metw_go/features/profile/presentation/view/setting_section.dart';
import 'package:metw_go/features/profile/presentation/view/support_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return ScreenWrapper(
            appBar: CustomAppBar(
              canPob: false,
              title: AppLocalizations.of(context)!.myProfile,
              centerTitle: true,
              actions: [
                Container(
                  margin: EdgeInsetsDirectional.only(end: 16),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Icon(
                    Icons.history,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: Column(
                children: [
                  ProfileHeader(),
                  24.verticalSpace,
                  ProfileStatsRow(),
                  24.verticalSpace,
                  PersonalInfoSection(),
                  16.verticalSpace,
                  SettingSection(),
                  16.verticalSpace,
                  SupportSection(),
                  24.verticalSpace,
                  LogoutView(),
                  32.verticalSpace,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
