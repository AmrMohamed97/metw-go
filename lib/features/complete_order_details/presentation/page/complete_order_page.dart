import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';

class CompleteOrderPage extends StatelessWidget {
  const CompleteOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ScreenWrapper(
      appBar: CustomAppBar(title: l10n.orders, centerTitle: true, canPob: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTopRow(context, l10n),
            24.verticalSpace,
            _buildOrderNumberBox(context, l10n),
            16.verticalSpace,
            _buildLocationsBox(context, l10n),
            16.verticalSpace,
            _buildCustomerRatingBox(context, l10n),
            24.verticalSpace,
            Text(
              l10n.profitDetails,
              style: AppTextStyle.medium14(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
            16.verticalSpace,
            _buildProfitDetailsSection(context, l10n),
            24.verticalSpace,
            Text(
              l10n.timeline,
              style: AppTextStyle.medium14(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
            16.verticalSpace,
            _buildTimelineSection(context, l10n),
            24.verticalSpace,
            Text(
              l10n.deliveryProof,
              style: AppTextStyle.medium14(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
            16.verticalSpace,
            _buildDeliveryProofImages(context),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildTopRow(BuildContext context, AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.bolt, color: Colors.white, size: 16.sp),
              8.horizontalSpace,
              Text(
                l10n.immediateDeliveryOnePoint,
                style: AppTextStyle.medium12(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: MyColors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.completed,
                style: AppTextStyle.medium12(
                  context,
                ).copyWith(color: Colors.white),
              ),
              8.horizontalSpace,
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderNumberBox(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.orderNumber,
                style: AppTextStyle.regular12(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              Text(
                l10n.mockOrderNumber2,
                style: AppTextStyle.medium14(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              l10n.electronicPayment,
              style: AppTextStyle.medium12(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationsBox(BuildContext context, AppLocalizations l10n) {
    return Column(
      children: [
        _buildLocationRow(
          context,
          title: l10n.pickupPoint,
          subtitle: l10n.mockBakeryName,
          icon: Icons.storefront_outlined,
          iconColor: MyColors.primaryColor,
          borderColor: MyColors.primaryColor,
        ),
        8.verticalSpace,
        _buildLocationRow(
          context,
          title: "${l10n.point1}: ${l10n.mockCustomerName}",
          subtitle: l10n.mockCustomerAddress,
          icon: Icons.location_on_outlined,
          iconColor: Theme.of(context).colorScheme.secondary,
          borderColor: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }

  Widget _buildLocationRow(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color borderColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: BorderDirectional(
          start: BorderSide(color: borderColor, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24.sp),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.regular12(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                Text(
                  subtitle,
                  style: AppTextStyle.medium14(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
              ],
            ),
          ),
          12.horizontalSpace,
          _buildActionButton(
            Icons.chat_bubble_outline,
            MyColors.green,
            context,
          ),
          8.horizontalSpace,
          _buildActionButton(Icons.call_outlined, MyColors.red, context),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color iconColor, context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outline,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: iconColor, size: 20.sp),
    );
  }

  Widget _buildCustomerRatingBox(BuildContext context, AppLocalizations l10n) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: BorderDirectional(
          start: BorderSide(color: MyColors.primaryColor, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.customerRating,
                style: AppTextStyle.regular12(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              4.verticalSpace,
              Row(
                children: [
                  Text(
                    "5.0",
                    style: AppTextStyle.medium14(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                  ),
                  4.horizontalSpace,
                  ...List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: MyColors.primaryColor,
                      size: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            l10n.mockReviewText,
            style: AppTextStyle.regular12(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );
  }

  Widget _buildProfitDetailsSection(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.netProfit,
                    style: AppTextStyle.regular12(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        l10n.mockNetProfit,
                        style: AppTextStyle.bold20(context).copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      4.horizontalSpace,
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Text(
                          "ج.م",
                          style: AppTextStyle.regular12(context).copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: MyColors.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: MyColors.primaryColor,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ),
        12.verticalSpace,
        Row(
          children: [
            Expanded(
              child: _buildSubProfitBox(
                context,
                l10n.orderPrice,
                l10n.mockOrderPriceVal,
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: _buildSubProfitBox(context, l10n.fare, l10n.mockFareVal),
            ),
          ],
        ),
        12.verticalSpace,
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: MyColors.red.withOpacity(0.02),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: MyColors.red.withOpacity(0.2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${l10n.commission} (15%) MetwGo",
                style: AppTextStyle.regular14(
                  context,
                ).copyWith(color: MyColors.red),
              ),
              Text(
                "${l10n.mockCommissionVal} ج.م",
                style: AppTextStyle.bold16(
                  context,
                ).copyWith(color: MyColors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubProfitBox(BuildContext context, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyle.regular12(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.onSurface),
            textAlign: TextAlign.center,
          ),
          4.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: AppTextStyle.bold16(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
              4.horizontalSpace,
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                  "ج.م",
                  style: AppTextStyle.regular12(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineSection(BuildContext context, AppLocalizations l10n) {
    return Column(
      children: [
        _buildTimelineStep(
          context: context,
          title: l10n.orderAccepted,
          subtitle: "${l10n.mockTime1} - ${l10n.mockDesc1}",
          icon: Icons.check,
          iconColor: Theme.of(context).colorScheme.secondary,
          isLast: false,
        ),
        _buildTimelineStep(
          context: context,
          title: l10n.received,
          subtitle: "${l10n.mockTime2} - ${l10n.mockDesc2}",
          icon: Icons.local_shipping_outlined,
          iconColor: Theme.of(context).colorScheme.secondary,
          isLast: false,
        ),
        _buildTimelineStep(
          context: context,
          title: l10n.delivered,
          subtitle: "${l10n.mockTime3} - ${l10n.mockDesc3}",
          icon: Icons.location_on_outlined,
          iconColor: MyColors.primaryColor,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildTimelineStep({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: iconColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 16.sp),
            ),
            if (!isLast)
              Container(
                width: 2.w,
                height: 32.h,
                color: Theme.of(
                  context,
                ).colorScheme.surfaceTint.withOpacity(0.5),
              ),
          ],
        ),
        12.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.regular12(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              4.verticalSpace,
              Text(
                subtitle,
                style: AppTextStyle.medium14(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
              if (!isLast) 24.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryProofImages(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildProofImage()),
        12.horizontalSpace,
        Expanded(child: _buildProofImage()),
        12.horizontalSpace,
        Expanded(child: _buildProofImage()),
      ],
    );
  }

  Widget _buildProofImage() {
    return Container(
      height: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage(
            "https://i.ebayimg.com/images/g/j9IAAOSwjcFm18zy/s-l1600.webp",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
