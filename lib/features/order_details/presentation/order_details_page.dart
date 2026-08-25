import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_error_widget.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/features/order_details/presentation/cubit/order_details_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/models/order_details_response.dart';
import '../data/models/sender.dart';
import '../data/models/receiver.dart';
import '../data/models/courier.dart';
import '../data/models/parcel.dart';
import '../data/models/lifecycle.dart';

class OrderDetailsPage extends StatefulWidget {
  final int orderId;
  const OrderDetailsPage({super.key, required this.orderId});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late final OrderDetailsCubit _cubit;

  static final _dummyOrder = OrderDetails(
    id: 0,
    orderNumber: "F-ORD-00000000",
    priority: "normal",
    distanceKm: 0.0,
    pickupAddress: "عنوان استلام الطلب يظهر هنا أثناء التحميل",
    dropoffAddress: "عنوان تسليم الطلب يظهر هنا أثناء التحميل",
    estimatedFee: 100.0,
    createdAt: "",
    canStart: true,
    courier: Courier(
      id: 0,
      accountNumber: "0",
      name: "اسم المندوب",
      phone: "01000000000",
      rating: 5.0,
      availabilityStatus: "available",
      isProfileComplete: true,
    ),
    sender: Sender(name: "اسم المرسل", phone: "01000000000"),
    receiver: Receiver(name: "اسم المستلم", phone: "01000000000"),
    parcels: [
      Parcel(
        description: "وصف الشحنة الافتراضي للتحميل",
        weight: 5.0,
        quantity: 1,
      ),
    ],
    lifecycle: Lifecycle(canStart: true),
  );

  @override
  void initState() {
    super.initState();
    _cubit = context.read<OrderDetailsCubit>();
    _cubit.fetchOrderDetails(widget.orderId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(title: l10n.orders, centerTitle: true),
      body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
          final cubit = context.read<OrderDetailsCubit>();
          if (state is OrderDetailsLoading && cubit.orderDetails == null) {
            return Skeletonizer(
              enabled: true,
              child: _buildContent(context, l10n, _dummyOrder),
            );
          } else if (state is OrderDetailsError && cubit.orderDetails == null) {
            return CustomErrorWidget(
              message: state.message,
              onRetry: () => _cubit.fetchOrderDetails(widget.orderId),
            );
          } else if (cubit.orderDetails != null) {
            return _buildContent(context, l10n, cubit.orderDetails!);
          } else if (state is OrderDetailsLoaded) {
            return _buildContent(context, l10n, state.data ?? _dummyOrder);
          }
          return _buildContent(context, l10n, _dummyOrder);
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    AppLocalizations l10n,
    OrderDetails order,
  ) {
    final parcelsList = order.parcels ?? [];
    final parcelContent = parcelsList.isNotEmpty
        ? parcelsList
              .map((p) => p.description)
              .where((d) => d != null && d.isNotEmpty)
              .join(' + ')
        : '---';
    final weightSum = parcelsList.fold<double>(
      0,
      (sum, p) => sum + (p.weight ?? 0),
    );
    final parcelWeight = weightSum > 0 ? '$weightSum كجم تقريباً' : '---';
    final feeText = order.estimatedFee != null
        ? '${order.estimatedFee} ج.م'
        : '---';
    final pickupText = [
      order.pickupAddress,
      order.sender?.name,
    ].where((s) => s != null && s.isNotEmpty).join('\n');
    final dropoffText = [
      order.dropoffAddress,
      order.receiver?.name,
    ].where((s) => s != null && s.isNotEmpty).join('\n');

    return SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
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
                if (order.distanceKm != null)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.scrim,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: MyColors.primaryColor,
                          size: 20.r,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '${order.distanceKm} كم',
                          style: AppTextStyle.medium14(context).copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          _LocationCard(
            title: l10n.pickupPoint,
            subtitle: pickupText.isNotEmpty ? pickupText : '---',
            icon: Icons.storefront_outlined,
            iconColor: MyColors.primaryColor,
            iconBgColor: MyColors.primaryColor.withValues(alpha: 0.1),
            borderColor: MyColors.primaryColor,
            phoneNumber: order.sender?.phone,
          ),
          _LocationCard(
            title: l10n.dropoffPoint,
            subtitle: dropoffText.isNotEmpty ? dropoffText : '---',
            icon: Icons.person_outline,
            iconColor: Theme.of(context).colorScheme.secondary,
            iconBgColor: Theme.of(
              context,
            ).colorScheme.secondary.withValues(alpha: 0.1),
            borderColor: Theme.of(context).colorScheme.secondary,
            phoneNumber: order.receiver?.phone,
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Theme.of(context).colorScheme.scrim),
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
                      style: AppTextStyle.medium16(
                        context,
                      ).copyWith(color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                _buildDetailRow(
                  context,
                  title: l10n.orderContent,
                  value: parcelContent,
                ),
                _buildDetailRow(
                  context,
                  title: l10n.approximateWeight,
                  value: parcelWeight,
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
                  value: feeText,
                ),
                SizedBox(height: 16.h),
                DashedDivider(color: Theme.of(context).colorScheme.surfaceTint),
                SizedBox(height: 16.h),
                _buildDetailRow(
                  context,
                  title: l10n.fare,
                  value: feeText,
                  valueColor: MyColors.primaryColor,
                  isBold: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
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
                  color: Theme.of(context).colorScheme.tertiary,
                  size: 24.r,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    l10n.receiptConfirmationNote,
                    style: AppTextStyle.regular14(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          CustomButton(
            text: l10n.acceptOrder,
            onPressed: () {},
            isMax: true,
            backgroundColor: MyColors.primaryColor,
            textColor: Theme.of(context).colorScheme.surface,
          ),
          SizedBox(height: 16.h),
          TextButton(
            onPressed: () => _showRejectBottomSheet(context, widget.orderId),
            child: Text(
              l10n.rejectOrder,
              style: AppTextStyle.medium16(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  void _showRejectBottomSheet(BuildContext context, int orderId) {
    final cubit = context.read<OrderDetailsCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => BlocProvider.value(
        value: cubit,
        child: _RejectBottomSheet(orderId: orderId),
      ),
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
            ).copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
          Row(
            children: [
              if (icon != null) ...[icon, SizedBox(width: 8.w)],
              Text(
                value,
                style: isBold
                    ? AppTextStyle.bold16(context).copyWith(
                        color:
                            valueColor ??
                            Theme.of(context).colorScheme.onSurface,
                      )
                    : AppTextStyle.medium14(context).copyWith(
                        color:
                            valueColor ??
                            Theme.of(context).colorScheme.onSurface,
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
  final String? phoneNumber;

  const _LocationCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.borderColor,
    this.phoneNumber,
  });

  void _launchPhone(BuildContext context) async {
    final number = phoneNumber;
    if (number != null && await canLaunchUrl(Uri.parse('tel:$number'))) {
      await launchUrl(Uri.parse('tel:$number'));
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot launch phone dialer')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Theme.of(context).colorScheme.scrim),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.regular12(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: AppTextStyle.medium14(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
                ],
              ),
            ),
            _buildActionButton(Icons.chat_bubble_outline, MyColors.green),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: () => _launchPhone(context),
              child: _buildActionButton(Icons.phone_outlined, MyColors.red),
            ),
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
        color: color.withValues(alpha: 0.1),
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

class _RejectBottomSheet extends StatefulWidget {
  final int orderId;
  const _RejectBottomSheet({required this.orderId});

  @override
  State<_RejectBottomSheet> createState() => _RejectBottomSheetState();
}

class _RejectBottomSheetState extends State<_RejectBottomSheet> {
  int? _selectedReasonId;
  final TextEditingController _customReasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<OrderDetailsCubit>();
    if (cubit.returnReasons.isEmpty) {
      cubit.fetchReturnReasons();
    }
  }

  @override
  void dispose() {
    _customReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
      listener: (context, state) {
        if (state is RejectOrderSuccess) {
          showToast(context, message: state.message, state: ToastStates.success);
          Navigator.of(context).pop(); // Close bottom sheet
          Navigator.of(context).pop(); // Exit order details page after rejection
        } else if (state is RejectOrderFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        } else if (state is ReturnReasonsError) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<OrderDetailsCubit>();
        final reasons = cubit.returnReasons;
        final isReasonsLoading =
            state is ReturnReasonsLoading ||
            (reasons.isEmpty && state is! ReturnReasonsError);
        final isSubmitting = state is RejectOrderLoading;

        return Directionality(
          textDirection: TextDirection.rtl,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 12.h,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Drag Handle
                  Container(
                    width: 48.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceTint,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  SizedBox(height: 18.h),

                  // Title
                  Text(
                    l10n.rejectionReason,
                    style: AppTextStyle.bold20(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6.h),

                  // Subtitle
                  Text(
                    l10n.selectRejectionReason,
                    style: AppTextStyle.regular14(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 18.h),

                  // Scrollable Content Area
                  Flexible(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isReasonsLoading)
                            Skeletonizer(
                              enabled: true,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                  4,
                                  (index) => Container(
                                    margin: EdgeInsets.only(bottom: 12.h),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 14.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.surface,
                                      borderRadius: BorderRadius.circular(14.r),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 24.r,
                                          height: 24.r,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 14.w),
                                        Expanded(
                                          child: Text(
                                            'سبب الرفض الافتراضي أثناء التحميل',
                                            style: AppTextStyle.medium14(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else ...[
                            // Reason Options from API
                            ...List.generate(reasons.length, (index) {
                              final reason = reasons[index];
                              final isSelected = _selectedReasonId == reason.id;
                              return GestureDetector(
                                onTap: () =>
                                    setState(() => _selectedReasonId = reason.id),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeInOut,
                                  margin: EdgeInsets.only(bottom: 12.h),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 14.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(14.r),
                                    border: Border.all(
                                      color: isSelected
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withValues(alpha: 0.4)
                                          : Theme.of(context).colorScheme.surfaceTint,
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
                                              ? Theme.of(context).colorScheme.secondary
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: isSelected
                                                ? Theme.of(context).colorScheme.secondary
                                                : Theme.of(context).colorScheme.surfaceTint,
                                            width: 2,
                                          ),
                                        ),
                                        child: isSelected
                                            ? Icon(
                                                Icons.circle,
                                                size: 10.r,
                                                color: Theme.of(context).colorScheme.surface,
                                              )
                                            : null,
                                      ),
                                      SizedBox(width: 14.w),

                                      // Label
                                      Expanded(
                                        child: Text(
                                          reason.reasonText ?? '',
                                          style: AppTextStyle.medium14(context).copyWith(
                                            color: Theme.of(context).colorScheme.onSurface,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),

                            SizedBox(height: 8.h),

                            // Custom Reason Form Field
                            TextFormField(
                              controller: _customReasonController,
                              maxLines: 2,
                              decoration: InputDecoration(
                                hintText: 'إضافة سبب مخصص (اختياري)...',
                                hintStyle: AppTextStyle.regular14(context).copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                                filled: true,
                                fillColor: Theme.of(context).colorScheme.surface,
                                contentPadding: EdgeInsets.all(12.r),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.surfaceTint,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.surfaceTint,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Confirm button
                  CustomButton(
                    text: l10n.confirmRejection,
                    loading: isSubmitting,
                    onPressed: isSubmitting
                        ? null
                        : () {
                            if (_selectedReasonId == null) {
                              showToast(
                                context,
                                message: 'يرجى تحديد سبب الرفض أولاً',
                                state: ToastStates.error,
                              );
                              return;
                            }
                            cubit.rejectOrder(
                              orderId: widget.orderId,
                              reasonId: _selectedReasonId!,
                              customReason: _customReasonController.text.trim(),
                            );
                          },
                    isMax: true,
                    backgroundColor: MyColors.primaryColor,
                    textColor: Theme.of(context).colorScheme.surface,
                  ),
                  SizedBox(height: 8.h),

                  // Cancel text
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      l10n.cancel,
                      style: AppTextStyle.medium16(context).copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
