import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_steper.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';
import 'package:metw_go/features/register/presentation/widgets/info_banner.dart';
import 'package:metw_go/features/register_steps/data/models/fifth_step_input_model.dart';
import 'package:metw_go/features/register_steps/presentation/manager/fifth_step_cubit/fifth_step_cubit.dart';
import 'package:metw_go/features/register_steps/presentation/manager/fifth_step_cubit/fifth_step_state.dart';

class FifthStepPage extends StatefulWidget {
  const FifthStepPage({super.key});

  @override
  State<FifthStepPage> createState() => _FifthStepPageState();
}

class _FifthStepPageState extends State<FifthStepPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _nationalIdExpiryController =
      TextEditingController();
  final TextEditingController _drivingLicenseNumberController =
      TextEditingController();
  final TextEditingController _drivingLicenseExpiryController =
      TextEditingController();
  final TextEditingController _vehicleLicenseNumberController =
      TextEditingController();
  final TextEditingController _vehicleLicenseExpiryController =
      TextEditingController();

  @override
  void dispose() {
    _nationalIdController.dispose();
    _nationalIdExpiryController.dispose();
    _drivingLicenseNumberController.dispose();
    _drivingLicenseExpiryController.dispose();
    _vehicleLicenseNumberController.dispose();
    _vehicleLicenseExpiryController.dispose();
    super.dispose();
  }

  /// Opens date picker restricted to >= 45 days in the future
  Future<void> _pickExpiryDate({
    required TextEditingController controller,
  }) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final minValidDate = today.add(const Duration(days: 45));

    DateTime initialDate = minValidDate;
    if (controller.text.isNotEmpty) {
      final parsed = DateTime.tryParse(controller.text);
      if (parsed != null && !parsed.isBefore(minValidDate)) {
        initialDate = parsed;
      }
    }

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: minValidDate,
      lastDate: today.add(const Duration(days: 365 * 15)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(
              context,
            ).colorScheme.copyWith(primary: Theme.of(context).primaryColor),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final formatted =
          "${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      setState(() {
        controller.text = formatted;
      });
    }
  }

  /// Validates Egyptian National ID (14 digits)
  String? _validateNationalId(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return l10n.errNationalIdRequired;
    }
    final trimmed = value.trim();
    if (trimmed.length != 14 || !RegExp(r'^[0-9]{14}$').hasMatch(trimmed)) {
      return l10n.errInvalidNationalId;
    }
    return null;
  }

  /// Validates driving license number format (numbers)
  String? _validateDrivingLicenseNumber(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return l10n.errDrivingLicenseNumberRequired;
    }
    final trimmed = value.trim();
    if (!RegExp(r'^[0-9]+$').hasMatch(trimmed)) {
      return l10n.errInvalidDrivingLicenseNumber;
    }
    return null;
  }

  /// Validates vehicle license number format (numbers)
  String? _validateVehicleLicenseNumber(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return l10n.errVehicleLicenseNumberRequired;
    }
    final trimmed = value.trim();
    if (!RegExp(r'^[0-9]+$').hasMatch(trimmed)) {
      return l10n.errInvalidVehicleLicenseNumber;
    }
    return null;
  }

  /// Validates expiry date format (YYYY-MM-DD) and validity >= 45 days
  String? _validateExpiryDate(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return l10n.errDateRequired;
    }
    final trimmed = value.trim();
    if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(trimmed)) {
      return l10n.errDateFormat;
    }
    final parsed = DateTime.tryParse(trimmed);
    if (parsed == null) {
      return l10n.errDateFormat;
    }
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final minValidDate = today.add(const Duration(days: 45));
    final checkDate = DateTime(parsed.year, parsed.month, parsed.day);

    if (checkDate.isBefore(minValidDate)) {
      return l10n.errDateMin45Days;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<FifthStepCubit, FifthStepState>(
      listener: (context, state) {
        if (state is SubmitFifthStepSuccess) {
          showToast(
            context,
            message: l10n.savedSuccessfully,
            state: ToastStates.success,
          );
          context.go(AppRoutes.secondStepPage);
        } else if (state is SubmitFifthStepFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<FifthStepCubit>();
        final bool isLoading = state is SubmitFifthStepLoading;

        return ScreenWrapper(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        50.verticalSpace,
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 16.0,
                            end: 60,
                          ),
                          child: const CustomSteper(
                            currentStep: 2,
                            totalSteps: 5,
                          ),
                        ),
                        16.verticalSpace,
                        Text(
                          l10n.documentsData,
                          style: AppTextStyle.medium16(
                            context,
                          ).copyWith(color: Theme.of(context).primaryColor),
                        ),
                        3.verticalSpace,
                        Text(
                          l10n.documentsDataDesc,
                          style: AppTextStyle.medium14(context).copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        16.verticalSpace,
                        InfoBanner(
                          text: l10n.documentsValidityNotice,
                          iconPath: AppImages.warningIcon,
                        ),
                        24.verticalSpace,

                        // 1. الرقم القومي (National ID Number)
                        FieldTitle(title: l10n.nationalIdNumber),
                        4.verticalSpace,
                        CustomTextField(
                          controller: _nationalIdController,
                          hintText: l10n.nationalIdNumberHint,
                          textInputType: TextInputType.number,
                          isFixed: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(14),
                          ],
                          prefixIcon: const Icon(Icons.badge_outlined),
                          validator: _validateNationalId,
                        ),
                        16.verticalSpace,

                        // 2. تاريخ إنتهاء بطاقة الرقم القومي (National ID Expiry Date)
                        FieldTitle(title: l10n.nationalIdExpiryDate),
                        4.verticalSpace,
                        CustomTextField(
                          controller: _nationalIdExpiryController,
                          hintText: "YYYY-MM-DD",
                          readOnly: true,
                          isFixed: false,
                          prefixIcon: const Icon(Icons.event_outlined),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_month_outlined),
                            onPressed: () => _pickExpiryDate(
                              controller: _nationalIdExpiryController,
                            ),
                          ),
                          onTap: () => _pickExpiryDate(
                            controller: _nationalIdExpiryController,
                          ),
                          validator: _validateExpiryDate,
                        ),
                        24.verticalSpace,

                        // 3. رقم رخصة القيادة (Driving License Number)
                        FieldTitle(title: l10n.drivingLicenseNumber),
                        4.verticalSpace,
                        CustomTextField(
                          controller: _drivingLicenseNumberController,
                          hintText: l10n.drivingLicenseNumberHint,
                          textInputType: TextInputType.number,
                          isFixed: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          prefixIcon: const Icon(Icons.credit_card_outlined),
                          validator: _validateDrivingLicenseNumber,
                        ),
                        16.verticalSpace,

                        // 4. تاريخ إنتهاء رخصة القيادة (Driving License Expiry Date)
                        FieldTitle(title: l10n.drivingLicenseExpiryDate),
                        4.verticalSpace,
                        CustomTextField(
                          controller: _drivingLicenseExpiryController,
                          hintText: "YYYY-MM-DD",
                          readOnly: true,
                          isFixed: false,
                          prefixIcon: const Icon(Icons.event_outlined),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_month_outlined),
                            onPressed: () => _pickExpiryDate(
                              controller: _drivingLicenseExpiryController,
                            ),
                          ),
                          onTap: () => _pickExpiryDate(
                            controller: _drivingLicenseExpiryController,
                          ),
                          validator: _validateExpiryDate,
                        ),
                        24.verticalSpace,

                        // 5. رقم رخصة وسيلة النقل (Vehicle License Number)
                        FieldTitle(title: l10n.vehicleLicenseNumber),
                        4.verticalSpace,
                        CustomTextField(
                          controller: _vehicleLicenseNumberController,
                          hintText: l10n.vehicleLicenseNumberHint,
                          textInputType: TextInputType.number,
                          isFixed: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          prefixIcon: const Icon(Icons.directions_car_outlined),
                          validator: _validateVehicleLicenseNumber,
                        ),
                        16.verticalSpace,

                        // 6. تاريخ إنتهاء رخصة وسيلة النقل (Vehicle License Expiry Date)
                        FieldTitle(title: l10n.vehicleLicenseExpiryDate),
                        4.verticalSpace,
                        CustomTextField(
                          controller: _vehicleLicenseExpiryController,
                          hintText: "YYYY-MM-DD",
                          readOnly: true,
                          isFixed: false,
                          prefixIcon: const Icon(Icons.event_outlined),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_month_outlined),
                            onPressed: () => _pickExpiryDate(
                              controller: _vehicleLicenseExpiryController,
                            ),
                          ),
                          onTap: () => _pickExpiryDate(
                            controller: _vehicleLicenseExpiryController,
                          ),
                          validator: _validateExpiryDate,
                        ),
                        34.verticalSpace,

                        // Bottom Navigation View
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 46.h,
                              width: 46.h,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.outline,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 18.sp,
                                  color: Colors.grey.shade600,
                                ),
                                onPressed: () {
                                  if (context.canPop()) {
                                    context.pop();
                                  } else {
                                    context.go(AppRoutes.thirdStepPage);
                                  }
                                },
                              ),
                            ),
                            CustomButton(
                              loading: isLoading,
                              horizontalPadding: isLoading ? null : 40,
                              text: l10n.next,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final input = FifthStepInputModel(
                                    nationalIdNumber:
                                        _nationalIdController.text.trim(),
                                    nationalIdExpiresAt:
                                        _nationalIdExpiryController.text.trim(),
                                    drivingLicenseNumber:
                                        _drivingLicenseNumberController.text
                                            .trim(),
                                    drivingLicenseExpiresAt:
                                        _drivingLicenseExpiryController.text
                                            .trim(),
                                    vehicleLicenseNumber:
                                        _vehicleLicenseNumberController.text
                                            .trim(),
                                    vehicleLicenseExpiresAt:
                                        _vehicleLicenseExpiryController.text
                                            .trim(),
                                  );
                                  cubit.submitFifthStep(input);
                                }
                              },
                            ),
                          ],
                        ),
                        20.verticalSpace,
                        const ViewInsetsSpace(),
                      ],
                    ),
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
