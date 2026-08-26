import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/cubit/app_cubit.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/order_details/data/models/order_details_response.dart';
import 'package:metw_go/features/order_details/presentation/cubit/order_details_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

class OnWayOrderPage extends StatefulWidget {
  final int orderId;
  const OnWayOrderPage({super.key, required this.orderId});

  @override
  State<OnWayOrderPage> createState() => _OnWayOrderPageState();
}

class _OnWayOrderPageState extends State<OnWayOrderPage> {
  @override
  void initState() {
    super.initState();
    context.read<OrderDetailsCubit>().fetchOrderDetails(widget.orderId);
  }

  Future<void> _launchUrlString(BuildContext context, String? urlString) async {
    if (urlString == null || urlString.isEmpty) return;
    try {
      final uri = Uri.parse(urlString);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          showToast(
            context,
            message: 'تعذر إجراء الاتصال',
            state: ToastStates.error,
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        showToast(
          context,
          message: 'تعذر إجراء الاتصال',
          state: ToastStates.error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listener: (context, appState) {
        if (appState is ArriveAtDropoffOrderSuccessState) {
          showToast(
            context,
            message: appState.response.message ?? 'تم الوصول للموقع بنجاح',
            state: ToastStates.success,
          );
          context.read<OrderDetailsCubit>().fetchOrderDetails(widget.orderId);
        } else if (appState is ArriveAtPickupOrderSuccessState) {
          showToast(
            context,
            message: appState.response.message ?? 'تم الوصول للموقع بنجاح',
            state: ToastStates.success,
          );
          context.read<OrderDetailsCubit>().fetchOrderDetails(widget.orderId);
        } else if (appState is ArriveAtDropoffOrderErrorState) {
          showToast(
            context,
            message: appState.message,
            state: ToastStates.error,
          );
        } else if (appState is ArriveAtPickupOrderErrorState) {
          showToast(
            context,
            message: appState.message,
            state: ToastStates.error,
          );
        }
      },
      child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
          final cubit = context.read<OrderDetailsCubit>();
          final isLoading =
              state is OrderDetailsLoading && cubit.orderDetails == null;
          final order = cubit.orderDetails;
          final ongoing = order?.ongoingOrder;

          return ScreenWrapper(
            body: Skeletonizer(
              enabled: isLoading,
              child: Column(
                children: [
                  // Top AppBar Header with Image background & Floating Card
                  _buildTopHeader(context, ongoing, order),

                  // Scrollable Main Content Card
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      transform: Matrix4.translationValues(0, -20.h, 0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24.r),
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.w,
                          vertical: 20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 1. Location Header Status
                            _buildLocationStatusHeader(context, ongoing, order),
                            20.verticalSpace,

                            // 2. Parcel Details Card ("تفاصيل الشحنة")
                            _buildParcelDetailsCard(context, ongoing, order),
                            16.verticalSpace,

                            // 3. Arrival Hint Banner
                            _buildArrivalHintBanner(context, ongoing),
                            24.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom Fixed Action Bar (Call button + Primary action button)
                  _buildBottomActionBar(context, ongoing, widget.orderId),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTopHeader(
    BuildContext context,
    dynamic ongoing,
    OrderDetails? order,
  ) {
    final headerNote =
        ongoing?.headerNote ?? 'تواصل مع العميل للحصول على الموقع';
    final contactName =
        ongoing?.contactName ??
        order?.receiver?.name ??
        order?.sender?.name ??
        'مخبز لافندر الفرنسي';
    final contactPhone =
        ongoing?.contactPhone ??
        order?.receiver?.phone ??
        order?.sender?.phone ??
        '';

    return SizedBox(
      height: 260.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background Header Image
          Image.asset(
            AppImages.onWayOrderAppBarImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 230.h,
          ),

          // Floating Back Button
          Positioned(
            top: MediaQuery.of(context).padding.top + 8.h,
            right: 16.w,
            child: InkWell(
              borderRadius: BorderRadius.circular(100.r),
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          // Floating White Card Over Image
          Positioned(
            bottom: 0,
            left: 16.w,
            right: 16.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // WhatsApp Button (Left side in RTL)
                  InkWell(
                    borderRadius: BorderRadius.circular(100.r),
                    onTap: () {
                      final phone = contactPhone.replaceAll('+', '').trim();
                      _launchUrlString(context, 'https://wa.me/$phone');
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: const BoxDecoration(
                        color: Color(0xFF25D366),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3325D366),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.chat_bubble_outline_rounded,
                        color: Colors.white,
                        size: 22.sp,
                      ),
                    ),
                  ),
                  14.horizontalSpace,

                  // Subtitle & Store Name (Right side in RTL)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          headerNote,
                          style: AppTextStyle.medium14(
                            context,
                          ).copyWith(color: const Color(0xFFFF5E3A)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        4.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                contactName,
                                style: AppTextStyle.bold16(context).copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            8.horizontalSpace,
                            Container(
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0ECF9),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Icon(
                                Icons.store_mall_directory_rounded,
                                color: const Color(0xFF6E56CF),
                                size: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationStatusHeader(
    BuildContext context,
    dynamic ongoing,
    OrderDetails? order,
  ) {
    final locationTitle =
        ongoing?.locationTitle ??
        ongoing?.dropoffTitle ??
        ongoing?.pickupTitle ??
        'جاري الوصول لموقع الاستلام';
    final locationAddress =
        ongoing?.locationAddress ??
        ongoing?.dropoffAddress ??
        order?.dropoffAddress ??
        order?.pickupAddress ??
        'حي النخيل، شارع التخصصي';
    final locationCountry =
        ongoing?.locationCountry ??
        ongoing?.dropoffCountry ??
        'الرياض، المملكة العربية السعودية';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 8.r,
                    height: 8.r,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFF5E3A),
                    ),
                  ),
                  6.horizontalSpace,
                  Text(
                    locationTitle,
                    style: AppTextStyle.medium14(
                      context,
                    ).copyWith(color: const Color(0xFFFF5E3A)),
                  ),
                ],
              ),
              6.verticalSpace,
              Text(
                locationAddress,
                style: AppTextStyle.bold18(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              if (locationCountry.isNotEmpty) ...[
                4.verticalSpace,
                Text(
                  locationCountry,
                  style: AppTextStyle.regular14(context).copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ],
          ),
        ),
        12.horizontalSpace,
        Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3ED),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Icon(
            Icons.location_on_outlined,
            color: const Color(0xFFFF5E3A),
            size: 24.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildParcelDetailsCard(
    BuildContext context,
    dynamic ongoing,
    OrderDetails? order,
  ) {
    final detailsTitle = ongoing?.detailsTitle ?? 'تفاصيل الشحنة';
    final packageDescription =
        ongoing?.packageDescription ??
        order?.parcels?.firstOrNull?.description ??
        'علبة معجنات مشكلة + عصير';
    final weightLabel =
        ongoing?.weightLabel ??
        '${order?.parcels?.firstOrNull?.weight ?? 5} كجم تقريباً';
    final paymentMethodLabel =
        ongoing?.paymentMethodLabel ?? 'الدفع عند الاستلام (كاش)';
    final orderTotalLabel =
        ongoing?.orderTotalLabel ?? '${order?.estimatedFee ?? 145.00} ج.م';
    final deliveryFeeLabel =
        ongoing?.deliveryFeeLabel ?? '${order?.estimatedFee ?? 100.00} ج.م';

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: Theme.of(
            context,
          ).colorScheme.surfaceTint.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: [
              Icon(
                Icons.inventory_2_outlined,
                color: const Color(0xFFFF5E3A),
                size: 20.sp,
              ),
              8.horizontalSpace,
              Text(
                detailsTitle,
                style: AppTextStyle.bold16(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
          ),
          16.verticalSpace,

          // Row 1: محتوى الطلب
          _buildDetailRow(
            context,
            label: 'محتوى الطلب',
            value: packageDescription,
          ),
          12.verticalSpace,

          // Row 2: الوزن التقريبي
          _buildDetailRow(context, label: 'الوزن التقريبي', value: weightLabel),
          12.verticalSpace,

          // Row 3: طريقة الدفع
          _buildDetailRow(
            context,
            label: 'طريقة الدفع',
            value: paymentMethodLabel,
            valueColor: const Color(0xFFFF5E3A),
            icon: Icon(
              Icons.payments_outlined,
              size: 18.sp,
              color: const Color(0xFFFF5E3A),
            ),
          ),
          12.verticalSpace,

          // Row 4: إجمالي قيمة الطلب
          _buildDetailRow(
            context,
            label: 'إجمالي قيمة الطلب',
            value: orderTotalLabel,
          ),
          12.verticalSpace,

          // Dashed Divider
          const _DashedDivider(),
          12.verticalSpace,

          // Row 5: الاجرة
          _buildDetailRow(
            context,
            label: 'الاجرة',
            value: deliveryFeeLabel,
            isBold: true,
            valueColor: const Color(0xFFFF5E3A),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required String label,
    required String value,
    Color? valueColor,
    Widget? icon,
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.regular14(context).copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        Row(
          children: [
            if (icon != null) ...[icon, 6.horizontalSpace],
            Text(
              value,
              style: isBold
                  ? AppTextStyle.bold16(context).copyWith(
                      color:
                          valueColor ?? Theme.of(context).colorScheme.onSurface,
                    )
                  : AppTextStyle.medium14(context).copyWith(
                      color:
                          valueColor ?? Theme.of(context).colorScheme.onSurface,
                    ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildArrivalHintBanner(BuildContext context, dynamic ongoing) {
    final hint = ongoing?.arrivalHint ?? 'يرجى التواصل قبل الوصول بخمس دقائق';
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F5FF),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xFFE9D7FE)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: const Color(0xFF7F56D9),
            size: 20.sp,
          ),
          10.horizontalSpace,
          Expanded(
            child: Text(
              hint,
              style: AppTextStyle.medium14(
                context,
              ).copyWith(color: const Color(0xFF7F56D9)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionBar(
    BuildContext context,
    dynamic ongoing,
    int orderId,
  ) {
    final contactPhone = ongoing?.contactPhone ?? '';
    final primaryActionLabel =
        ongoing?.primaryActionLabel ?? 'تم الوصول للموقع';
    final mode = ongoing?.mode ?? 'dropoff';

    return Container(
      padding: EdgeInsets.only(
        left: 18.w,
        right: 18.w,
        top: 14.h,
        bottom: MediaQuery.of(context).padding.bottom + 14.h,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, appState) {
          final isActionLoading =
              appState is ArriveAtDropoffOrderLoadingState ||
              appState is ArriveAtPickupOrderLoadingState;

          return Row(
            children: [
              // Phone Call Button (Left side in RTL)
              InkWell(
                borderRadius: BorderRadius.circular(16.r),
                onTap: () {
                  final phone = contactPhone.replaceAll('+', '').trim();
                  _launchUrlString(context, 'tel:$phone');
                },
                child: Container(
                  padding: EdgeInsets.all(14.r),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Icon(
                    Icons.phone_outlined,
                    color: const Color(0xFF222222),
                    size: 22.sp,
                  ),
                ),
              ),
              12.horizontalSpace,

              // Main Primary Action Button ("تم الوصول للموقع")
              Expanded(
                child: CustomButton(
                  text: primaryActionLabel,
                  loading: isActionLoading,
                  onPressed: () {
                    if (mode == 'dropoff') {
                      context.read<AppCubit>().arriveAtDropoffOrder(
                        orderId: orderId,
                      );
                    } else {
                      context.read<AppCubit>().arriveAtPickupOrder(
                        orderId: orderId,
                      );
                    }
                  },
                  isMax: true,
                  backgroundColor: const Color(0xFFFF5E3A),
                  textColor: Colors.white,
                  radius: 30.r,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.maxWidth;
        const dashWidth = 5.0;
        const dashHeight = 1.0;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.3),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
