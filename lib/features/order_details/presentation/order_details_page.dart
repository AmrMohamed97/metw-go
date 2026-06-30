import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: CustomAppBar(title: l10n.orders, centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Top Row (Status & Timer)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Status (Right side in RTL)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.secondaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.bolt, color: MyColors.white, size: 20.r),
                      SizedBox(width: 8.w),
                      Text(
                        l10n.immediateDeliveryOnePoint,
                        style: AppTextStyle.medium14(
                          context,
                        ).copyWith(color: MyColors.white),
                      ),
                    ],
                  ),
                ),
                // Timer (Left side in RTL)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: MyColors.offWhite),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.pie_chart_outline,
                        color: MyColors.primaryColor,
                        size: 20.r,
                      ),
                      SizedBox(width: 8.w),
                      Text('02:30 د', style: AppTextStyle.medium14(context)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Pickup Location
            _LocationCard(
              title: l10n.pickupPoint,
              subtitle: l10n.mockBakeryName,
              icon: Icons.storefront_outlined,
              iconColor: MyColors.primaryColor,
              iconBgColor: MyColors.primaryColor.withOpacity(0.1),
              borderColor: MyColors.primaryColor,
            ),

            // Dropoff Location
            _LocationCard(
              title: l10n.dropoffPoint,
              subtitle: l10n.mockCustomerAddress,
              icon: Icons.person_outline,
              iconColor: MyColors.secondaryColor,
              iconBgColor: MyColors.secondaryColor.withOpacity(0.1),
              borderColor: MyColors.secondaryColor,
            ),
            SizedBox(height: 16.h),

            // Shipment Details Card
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: MyColors.offWhite),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        color: MyColors.primaryColor,
                        size: 24.r,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        l10n.shipmentDetails,
                        style: AppTextStyle.bold16(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _buildDetailRow(
                    context,
                    title: l10n.orderContent,
                    value: 'علبة معجنات مشكلة + عصير',
                  ),
                  _buildDetailRow(
                    context,
                    title: l10n.approximateWeight,
                    value: '5 كجم تقريباً',
                  ),
                  _buildDetailRow(
                    context,
                    title: l10n.paymentMethod,
                    value: l10n.cashOnDelivery,
                    valueColor: MyColors.primaryColor,
                    icon: Icon(
                      Icons.money,
                      color: MyColors.primaryColor,
                      size: 20.r,
                    ),
                  ),
                  _buildDetailRow(
                    context,
                    title: l10n.totalOrderValue,
                    value: '145.00 ج.م',
                  ),
                  SizedBox(height: 16.h),
                  DashedDivider(color: MyColors.greyLight),
                  SizedBox(height: 16.h),
                  _buildDetailRow(
                    context,
                    title: l10n.fare,
                    value: '100 ج.م',
                    valueColor: MyColors.primaryColor,
                    isBold: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Information Box
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: MyColors.textColor,
                    size: 24.r,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      l10n.receiptConfirmationNote,
                      style: AppTextStyle.regular14(context),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),

            // Buttons
            CustomButton(
              text: l10n.acceptOrder,
              onPressed: () {},
              isMax: true,
              backgroundColor: MyColors.primaryColor,
              textColor: MyColors.white,
            ),
            SizedBox(height: 16.h),
            TextButton(
              onPressed: () => _showRejectBottomSheet(context),
              child: Text(
                l10n.rejectOrder,
                style: AppTextStyle.medium16(
                  context,
                ).copyWith(color: MyColors.textColor),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  void _showRejectBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: const Duration(milliseconds: 450),
      ),
      builder: (ctx) => const _RejectBottomSheet(),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required String title,
    required String value,
    Color? valueColor,
    Widget? icon,
    bool isBold = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.regular14(
              context,
            ).copyWith(color: MyColors.grey),
          ),
          Row(
            children: [
              if (icon != null) ...[icon, SizedBox(width: 8.w)],
              Text(
                value,
                style: isBold
                    ? AppTextStyle.bold16(context).copyWith(
                        color:
                            valueColor ?? Theme.of(context).colorScheme.shadow,
                      )
                    : AppTextStyle.medium14(context).copyWith(
                        color:
                            valueColor ?? Theme.of(context).colorScheme.shadow,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final Color borderColor;

  const _LocationCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.offWhite),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Colored Border line
            Container(
              width: 6.w,
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(16.r),
                  bottomStart: Radius.circular(16.r),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            // Right Icon
            Container(
              padding: EdgeInsets.all(12.r),
              margin: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: iconColor, size: 24.r),
            ),
            SizedBox(width: 12.w),
            // Text Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.regular12(
                      context,
                    ).copyWith(color: MyColors.grey),
                  ),
                  SizedBox(height: 4.h),
                  Text(subtitle, style: AppTextStyle.medium14(context)),
                ],
              ),
            ),
            // Action Buttons
            _buildActionButton(Icons.chat_bubble_outline, MyColors.green),
            SizedBox(width: 8.w),
            _buildActionButton(Icons.phone_outlined, MyColors.red),
            SizedBox(width: 12.w),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(icon, color: color, size: 20.r),
    );
  }
}

class DashedDivider extends StatelessWidget {
  final double height;
  final Color color;

  const DashedDivider({super.key, this.height = 1, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            );
          }),
        );
      },
    );
  }
}

// ─── Reject Bottom Sheet ───────────────────────────────────────────────────

class _RejectReason {
  final String label;
  final IconData icon;

  const _RejectReason({required this.label, required this.icon});
}

class _RejectBottomSheet extends StatefulWidget {
  const _RejectBottomSheet();

  @override
  State<_RejectBottomSheet> createState() => _RejectBottomSheetState();
}

class _RejectBottomSheetState extends State<_RejectBottomSheet>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  List<_RejectReason> _buildReasons(AppLocalizations l10n) => [
    _RejectReason(label: l10n.locationTooFar, icon: Icons.location_on_outlined),
    _RejectReason(
      label: l10n.packageTooHeavy,
      icon: Icons.shopping_bag_outlined,
    ),
    _RejectReason(label: l10n.vehicleIssue, icon: Icons.no_drinks_outlined),
    _RejectReason(label: l10n.personalBreak, icon: Icons.coffee_outlined),
    _RejectReason(label: l10n.other, icon: Icons.more_horiz),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final reasons = _buildReasons(l10n);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 12.h,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag Handle
            Container(
              width: 48.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: MyColors.greyLight,
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            SizedBox(height: 24.h),

            // Title
            Text(
              l10n.rejectionReason,
              style: AppTextStyle.bold20(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),

            // Subtitle
            Text(
              l10n.selectRejectionReason,
              style: AppTextStyle.regular14(
                context,
              ).copyWith(color: MyColors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),

            // Reason Options
            ...List.generate(reasons.length, (index) {
              final reason = reasons[index];
              final isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.only(bottom: 12.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(
                      color: isSelected
                          ? MyColors.secondaryColor.withOpacity(0.4)
                          : MyColors.greyLight,
                      width: isSelected ? 1.5 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      // Radio indicator
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: 24.r,
                        height: 24.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? MyColors.secondaryColor
                              : Colors.transparent,
                          border: Border.all(
                            color: isSelected
                                ? MyColors.secondaryColor
                                : MyColors.greyLight,
                            width: 2,
                          ),
                        ),
                        child: isSelected
                            ? Icon(
                                Icons.circle,
                                size: 10.r,
                                color: MyColors.white,
                              )
                            : null,
                      ),
                      SizedBox(width: 14.w),

                      // Label
                      Expanded(
                        child: Text(
                          reason.label,
                          style: AppTextStyle.medium14(context),
                        ),
                      ),

                      // Icon Badge
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.outline,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Icon(
                          reason.icon,
                          size: 22.r,
                          color: MyColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            SizedBox(height: 16.h),

            // Confirm button
            CustomButton(
              text: l10n.confirmRejection,
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: handle rejection with reasons[_selectedIndex].label
              },
              isMax: true,
              backgroundColor: MyColors.primaryColor,
              textColor: MyColors.white,
            ),
            SizedBox(height: 12.h),

            // Cancel text
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                l10n.cancel,
                style: AppTextStyle.medium16(
                  context,
                ).copyWith(color: MyColors.textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
