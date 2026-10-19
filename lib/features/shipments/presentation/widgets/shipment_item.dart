import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/features/shipments/data/models/shipment_enums.dart';
import 'package:metw_go/features/shipments/data/models/shipment_model.dart';

class ShipmentItem extends StatelessWidget {
  const ShipmentItem({
    super.key,
    required this.shipment,
    this.onAcceptPressed,
    this.onDetailsPressed,
    this.isAcceptLoading = false,
  });

  final ShipmentModel shipment;
  final VoidCallback? onAcceptPressed;
  final VoidCallback? onDetailsPressed;
  final bool isAcceptLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final status = shipment.status;
    final canAccept = status == ShipmentAssignmentStatus.pending;

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
              color: _borderColor(context, status),
              width: 4,
            ),
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Header Row ──────────────────────────────────────────
            Row(
              children: [
                Text(
                  shipment.requestNumber ?? '',
                  style: AppTextStyle.medium16(context).copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const Spacer(),
                _StatusChip(status: status),
              ],
            ),

            12.verticalSpace,

            // ─── Path type badge ─────────────────────────────────────
            if (shipment.path?.typeLabel != null) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  shipment.path!.typeLabel!,
                  style: AppTextStyle.medium12(context).copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              10.verticalSpace,
            ],

            // ─── Addresses ───────────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.pickupFrom,
                        style: AppTextStyle.medium12(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        shipment.pickupAddress ?? '',
                        style: AppTextStyle.medium14(context).copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      16.verticalSpace,
                      Text(
                        l10n.deliveryTo,
                        style: AppTextStyle.medium12(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        shipment.dropoffAddress ?? '',
                        style: AppTextStyle.medium14(context).copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            14.verticalSpace,

            // ─── Fee Row ─────────────────────────────────────────────
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.15),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.local_shipping_outlined,
                    size: 20.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  8.horizontalSpace,
                  Text(
                    l10n.deliveryFare,
                    style: AppTextStyle.medium14(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  if (shipment.fee != null)
                    Text(
                      '${shipment.fee} ${shipment.currency ?? 'EGP'}',
                      style: AppTextStyle.bold16(context).copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  else
                    Text(
                      l10n.other,
                      style: AppTextStyle.medium14(context).copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                ],
              ),
            ),

            // ─── Package Info ────────────────────────────────────────
            if (shipment.packageCount != null ||
                shipment.totalWeight != null) ...[
              10.verticalSpace,
              Row(
                children: [
                  if (shipment.packageCount != null)
                    _InfoChip(
                      icon: Icons.inventory_2_outlined,
                      label: '${shipment.packageCount} ${l10n.parcelDetails}',
                    ),
                  if (shipment.packageCount != null &&
                      shipment.totalWeight != null)
                    8.horizontalSpace,
                  if (shipment.totalWeight != null)
                    _InfoChip(
                      icon: Icons.scale_outlined,
                      label: '${shipment.totalWeight} kg',
                    ),
                ],
              ),
            ],

            20.verticalSpace,

            // ─── Action Buttons ──────────────────────────────────────
            Row(
              children: [
                if (canAccept)
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                      text: l10n.acceptOrder,
                      onPressed: onAcceptPressed,
                      loading: isAcceptLoading,
                    ),
                  )
                else
                  Expanded(
                    flex: 2,
                    child: _StatusIndicator(context: context, status: status),
                  ),
                12.horizontalSpace,
                Expanded(
                  flex: 1,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
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
                          l10n.details,
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

  Color _borderColor(
    BuildContext context,
    ShipmentAssignmentStatus? status,
  ) {
    switch (status) {
      case ShipmentAssignmentStatus.pending:
        return Theme.of(context).colorScheme.primary;
      case ShipmentAssignmentStatus.confirmed:
      case ShipmentAssignmentStatus.executing:
        return MyColors.green;
      case ShipmentAssignmentStatus.rejected:
      case ShipmentAssignmentStatus.expired:
      case ShipmentAssignmentStatus.cancelled:
        return MyColors.red;
      case ShipmentAssignmentStatus.accepted:
      case ShipmentAssignmentStatus.reserve:
        return Theme.of(context).colorScheme.secondary;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }
}

// ─── Status Chip Widget ───────────────────────────────────────────────────────

class _StatusChip extends StatelessWidget {
  const _StatusChip({this.status});
  final ShipmentAssignmentStatus? status;

  @override
  Widget build(BuildContext context) {
    final (label, color) = _resolve(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: AppTextStyle.medium12(context).copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  (String, Color) _resolve(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (status) {
      case ShipmentAssignmentStatus.pending:
        return (l10n.upcomingOrders, Theme.of(context).colorScheme.primary);
      case ShipmentAssignmentStatus.accepted:
        return (l10n.received, Theme.of(context).colorScheme.secondary);
      case ShipmentAssignmentStatus.confirmed:
        return (l10n.orderAccepted, MyColors.green);
      case ShipmentAssignmentStatus.executing:
        return (l10n.deliveringOrder, MyColors.green);
      case ShipmentAssignmentStatus.completed:
        return (l10n.completed, MyColors.green);
      case ShipmentAssignmentStatus.rejected:
        return (l10n.rejectOrder, MyColors.red);
      case ShipmentAssignmentStatus.expired:
        return (l10n.cancel, MyColors.red);
      case ShipmentAssignmentStatus.cancelled:
        return (l10n.cancelledStatus, MyColors.red);
      case ShipmentAssignmentStatus.reserve:
        return (l10n.other, Theme.of(context).colorScheme.secondary);
      default:
        return ('—', MyColors.grey);
    }
  }
}

// ─── Status Indicator (non-pending state) ────────────────────────────────────

class _StatusIndicator extends StatelessWidget {
  const _StatusIndicator({required this.context, this.status});
  final BuildContext context;
  final ShipmentAssignmentStatus? status;

  @override
  Widget build(BuildContext ctx) {
    final l10n = AppLocalizations.of(context)!;
    String label;
    Color color;

    switch (status) {
      case ShipmentAssignmentStatus.accepted:
        label = l10n.received;
        color = Theme.of(context).colorScheme.secondary;
        break;
      case ShipmentAssignmentStatus.confirmed:
        label = l10n.orderAccepted;
        color = MyColors.green;
        break;
      case ShipmentAssignmentStatus.executing:
        label = l10n.deliveringOrder;
        color = MyColors.green;
        break;
      case ShipmentAssignmentStatus.completed:
        label = l10n.completed;
        color = MyColors.green;
        break;
      default:
        label = '—';
        color = MyColors.grey;
    }

    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Center(
        child: Text(
          label,
          style: AppTextStyle.medium14(context).copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// ─── Info Chip ────────────────────────────────────────────────────────────────

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14.sp, color: Theme.of(context).colorScheme.onSurface),
        4.horizontalSpace,
        Text(
          label,
          style: AppTextStyle.regular12(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
