import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metw_go/core/cubit/app_cubit.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/order_details/presentation/cubit/order_details_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ConfirmPickupPage extends StatefulWidget {
  final int orderId;
  const ConfirmPickupPage({super.key, required this.orderId});

  @override
  State<ConfirmPickupPage> createState() => _ConfirmPickupPageState();
}

class _ConfirmPickupPageState extends State<ConfirmPickupPage> {
  final TextEditingController _signatureController = TextEditingController();

  bool _conditionVerified = false;
  bool _countVerified = false;
  bool _signatureObtained = false;
  File? _proofPhotoFile;

  @override
  void initState() {
    super.initState();
    context.read<OrderDetailsCubit>().fetchOrderDetails(widget.orderId);
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        setState(() {
          _proofPhotoFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      if (mounted) {
        showToast(
          context,
          message: l10n.unableToCaptureImage,
          state: ToastStates.error,
        );
      }
    }
  }

  void _showImagePickerModal() {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: Text(l10n.takePhotoWithCamera),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: Text(l10n.chooseFromGallery),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocListener<AppCubit, AppState>(
      listener: (context, appState) {
        if (appState is ConfirmPickupOrderSuccessState) {
          showToast(
            context,
            message: appState.response.message ?? l10n.pickupConfirmedSuccess,
            state: ToastStates.success,
          );
          context.pop(true);
        } else if (appState is ConfirmPickupOrderErrorState) {
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

          final orderNumber = order?.orderNumber ?? '#ORD-8821';
          final merchantName =
              order?.sender?.name ??
              order?.ongoingOrder?.contactName ??
              l10n.noorGiftsStore;

          return ScreenWrapper(
            appBar: CustomAppBar(title: l10n.confirmPickup, centerTitle: true),
            body: Skeletonizer(
              enabled: isLoading,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      12.verticalSpace,

                      // 1. Order Info Card
                      _buildOrderCard(context, orderNumber, merchantName, l10n),
                      20.verticalSpace,

                      // 2. Checklist Section ("خطوات الاستلام")
                      Text(
                        l10n.pickupSteps,
                        style: AppTextStyle.bold16(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      10.verticalSpace,
                      _buildChecklistCard(context, l10n),
                      24.verticalSpace,

                      // 3. Merchant Signature Section ("توقيع التاجر")
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.merchantSignature,
                            style: AppTextStyle.bold16(context).copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _signatureController.clear();
                              setState(() {});
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.refresh_rounded,
                                  size: 18.sp,
                                  color: const Color(0xFF6E56CF),
                                ),
                                4.horizontalSpace,
                                Text(
                                  l10n.clearSignature,
                                  style: AppTextStyle.medium14(
                                    context,
                                  ).copyWith(color: const Color(0xFF6E56CF)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      _buildSignatureBox(context, l10n),
                      24.verticalSpace,

                      // 4. Proof Photo Section ("صورة الشحنة")
                      Text(
                        l10n.parcelPhoto,
                        style: AppTextStyle.bold16(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      10.verticalSpace,
                      _buildProofPhotoBox(context, l10n),
                      32.verticalSpace,

                      // 5. Submit Action Button ("تم الاستلام")
                      BlocBuilder<AppCubit, AppState>(
                        builder: (context, appState) {
                          final isActionLoading =
                              appState is ConfirmPickupOrderLoadingState;

                          return Center(
                            child: CustomButton(
                              text: l10n.pickupCompleted,
                              loading: isActionLoading,
                              onPressed: isActionLoading
                                  ? null
                                  : () {
                                      final signatureText = _signatureController
                                          .text
                                          .trim();

                                      if (context.mounted) {
                                        context
                                            .read<AppCubit>()
                                            .confirmPickupOrder(
                                              orderId: widget.orderId,
                                              proofPhoto: _proofPhotoFile,
                                              signature:
                                                  signatureText.isNotEmpty
                                                  ? signatureText
                                                  : null,
                                              packageCountVerified:
                                                  _countVerified ? '1' : '0',
                                              packageConditionVerified:
                                                  _conditionVerified
                                                  ? '1'
                                                  : '0',
                                              merchantSignatureObtained:
                                                  (signatureText.isNotEmpty ||
                                                      _signatureObtained)
                                                  ? '1'
                                                  : '0',
                                            );
                                      }
                                    },
                              isMax: true,
                              backgroundColor: const Color(0xFFFF5E3A),
                              textColor: Colors.white,
                              radius: 30.r,
                            ),
                          );
                        },
                      ),
                      32.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildOrderCard(
    BuildContext context,
    String orderNumber,
    String merchantName,
    AppLocalizations l10n,
  ) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(
            context,
          ).colorScheme.surfaceTint.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3ED),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.local_shipping_outlined,
              color: const Color(0xFFFF5E3A),
              size: 24.sp,
            ),
          ),
          14.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3ED),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    orderNumber,
                    style: AppTextStyle.bold14(
                      context,
                    ).copyWith(color: const Color(0xFFFF5E3A)),
                  ),
                ),
                6.verticalSpace,
                Text(
                  merchantName,
                  style: AppTextStyle.bold16(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                4.verticalSpace,
                Text(
                  l10n.confirmPickupFromMerchant,
                  style: AppTextStyle.regular14(context).copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistCard(BuildContext context, AppLocalizations l10n) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(
            context,
          ).colorScheme.surfaceTint.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        children: [
          _buildChecklistItem(
            context,
            title: l10n.verifyPackage,
            value: _conditionVerified,
            onChanged: (val) =>
                setState(() => _conditionVerified = val ?? false),
          ),
          Divider(
            height: 1,
            color: Theme.of(
              context,
            ).colorScheme.surfaceTint.withValues(alpha: 0.3),
          ),
          _buildChecklistItem(
            context,
            title: l10n.verifyPackageCount,
            value: _countVerified,
            onChanged: (val) => setState(() => _countVerified = val ?? false),
          ),
          Divider(
            height: 1,
            color: Theme.of(
              context,
            ).colorScheme.surfaceTint.withValues(alpha: 0.3),
          ),
          _buildChecklistItem(
            context,
            title: l10n.obtainMerchantSignature,
            value:
                _signatureObtained ||
                _signatureController.text.trim().isNotEmpty,
            onChanged: (val) =>
                setState(() => _signatureObtained = val ?? false),
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistItem(
    BuildContext context, {
    required String title,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyle.medium14(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xFFFF5E3A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignatureBox(BuildContext context, AppLocalizations l10n) {
    return CustomTextField(
      controller: _signatureController,
      hintText: l10n.signHereForPickup,
      onChanged: (_) => setState(() {}),
      prefixIcon: Icon(
        Icons.edit_note_rounded,
        color: const Color(0xFFFF5E3A),
        size: 24.sp,
      ),
      filled: true,
      filledColor: Theme.of(context).colorScheme.surface,
      borderColor: const Color(0xFFFFD5C6),
      radius: 14.r,
    );
  }

  Widget _buildProofPhotoBox(BuildContext context, AppLocalizations l10n) {
    if (_proofPhotoFile != null) {
      return Stack(
        children: [
          Container(
            height: 160.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                image: FileImage(_proofPhotoFile!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 8.h,
            left: 8.w,
            child: InkWell(
              onTap: () => setState(() => _proofPhotoFile = null),
              child: Container(
                padding: EdgeInsets.all(6.r),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, color: Colors.white, size: 18.sp),
              ),
            ),
          ),
        ],
      );
    }

    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(16.r),
        dashPattern: const [6, 4],
        color: const Color(0xFFFFD5C6),
        strokeWidth: 1.5,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: _showImagePickerModal,
        child: Container(
          height: 150.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF3ED),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: const Color(0xFFFF5E3A),
                  size: 28.sp,
                ),
              ),
              10.verticalSpace,
              Text(
                l10n.takePhotoForProofOfPickup,
                style: AppTextStyle.regular14(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
