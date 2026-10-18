import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';

void showEditFeeBottomSheet({
  required BuildContext context,
  required int orderId,
  String? orderNumber,
  num? initialFee,
  required void Function(num acceptedFee) onConfirm,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => EditFeeBottomSheet(
      orderId: orderId,
      orderNumber: orderNumber,
      initialFee: initialFee,
      onConfirm: onConfirm,
    ),
  );
}

class EditFeeBottomSheet extends StatefulWidget {
  final int orderId;
  final String? orderNumber;
  final num? initialFee;
  final void Function(num acceptedFee) onConfirm;

  const EditFeeBottomSheet({
    super.key,
    required this.orderId,
    this.orderNumber,
    this.initialFee,
    required this.onConfirm,
  });

  @override
  State<EditFeeBottomSheet> createState() => _EditFeeBottomSheetState();
}

class _EditFeeBottomSheetState extends State<EditFeeBottomSheet> {
  late final TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final feeVal = widget.initialFee != null
        ? (widget.initialFee! % 1 == 0
            ? widget.initialFee!.toInt().toString()
            : widget.initialFee!.toString())
        : '';
    _controller = TextEditingController(text: feeVal);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _adjustFee(num delta) {
    final current = num.tryParse(_controller.text.trim()) ?? (widget.initialFee ?? 0);
    final updated = (current + delta).clamp(1, 100000);
    setState(() {
      _controller.text = updated % 1 == 0
          ? updated.toInt().toString()
          : updated.toString();
    });
  }

  void _submit() {
    final text = _controller.text.trim();
    final fee = num.tryParse(text);
    if (fee == null || fee <= 0) {
      showToast(
        context,
        message: 'يرجى إدخال سعر توصيل صالح',
        state: ToastStates.error,
      );
      return;
    }
    Navigator.of(context).pop();
    widget.onConfirm(fee);
  }

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  18.verticalSpace,

                  // Badge Order Number
                  if (widget.orderNumber != null && widget.orderNumber!.isNotEmpty) ...[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        widget.orderNumber!,
                        style: AppTextStyle.medium14(context).copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    12.verticalSpace,
                  ],

                  // Title
                  Text(
                    'تحديد سعر توصيل الطلب',
                    style: AppTextStyle.bold20(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  6.verticalSpace,

                  // Subtitle
                  Text(
                    'يتطلب هذا الطلب إدخال أو تعديل سعر التوصيل المتفق عليه لبدء التنفيذ.',
                    style: AppTextStyle.regular14(context).copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  20.verticalSpace,

                  // Input Box
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.03),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.surfaceTint,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'أجرة التوصيل المقترحة:',
                              style: AppTextStyle.medium14(context).copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            ),
                            Text(
                              '${widget.initialFee ?? 0} ج.م',
                              style: AppTextStyle.bold16(context).copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        16.verticalSpace,
                        TextFormField(
                          controller: _controller,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bold20(context).copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 24.sp,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                          ],
                          decoration: InputDecoration(
                            hintText: '0.0',
                            suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Center(
                                widthFactor: 1,
                                child: Text(
                                  'ج.م',
                                  style: AppTextStyle.bold16(context).copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.surface,
                            contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
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
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                        12.verticalSpace,
                        // Quick Adjustment Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildQuickChip('-10', () => _adjustFee(-10)),
                            _buildQuickChip('-5', () => _adjustFee(-5)),
                            _buildQuickChip('+5', () => _adjustFee(5)),
                            _buildQuickChip('+10', () => _adjustFee(10)),
                            _buildQuickChip('+20', () => _adjustFee(20)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  24.verticalSpace,

                  // Confirm button
                  CustomButton(
                    text: 'تأكيد وبدء الطلب',
                    onPressed: _submit,
                    isMax: true,
                    backgroundColor: MyColors.primaryColor,
                    textColor: Theme.of(context).colorScheme.surface,
                  ),
                  8.verticalSpace,

                  // Cancel text
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'إلغاء',
                      style: AppTextStyle.medium16(context).copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickChip(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: Theme.of(context).colorScheme.surfaceTint,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyle.medium12(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
