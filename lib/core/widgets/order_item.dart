import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/custom_button.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.orderId,
    required this.distance,
    required this.isUrgent,
    required this.pickup,
    required this.delivery,
    this.deliveryLabel,
    this.isTodayOrders = false,
    this.onDetailsPressed,
    this.isLoading = false,
    this.onPressed,

    // required this.borderColor,
  });
  final String orderId;
  final String distance;
  final bool isUrgent, isTodayOrders, isLoading;
  final String pickup;
  final String delivery;
  final String? deliveryLabel;
  final void Function()? onDetailsPressed, onPressed;
  // final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          border: BorderDirectional(
            start: BorderSide(
              color: isUrgent
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
              width: 4,
            ),
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Top Row
            Row(
              children: [
                if (isUrgent) ...[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.urgent,
                      style: AppTextStyle.medium14(context).copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  8.horizontalSpace,
                  Text(
                    orderId,
                    style: AppTextStyle.medium16(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                  ),
                ],
                const Spacer(),
                Text(
                  distance,
                  style: AppTextStyle.medium14(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
              ],
            ),
            16.verticalSpace,

            // Timeline Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline indicators
                Column(
                  children: [
                    SizedBox(height: 4),
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 2.5,
                        ),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Theme.of(context).colorScheme.surfaceTint,
                    ),
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // Texts
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.pickupFrom,
                        style: AppTextStyle.medium14(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        pickup,
                        style: AppTextStyle.medium14(context).copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        deliveryLabel ??
                            AppLocalizations.of(context)!.deliveryTo,
                        style: AppTextStyle.medium14(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        delivery,
                        style: AppTextStyle.medium14(context).copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            20.verticalSpace,

            // Bottom Row
            Row(
              children: [
                // if (isTodayOrders)
                //   Expanded(
                //     flex: 2,
                //     child: CustomButton(
                //       text: AppLocalizations.of(context)!.startOrder,
                //       onPressed: () {},
                //     ),
                //   )
                // else
                onPressed == null
                    ? Expanded(
                        flex: 2,
                        child: Container(
                          height: 46,
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.35),
                              width: 1.2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primary.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Icon(
                                  Icons.two_wheeler_rounded,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 16.sp,
                                ),
                              ),
                              8.horizontalSpace,
                              Expanded(
                                child: Text(
                                  "جاري التوصيل",
                                  style: AppTextStyle.medium14(context)
                                      .copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              4.horizontalSpace,
                              Container(
                                width: 7.r,
                                height: 7.r,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF10B981),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x6610B981),
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        flex: 2,
                        child: CustomButton(
                          text: AppLocalizations.of(context)!.startOrder,
                          onPressed: onPressed,
                          loading: isLoading,
                        ),
                      ),
                12.horizontalSpace,
                Expanded(
                  flex: 1,
                  child: CupertinoButton(
                    padding: EdgeInsets.all(0),
                    minimumSize: Size.zero,
                    onPressed: onDetailsPressed,
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surfaceTint,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.details,
                          style: AppTextStyle.medium14(context).copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
