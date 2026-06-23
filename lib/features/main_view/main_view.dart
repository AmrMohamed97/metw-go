import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/features/home/presentation/page/home_page.dart';
import 'package:metw_go/features/orders/presentation/page/orders_page.dart';
import 'package:metw_go/features/wallet/presentation/page/wallet_page.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0; // Starts with Home

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(),
      OrdersPage(),
      WalletPage(),
      Center(child: Text(AppLocalizations.of(context)!.myAccount)),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.outline,
      body: pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(
              context: context,
              index: 0,
              icon: AppImages.home,
              label: AppLocalizations.of(context)!.home,
              isSelected: currentIndex == 0,
              onTap: () => onTap(0),
            ),
            _buildNavItem(
              context: context,
              index: 1,
              icon: AppImages.orders, // Placeholder for bag with check
              label: AppLocalizations.of(context)!.orders,
              isSelected: currentIndex == 1,
              onTap: () => onTap(1),
            ),
            _buildNavItem(
              context: context,
              index: 2,
              icon: AppImages.wallet,
              label: AppLocalizations.of(context)!.wallet,
              isSelected: currentIndex == 2,
              onTap: () => onTap(2),
            ),
            _buildNavItem(
              context: context,
              index: 3,
              icon: AppImages.profile,
              label: AppLocalizations.of(context)!.myAccount,
              isSelected: currentIndex == 3,
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      onPressed: onTap,
      // behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 20 : 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                icon,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
                // size: 26,
              ),
              if (isSelected) ...[
                SizedBox(width: 8),
                Text(
                  label,
                  style: AppTextStyle.regular14(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
