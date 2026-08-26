import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metw_go/core/cubit/app_cubit.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/image_mixin.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/order_details/presentation/cubit/order_details_cubit.dart';
import 'package:pinput/pinput.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CompleteDeliveryPage extends StatefulWidget {
  final int orderId;
  const CompleteDeliveryPage({super.key, required this.orderId});

  @override
  State<CompleteDeliveryPage> createState() => _CompleteDeliveryPageState();
}

class _CompleteDeliveryPageState extends State<CompleteDeliveryPage>
    with ImageMixin {
  final _SignatureController _signatureController = _SignatureController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _recipientNameController =
      TextEditingController();
  final TextEditingController _deliveryNoteController =
      TextEditingController();
  late TextEditingController _collectedAmountController;

  File? _proofPhotoFile;
  double _requiredAmount = 150.0;
  double _collectedAmount = 150.0;

  @override
  void initState() {
    super.initState();
    _collectedAmountController = TextEditingController(
      text: _collectedAmount.toStringAsFixed(2),
    );
    context.read<OrderDetailsCubit>().fetchOrderDetails(widget.orderId);
  }

  @override
  void dispose() {
    _signatureController.dispose();
    _otpController.dispose();
    _recipientNameController.dispose();
    _deliveryNoteController.dispose();
    _collectedAmountController.dispose();
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
        final compressedFile = await compress(
          targetImage: File(pickedFile.path),
        );
        setState(() {
          _proofPhotoFile = compressedFile;
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
        if (appState is CompleteDeliveryOrderSuccessState) {
          showToast(
            context,
            message: appState.response.message ?? l10n.deliveryConfirmedSuccess,
            state: ToastStates.success,
          );
          Navigator.of(context).pop();
        } else if (appState is CompleteDeliveryOrderErrorState) {
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

          final addressText =
              ongoing?.locationAddress ??
              ongoing?.dropoffAddress ??
              order?.dropoffAddress ??
              l10n.defaultDeliveryAddress;

          final estimatedFee = order?.estimatedFee ?? 150.0;
          if (estimatedFee > 0 && _requiredAmount != estimatedFee) {
            _requiredAmount = estimatedFee;
            _collectedAmount = estimatedFee;
            _collectedAmountController.text = estimatedFee.toStringAsFixed(2);
          }

          final remainingAmount = (_requiredAmount - _collectedAmount).clamp(
            0.0,
            double.infinity,
          );

          return ScreenWrapper(
            appBar: CustomAppBar(
              title: l10n.confirmDelivery,
              centerTitle: true,
            ),
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

                      // 1. Delivery Address Card
                      _buildAddressCard(context, addressText, l10n),
                      20.verticalSpace,

                      // 2. Customer Signature Section ("توقيع العميل")
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.customerSignature,
                            style: AppTextStyle.bold16(context).copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          InkWell(
                            onTap: () => _signatureController.clear(),
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

                      // 3. Proof Photo Section ("صورة الشحنة")
                      Text(
                        l10n.parcelPhoto,
                        style: AppTextStyle.bold16(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      10.verticalSpace,
                      _buildProofPhotoBox(context, l10n),
                      24.verticalSpace,

                      // 4. Cash Payment Section ("الدفع نقداً")
                      _buildCashPaymentCard(context, remainingAmount, l10n),
                      24.verticalSpace,

                      // 5. OTP Verification Section ("رمز التحقق")
                      _buildOtpSection(context, l10n),
                      24.verticalSpace,

                      // 6. Recipient Name & Delivery Note (Optional)
                      _buildOptionalFields(context, l10n),
                      32.verticalSpace,

                      // 7. Submit Action Button ("تأكيد التسليم")
                      BlocBuilder<AppCubit, AppState>(
                        builder: (context, appState) {
                          final isActionLoading =
                              appState is CompleteDeliveryOrderLoadingState;

                          return CustomButton(
                            text: l10n.confirmDelivery,
                            loading: isActionLoading,
                            onPressed: isActionLoading
                                ? null
                                : () async {
                                    final signatureBase64 =
                                        await _signatureController
                                            .exportBase64Png();

                                    if (context.mounted) {
                                      context
                                          .read<AppCubit>()
                                          .completeDeliveryOrder(
                                            orderId: widget.orderId,
                                            proofPhoto: _proofPhotoFile,
                                            signature: signatureBase64,
                                            recipientOtp: _otpController.text
                                                .trim(),
                                            collectedAmount:
                                                _collectedAmountController
                                                    .text
                                                    .trim(),
                                            deliveryNote:
                                                _deliveryNoteController.text
                                                    .trim(),
                                            recipientName:
                                                _recipientNameController.text
                                                    .trim(),
                                          );
                                    }
                                  },
                            isMax: true,
                            backgroundColor: const Color(0xFFFF5E3A),
                            textColor: Colors.white,
                            radius: 30.r,
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

  Widget _buildAddressCard(
    BuildContext context,
    String addressText,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.deliveryAddress,
                  style: AppTextStyle.regular14(context).copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
                6.verticalSpace,
                Text(
                  addressText,
                  style: AppTextStyle.bold16(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
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
      ),
    );
  }

  Widget _buildSignatureBox(BuildContext context, AppLocalizations l10n) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(16.r),
        dashPattern: const [6, 4],
        color: const Color(0xFFFFD5C6),
        strokeWidth: 1.5,
      ),
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: _SignaturePad(
            controller: _signatureController,
            hintText: l10n.signHereForDelivery,
          ),
        ),
      ),
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
                l10n.takePhotoAtDoor,
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

  Widget _buildCashPaymentCard(
    BuildContext context,
    double remainingAmount,
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
      child: Column(
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.cashPayment,
                style: AppTextStyle.bold16(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0ECF9),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  l10n.collectionRequired,
                  style: AppTextStyle.medium12(
                    context,
                  ).copyWith(color: const Color(0xFF6E56CF)),
                ),
              ),
            ],
          ),
          16.verticalSpace,

          // Row 1: المبلغ المطلوب
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.requiredAmount,
                style: AppTextStyle.regular14(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              Text(
                '${_requiredAmount.toStringAsFixed(2)} ${l10n.egp}',
                style: AppTextStyle.bold16(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
          ),
          12.verticalSpace,

          // Row 2: المبلغ المستلم
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.collectedAmount,
                style: AppTextStyle.regular14(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              SizedBox(
                width: 110.w,
                height: 40.h,
                child: TextFormField(
                  controller: _collectedAmountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bold14(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    suffixText: l10n.egp,
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (val) {
                    final parsed = double.tryParse(val.trim()) ?? 0.0;
                    setState(() {
                      _collectedAmount = parsed;
                    });
                  },
                ),
              ),
            ],
          ),
          12.verticalSpace,

          // Row 3: المبلغ المتبقي
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.remainingAmount,
                style: AppTextStyle.regular14(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              Text(
                '${remainingAmount.toStringAsFixed(2)} ${l10n.egp}',
                style: AppTextStyle.bold14(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOtpSection(BuildContext context, AppLocalizations l10n) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: AppTextStyle.bold20(
        context,
      ).copyWith(color: Theme.of(context).colorScheme.onSurface),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(
            context,
          ).colorScheme.surfaceTint.withValues(alpha: 0.4),
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: const Color(0xFFFF5E3A), width: 1.5),
      ),
    );

    return Column(
      children: [
        Center(
          child: Text(
            l10n.otpVerification,
            style: AppTextStyle.bold16(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
        6.verticalSpace,
        Center(
          child: Text(
            l10n.enter4DigitOtp,
            style: AppTextStyle.regular14(context).copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        16.verticalSpace,
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            controller: _otpController,
            length: 4,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            obscureText: false,
          ),
        ),
      ],
    );
  }

  Widget _buildOptionalFields(BuildContext context, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.recipientInfoAndNotes,
          style: AppTextStyle.bold16(
            context,
          ).copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        10.verticalSpace,
        TextFormField(
          controller: _recipientNameController,
          decoration: InputDecoration(
            hintText: l10n.recipientNameOptional,
            prefixIcon: const Icon(Icons.person_outline),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.surfaceTint.withValues(alpha: 0.4),
              ),
            ),
          ),
        ),
        12.verticalSpace,
        TextFormField(
          controller: _deliveryNoteController,
          maxLines: 2,
          decoration: InputDecoration(
            hintText: l10n.deliveryNotesOptional,
            prefixIcon: const Icon(Icons.note_alt_outlined),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.surfaceTint.withValues(alpha: 0.4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Custom Built-in Signature Pad & Controller ───────────────────────────

class _SignaturePad extends StatefulWidget {
  final _SignatureController controller;
  final String hintText;

  const _SignaturePad({required this.controller, required this.hintText});

  @override
  State<_SignaturePad> createState() => _SignaturePadState();
}

class _SignaturePadState extends State<_SignaturePad> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, child) {
        final isEmpty = widget.controller.points.isEmpty;
        return GestureDetector(
          onPanStart: (details) {
            final renderBox = context.findRenderObject() as RenderBox;
            final localPosition = renderBox.globalToLocal(
              details.globalPosition,
            );
            widget.controller.addPoint(localPosition);
          },
          onPanUpdate: (details) {
            final renderBox = context.findRenderObject() as RenderBox;
            final localPosition = renderBox.globalToLocal(
              details.globalPosition,
            );
            widget.controller.addPoint(localPosition);
          },
          onPanEnd: (details) {
            widget.controller.addPoint(null);
          },
          child: Stack(
            children: [
              CustomPaint(
                painter: _SignaturePainter(widget.controller.points),
                size: Size.infinite,
              ),
              if (isEmpty)
                Center(
                  child: Text(
                    widget.hintText,
                    style: AppTextStyle.regular14(context).copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _SignatureController extends ChangeNotifier {
  final List<Offset?> points = [];

  void addPoint(Offset? point) {
    points.add(point);
    notifyListeners();
  }

  void clear() {
    points.clear();
    notifyListeners();
  }

  Future<String?> exportBase64Png() async {
    if (points.isEmpty) return null;
    try {
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      final paint = Paint()
        ..color = Colors.black
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 3.0;

      for (int i = 0; i < points.length - 1; i++) {
        if (points[i] != null && points[i + 1] != null) {
          canvas.drawLine(points[i]!, points[i + 1]!, paint);
        }
      }

      final picture = recorder.endRecording();
      final img = await picture.toImage(300, 150);
      final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return null;
      final buffer = byteData.buffer.asUint8List();
      return 'data:image/png;base64,${base64Encode(buffer)}';
    } catch (e) {
      return null;
    }
  }
}

class _SignaturePainter extends CustomPainter {
  final List<Offset?> points;

  _SignaturePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF222222)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SignaturePainter oldDelegate) => true;
}
