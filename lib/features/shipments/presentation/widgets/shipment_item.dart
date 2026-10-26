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
    this.onRejectPressed,
    this.onDetailsPressed,
    this.isAcceptLoading = false,
  });

  final ShipmentModel shipment;
  final VoidCallback? onAcceptPressed;
  final VoidCallback? onRejectPressed;
  final VoidCallback? onDetailsPressed;
  final bool isAcceptLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final status = shipment.status;
    final canAccept = status == ShipmentAssignmentStatus.pending;

    final taskTypeLabel = shipment.path?.currentLeg?.label ??
        shipment.path?.typeLabel ??
        (shipment.legType == 'bus_segment'
            ? 'شحن بالأتوبيس'
            : (shipment.legType != null && shipment.legType!.isNotEmpty
                ? shipment.legType!
                : 'مهمة شحن'));

    final currency = shipment.currency ?? 'ج.م';

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
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
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Header Row (Request Number & Status) ─────────────────
            Row(
              children: [
                Text(
                  shipment.requestNumber ?? '',
                  style: AppTextStyle.bold16(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const Spacer(),
                _StatusChip(status: status),
              ],
            ),

            8.verticalSpace,

            // ─── Task Type Badge & Additional Info ─────────────────────
            Wrap(
              spacing: 8.w,
              runSpacing: 4.h,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        shipment.legType == 'bus_segment'
                            ? Icons.directions_bus_outlined
                            : Icons.local_shipping_outlined,
                        size: 14.sp,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      4.horizontalSpace,
                      Text(
                        taskTypeLabel,
                        style: AppTextStyle.medium12(context).copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                if (shipment.path?.statusLabel != null)
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      shipment.path!.statusLabel!,
                      style: AppTextStyle.regular12(context).copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
              ],
            ),

            12.verticalSpace,

            // ─── Addresses ───────────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(height: 4.h),
                    Container(
                      width: 14.w,
                      height: 14.h,
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
                      width: 1.w,
                      height: 40.h,
                      color: Theme.of(context).colorScheme.surfaceTint,
                    ),
                    Container(
                      width: 14.w,
                      height: 14.h,
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
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.15),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.payments_outlined,
                    size: 20.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  8.horizontalSpace,
                  Text(
                    shipment.requiresFeeInput == true
                        ? 'أجرة المندوب'
                        : l10n.deliveryFare,
                    style: AppTextStyle.medium14(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  if (shipment.requiresFeeInput == true)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        shipment.acceptedFee != null
                            ? '${shipment.acceptedFee} $currency'
                            : 'يحددها المندوب',
                        style: AppTextStyle.bold14(context).copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    )
                  else if (shipment.offeredFee != null ||
                      shipment.fee != null)
                    Text(
                      '${shipment.offeredFee ?? shipment.fee} $currency',
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

            // ─── Response Deadline Row ───────────────────────────────
            if (shipment.responseDeadline != null &&
                shipment.responseDeadline!.isNotEmpty) ...[
              8.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8.r),
                  border:
                      Border.all(color: Colors.amber.withValues(alpha: 0.25)),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      size: 16.sp,
                      color: Colors.amber.shade800,
                    ),
                    6.horizontalSpace,
                    Text(
                      'ينتهي العرض: ',
                      style: AppTextStyle.medium12(context).copyWith(
                        color: Colors.amber.shade900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      _formatDeadline(shipment.responseDeadline!),
                      style: AppTextStyle.bold12(context).copyWith(
                        color: Colors.amber.shade900,
                      ),
                    ),
                  ],
                ),
              ),
            ],

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
                if (canAccept) ...[
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                      text: l10n.acceptOrder,
                      onPressed: onAcceptPressed,
                      loading: isAcceptLoading,
                    ),
                  ),
                  8.horizontalSpace,
                  Expanded(
                    flex: 1,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      onPressed: onRejectPressed,
                      child: Container(
                        height: 46,
                        decoration: BoxDecoration(
                          color: MyColors.red.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: MyColors.red.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'رفض',
                            style: AppTextStyle.medium14(context).copyWith(
                              color: MyColors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  Expanded(
                    flex: 2,
                    child: _StatusIndicator(context: context, status: status),
                  ),
                ],
                8.horizontalSpace,
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  onPressed: onDetailsPressed,
                  child: Container(
                    height: 46,
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDeadline(String iso) {
    try {
      final dt = DateTime.parse(iso).toLocal();
      final hour = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
      final period = dt.hour >= 12 ? 'م' : 'ص';
      final minute = dt.minute.toString().padLeft(2, '0');
      return '$hour:$minute $period ${dt.year}/${dt.month.toString().padLeft(2, '0')}/${dt.day.toString().padLeft(2, '0')}';
    } catch (_) {
      return iso;
    }
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
        return ('بانتظار ردك', Theme.of(context).colorScheme.primary);
      case ShipmentAssignmentStatus.accepted:
        return ('تم القبول، بانتظار الاختيار', Theme.of(context).colorScheme.secondary);
      case ShipmentAssignmentStatus.confirmed:
        return ('تم اختيارك', MyColors.green);
      case ShipmentAssignmentStatus.reserve:
        return ('احتياطي', Theme.of(context).colorScheme.secondary);
      case ShipmentAssignmentStatus.executing:
        return ('قيد التنفيذ', MyColors.green);
      case ShipmentAssignmentStatus.completed:
        return ('أتمّ المرحلة', MyColors.green);
      case ShipmentAssignmentStatus.rejected:
        return ('مرفوض', MyColors.red);
      case ShipmentAssignmentStatus.expired:
        return ('منتهي الصلاحية', MyColors.grey);
      case ShipmentAssignmentStatus.cancelled:
        return (l10n.cancelledStatus, MyColors.red);
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
    String label;
    Color color;

    switch (status) {
      case ShipmentAssignmentStatus.accepted:
        label = 'تم القبول، بانتظار الاختيار';
        color = Theme.of(context).colorScheme.secondary;
        break;
      case ShipmentAssignmentStatus.confirmed:
        label = 'تم اختيارك';
        color = MyColors.green;
        break;
      case ShipmentAssignmentStatus.reserve:
        label = 'احتياطي';
        color = Theme.of(context).colorScheme.secondary;
        break;
      case ShipmentAssignmentStatus.executing:
        label = 'قيد التنفيذ';
        color = MyColors.green;
        break;
      case ShipmentAssignmentStatus.completed:
        label = 'أتمّ المرحلة';
        color = MyColors.green;
        break;
      case ShipmentAssignmentStatus.rejected:
        label = 'مرفوض';
        color = MyColors.red;
        break;
      case ShipmentAssignmentStatus.expired:
        label = 'منتهي الصلاحية';
        color = MyColors.grey;
        break;
      case ShipmentAssignmentStatus.cancelled:
        label = 'ملغي';
        color = MyColors.red;
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
