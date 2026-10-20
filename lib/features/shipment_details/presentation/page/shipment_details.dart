import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/cubit/app_cubit.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/di/dependency_injection.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_error_widget.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/edit_fee_bottom_sheet.dart';
import 'package:metw_go/features/shipment_details/data/models/shipment_details_response.dart';
import 'package:metw_go/features/shipment_details/presentation/manager/shipment_details_cubit.dart';
import 'package:metw_go/features/shipment_details/presentation/manager/shipment_details_state.dart';
import 'package:metw_go/features/shipment_details/presentation/widgets/shipment_details_location_card.dart';
import 'package:metw_go/features/shipment_details/presentation/widgets/shipment_packages_card.dart';
import 'package:metw_go/features/shipment_details/presentation/widgets/shipment_path_card.dart';
import 'package:metw_go/features/shipment_details/presentation/widgets/shipment_tracking_stepper.dart';
import 'package:skeletonizer/skeletonizer.dart';


class ShipmentDetails extends StatelessWidget {
  final int shipmentId;

  const ShipmentDetails({super.key, required this.shipmentId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ShipmentDetailsCubit>()..fetchShipmentDetails(shipmentId),
      child: ShipmentDetailsView(shipmentId: shipmentId),
    );
  }
}

class ShipmentDetailsView extends StatefulWidget {
  final int shipmentId;

  const ShipmentDetailsView({super.key, required this.shipmentId});

  @override
  State<ShipmentDetailsView> createState() => _ShipmentDetailsViewState();
}

class _ShipmentDetailsViewState extends State<ShipmentDetailsView> {
  num? _customAcceptedFee;

  static final _dummyShipment = ShipmentDetailsData(
    id: 0,
    requestNumber: "DEL-00000000000",
    requestStatusLabel: "طلب تحت المراجعة",
    pickupAddress: "عنوان استلام الشحنة يظهر هنا أثناء التحميل",
    dropoffAddress: "عنوان تسليم الشحنة يظهر هنا أثناء التحميل",
    sender: ShipmentParty(
      name: "اسم المرسل الافتراضي",
      phone: "01000000000",
      address: "عنوان استلام الشحنة",
    ),
    receiver: ShipmentParty(
      name: "اسم المستلم الافتراضي",
      phone: "01000000000",
      address: "عنوان تسليم الشحنة",
    ),
    packages: [
      ShipmentPackage(
        packageNumber: "000000PKG",
        name: "طرد تجريبي للتحميل",
        weight: 1,
        quantity: 1,
        length: 20,
        width: 20,
        height: 20,
      ),
    ],
    totalParcels: 1,
    totalWeight: 1,
    totalVolume: 0.01,
    fee: 150,
    currency: "EGP",
    tracking: [
      ShipmentTrackingStep(
        label: "طلب تحت المراجعة",
        isCurrent: true,
        isComplete: false,
      ),
      ShipmentTrackingStep(
        label: "طلب مؤكد من العميل",
        isCurrent: false,
        isComplete: false,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(
        title: l10n.shipmentDetails,
        centerTitle: true,
      ),
      body: BlocBuilder<ShipmentDetailsCubit, ShipmentDetailsState>(
        builder: (context, state) {
          final cubit = context.read<ShipmentDetailsCubit>();

          if (state is ShipmentDetailsLoading && cubit.shipment == null) {
            return Skeletonizer(
              enabled: true,
              child: _buildContent(context, _dummyShipment),
            );
          } else if (state is ShipmentDetailsError && cubit.shipment == null) {
            return CustomErrorWidget(
              message: state.message,
              onRetry: () =>
                  cubit.fetchShipmentDetails(widget.shipmentId),
            );
          } else if (cubit.shipment != null) {
            return _buildContent(context, cubit.shipment!);
          } else if (state is ShipmentDetailsLoaded) {
            return _buildContent(context, state.shipment);
          }
          return _buildContent(context, _dummyShipment);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, ShipmentDetailsData shipment) {
    final l10n = AppLocalizations.of(context)!;
    final currency = shipment.currency ?? 'ج.م';
    final feeValue = _customAcceptedFee ??
        shipment.acceptedFee ??
        shipment.estimatedFee ??
        shipment.fee;
    final feeText = feeValue != null ? '$feeValue $currency' : '---';

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Header Card: Request Number & Status ─────────────────────
          _buildHeaderCard(context, shipment),
          SizedBox(height: 16.h),

          // ─── Pickup Point (Sender) ──────────────────────────────────
          ShipmentDetailsLocationCard(
            title: l10n.pickupPoint,
            name: shipment.sender?.name,
            phone: shipment.sender?.phone,
            address: shipment.pickupAddress ?? shipment.sender?.address,
            icon: Icons.storefront_outlined,
            iconColor: MyColors.primaryColor,
            iconBgColor: MyColors.primaryColor.withValues(alpha: 0.1),
            borderColor: MyColors.primaryColor,
          ),

          // ─── Dropoff Point (Receiver) ────────────────────────────────
          ShipmentDetailsLocationCard(
            title: l10n.dropoffPoint,
            name: shipment.receiver?.name,
            phone: shipment.receiver?.phone,
            address: shipment.dropoffAddress ?? shipment.receiver?.address,
            icon: Icons.person_outline,
            iconColor: Theme.of(context).colorScheme.secondary,
            iconBgColor: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
            borderColor: Theme.of(context).colorScheme.secondary,
          ),
          SizedBox(height: 4.h),

          // ─── Packages & Parcels ──────────────────────────────────────
          ShipmentPackagesCard(
            packages: shipment.packages,
            totalParcels: shipment.totalParcels,
            totalWeight: shipment.totalWeight,
            totalVolume: shipment.totalVolume,
          ),

          // ─── Path & Route Info ───────────────────────────────────────
          if (shipment.path != null)
            ShipmentPathCard(
              path: shipment.path,
              responseDeadline: shipment.responseDeadline,
            ),

          // ─── Tracking Stepper ────────────────────────────────────────
          if (shipment.tracking != null && shipment.tracking!.isNotEmpty)
            ShipmentTrackingStepper(tracking: shipment.tracking!),

          // ─── Financial & Fee Card ────────────────────────────────────
          _buildFinancialCard(context, shipment, feeText),
          SizedBox(height: 24.h),

          // ─── Accept Shipment Button ──────────────────────────────────
          _buildAcceptButton(context, shipment),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context, ShipmentDetailsData shipment) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.scrim,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    shipment.requestNumber ?? '',
                    style: AppTextStyle.bold16(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  if (shipment.requestNumber != null) ...[
                    SizedBox(width: 8.w),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: shipment.requestNumber!),
                        );
                        showToast(
                          context,
                          message: 'تم نسخ رقم الطلب',
                          state: ToastStates.success,
                        );
                      },
                      child: Icon(
                        Icons.copy_rounded,
                        size: 18.r,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ],
                ],
              ),
              if (shipment.requestStatusLabel != null)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    shipment.requestStatusLabel!,
                    style: AppTextStyle.medium12(context).copyWith(
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          if (shipment.createdAt != null && shipment.createdAt!.isNotEmpty) ...[
            SizedBox(height: 10.h),
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 14.r,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                SizedBox(width: 6.w),
                Text(
                  'تاريخ الإنشاء: ${_formatDate(shipment.createdAt!)}',
                  style: AppTextStyle.regular12(context).copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFinancialCard(
    BuildContext context,
    ShipmentDetailsData shipment,
    String feeText,
  ) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.scrim,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.payments_outlined,
                color: MyColors.primaryColor,
                size: 22.r,
              ),
              SizedBox(width: 8.w),
              Text(
                'التفاصيل المالية والرسوم',
                style: AppTextStyle.bold14(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          _buildDetailRow(
            context,
            title: l10n.fare,
            value: feeText,
            valueColor: MyColors.primaryColor,
            isBold: true,
            badge: shipment.requiresFeeInput == true
                ? Container(
                    margin: EdgeInsetsDirectional.only(start: 6.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      'قابل للتعديل',
                      style: AppTextStyle.medium12(context).copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : null,
            actionWidget: shipment.requiresFeeInput == true
                ? InkWell(
                    onTap: () => _openFeeModal(shipment, context.read<AppCubit>()),
                    borderRadius: BorderRadius.circular(6.r),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 8.w),
                      child: Icon(
                        Icons.edit_outlined,
                        size: 18.sp,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  )
                : null,
          ),
          if (shipment.offeredFee != null)
            _buildDetailRow(
              context,
              title: 'الرسوم المقترحة',
              value: '${shipment.offeredFee} ${shipment.currency ?? "ج.م"}',
            ),
          if (shipment.feeMode != null)
            _buildDetailRow(
              context,
              title: 'طريقة الحساب',
              value: shipment.feeMode == 'system_calculated'
                  ? 'محسوب تلقائياً من النظام'
                  : shipment.feeMode!,
            ),
        ],
      ),
    );
  }

  Widget _buildAcceptButton(
    BuildContext context,
    ShipmentDetailsData shipment,
  ) {
    final orderId = shipment.id ?? shipment.shipmentRequestId ?? widget.shipmentId;

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, appState) {
        if (appState is AcceptStartOrderSuccessState) {
          showToast(
            context,
            message: appState.response.message ?? 'تم قبول الشحنة بنجاح',
            state: ToastStates.success,
          );
          // Refresh details after acceptance
          context.read<ShipmentDetailsCubit>().fetchShipmentDetails(widget.shipmentId);
        } else if (appState is AcceptStartOrderErrorState) {
          showToast(
            context,
            message: appState.message,
            state: ToastStates.error,
          );
        }
      },
      builder: (context, appState) {
        final appCubit = context.read<AppCubit>();
        final isLoading = appState is AcceptStartOrderLoadingState &&
            appState.orderId == orderId;

        return CustomButton(
          text: 'قبول الشحنة',
          loading: isLoading,
          isMax: !isLoading,
          backgroundColor: MyColors.primaryColor,
          textColor: Theme.of(context).colorScheme.surface,
          onPressed: () {
            if (shipment.requiresFeeInput == true) {
              _openFeeModal(shipment, appCubit);
            } else {
              appCubit.acceptStartOrder(orderId: orderId);
            }
          },
        );
      },
    );
  }

  void _openFeeModal(ShipmentDetailsData shipment, AppCubit appCubit) {
    final orderId = shipment.id ?? shipment.shipmentRequestId ?? widget.shipmentId;
    final initialFee = _customAcceptedFee ??
        shipment.acceptedFee ??
        shipment.estimatedFee ??
        shipment.fee;

    showEditFeeBottomSheet(
      context: context,
      orderId: orderId,
      orderNumber: shipment.requestNumber,
      initialFee: initialFee,
      onConfirm: (acceptedFee) {
        setState(() {
          _customAcceptedFee = acceptedFee;
        });
        appCubit.acceptStartOrder(
          orderId: orderId,
          acceptedFee: acceptedFee,
        );
      },
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required String title,
    required String value,
    Color? valueColor,
    Widget? badge,
    Widget? actionWidget,
    bool isBold = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTextStyle.regular14(context).copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              ?badge,
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: isBold
                    ? AppTextStyle.bold16(context).copyWith(
                        color: valueColor ??
                            Theme.of(context).colorScheme.onSurface,
                      )
                    : AppTextStyle.medium14(context).copyWith(
                        color: valueColor ??
                            Theme.of(context).colorScheme.onSurface,
                      ),
              ),
              ?actionWidget,
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(String isoString) {
    try {
      final dt = DateTime.parse(isoString).toLocal();
      return '${dt.year}/${dt.month.toString().padLeft(2, '0')}/${dt.day.toString().padLeft(2, '0')} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return isoString;
    }
  }
}