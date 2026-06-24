import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ScreenWrapper(
      appBar: CustomAppBar(
        title: l10n.myProfile,
        centerTitle: true,
        canPob: true,
        actions: [
          Container(
            margin: EdgeInsetsDirectional.only(end: 16),
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.primaryColor,
            ),
            child: const Icon(Icons.history, color: Colors.white, size: 20),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            _buildProfileHeader(context, l10n),
            24.verticalSpace,
            _buildStatsRow(context, l10n),
            24.verticalSpace,
            _buildSection(
              context,
              title: l10n.personalInfo,
              children: [
                _buildListTile(context, icon: Icons.person_outline, title: l10n.personalData),
                _buildListTile(context, icon: Icons.language, title: l10n.delegateInfo),
                _buildListTile(context, icon: Icons.directions_car_outlined, title: l10n.vehicleData),
                _buildListTile(context, icon: Icons.location_on_outlined, title: l10n.serviceAreas),
                _buildListTile(context, icon: Icons.description_outlined, title: l10n.documents, isLast: true),
              ],
            ),
            16.verticalSpace,
            _buildSection(
              context,
              title: l10n.settings,
              children: [
                _buildListTile(
                  context,
                  icon: Icons.notifications_none,
                  title: l10n.notificationSettings,
                  trailing: CupertinoSwitch(
                    value: true,
                    onChanged: (v) {},
                    activeColor: MyColors.primaryColor,
                  ),
                ),
                _buildListTile(
                  context,
                  icon: Icons.language,
                  title: l10n.language,
                  trailingText: l10n.arabic,
                ),
                _buildListTile(
                  context,
                  icon: Icons.dark_mode_outlined,
                  title: l10n.darkMode,
                  trailing: CupertinoSwitch(
                    value: false,
                    onChanged: (v) {},
                    activeColor: MyColors.primaryColor,
                  ),
                ),
                _buildListTile(context, icon: Icons.delete_outline, title: l10n.deleteAccount, isLast: true),
              ],
            ),
            16.verticalSpace,
            _buildSection(
              context,
              title: l10n.supportAndHelp,
              children: [
                _buildListTile(context, icon: Icons.support_agent, title: l10n.contactUs),
                _buildListTile(context, icon: Icons.privacy_tip_outlined, title: l10n.privacyPolicy),
                _buildListTile(context, icon: Icons.help_outline, title: l10n.faq, isLast: true),
              ],
            ),
            24.verticalSpace,
            _buildLogoutButton(context, l10n),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, AppLocalizations l10n) {
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
                border: Border.all(color: MyColors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
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
                border: Border.all(color: MyColors.white, width: 2),
              ),
            ),
          ],
        ),
        12.verticalSpace,
        Text(
          l10n.ahmedMohamed,
          style: AppTextStyle.bold18(context).copyWith(color: Theme.of(context).colorScheme.tertiary),
        ),
        8.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTag(context, l10n.delegateIdMock, null),
            8.horizontalSpace,
            _buildTag(context, l10n.ratingMock, Icons.star),
          ],
        ),
      ],
    );
  }

  Widget _buildTag(BuildContext context, String text, IconData? icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: MyColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: AppTextStyle.medium12(context).copyWith(color: MyColors.primaryColor),
          ),
          if (icon != null) ...[
            4.horizontalSpace,
            Icon(icon, color: MyColors.primaryColor, size: 12.sp),
          ],
        ],
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context, AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            title: l10n.totalEarnings,
            value: l10n.earningsValueMock,
            icon: Icons.account_balance_wallet_outlined,
            iconColor: MyColors.secondaryColor,
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: _buildStatCard(
            context,
            title: l10n.completedOrders,
            value: l10n.completedOrdersValueMock,
            icon: Icons.check_circle_outline,
            iconColor: MyColors.green,
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: _buildStatCard(
            context,
            title: l10n.totalOrders,
            value: l10n.totalOrdersValueMock,
            icon: Icons.shopping_bag_outlined,
            iconColor: MyColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 18.sp),
          ),
          12.verticalSpace,
          Text(
            title,
            style: AppTextStyle.regular12(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 10.sp,
            ),
            textAlign: TextAlign.center,
          ),
          4.verticalSpace,
          Text(
            value,
            style: AppTextStyle.medium14(context).copyWith(color: Theme.of(context).colorScheme.tertiary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Text(
            title,
            style: AppTextStyle.medium14(context).copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    bool isLast = false,
    Widget? trailing,
    String? trailingText,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: MyColors.greyLight.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Theme.of(context).colorScheme.tertiary, size: 20.sp),
          ),
          title: Text(
            title,
            style: AppTextStyle.medium14(context).copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
          trailing: trailing ??
              (trailingText != null
                  ? Text(trailingText, style: AppTextStyle.medium14(context).copyWith(color: MyColors.primaryColor))
                  : Icon(Icons.arrow_forward_ios, size: 14.sp, color: MyColors.primaryColor)),
        ),
        if (!isLast)
          Divider(
            color: MyColors.greyLight.withOpacity(0.5),
            height: 1,
            indent: 56,
          ),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context, AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        title: Text(
          l10n.logout,
          style: AppTextStyle.medium16(context).copyWith(color: MyColors.primaryColor),
        ),
        trailing: Icon(Icons.logout, color: MyColors.primaryColor, size: 20.sp),
        onTap: () {
          // Add logout logic
        },
      ),
    );
  }
}