import 'package:flutter/material.dart';
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
import 'package:metw_go/features/register_steps/presentation/manager/second_step_cubit.dart/second_step_cubit.dart';
import 'package:metw_go/features/register_steps/presentation/manager/second_step_cubit.dart/second_step_state.dart';

class SecondStepPage extends StatelessWidget {
  const SecondStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<SecondStepCubit, SecondStepState>(
      listener: (context, state) {
        if (state is SubmitSecondStepSuccess) {
          showToast(
            context,
            message: l10n.savedSuccessfully,
            state: ToastStates.success,
          );
          context.go(AppRoutes.fourthStepPage);
        } else if (state is SubmitSecondStepFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        } else if (state is GetTransportTypesFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<SecondStepCubit>();
        final bool isLoading = state is SubmitSecondStepLoading;

        return ScreenWrapper(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Form(
                  key: cubit.secondStepFormKey,
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
                          child: const CustomSteper(currentStep: 3),
                        ),
                        16.verticalSpace,
                        Text(
                          l10n.vehicleData,
                          style: AppTextStyle.medium16(
                            context,
                          ).copyWith(color: Theme.of(context).primaryColor),
                        ),
                        3.verticalSpace,
                        Text(
                          l10n.startCreatingProfile,
                          style: AppTextStyle.medium14(context).copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        24.verticalSpace,

                        // 1. وسيلة النقل (Transport Method)
                        FieldTitle(title: l10n.transportMethod),
                        4.verticalSpace,
                        CustomTextField(
                          hintText: cubit.selectedTransportType?.name ??
                              l10n.chooseTransportMethod,
                          suffixIcon: state is GetTransportTypesLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                )
                              : const Icon(Icons.keyboard_arrow_down),
                          readOnly: true,
                          onTap: () {
                            if (cubit.transportTypes.isNotEmpty) {
                              _showTransportTypeBottomSheet(context, cubit);
                            }
                          },
                          validator: (value) {
                            if (cubit.selectedTransportType == null) {
                              return l10n.chooseTransportMethod;
                            }
                            return null;
                          },
                        ),
                        if (cubit.selectedTransportType != null) ...[
                          16.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FieldTitle(title: l10n.maxWeight),
                                    4.verticalSpace,
                                    CustomTextField(
                                      hintText: l10n.maxWeightHint,
                                      controller: cubit.maxWeightController,
                                      textInputType: TextInputType.number,
                                      readOnly: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return l10n.errEnterMaxWeight;
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              16.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FieldTitle(title: l10n.maxVolume),
                                    4.verticalSpace,
                                    CustomTextField(
                                      hintText: l10n.maxVolumeHint,
                                      controller: cubit.maxVolumeController,
                                      readOnly: true,
                                      textInputType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return l10n.errEnterMaxVolume;
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                        16.verticalSpace,

                        // 2. ماركة المركبة وموديلها (Vehicle Brand & Model)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const FieldTitle(title: "ماركة المركبة"),
                                  4.verticalSpace,
                                  CustomTextField(
                                    hintText: "مثال: Toyota",
                                    controller: cubit.vehicleBrandController,
                                    textInputType: TextInputType.text,
                                    prefixIcon: const Icon(
                                      Icons.branding_watermark_outlined,
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return "الرجاء إدخال ماركة المركبة";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            12.horizontalSpace,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const FieldTitle(title: "موديل المركبة"),
                                  4.verticalSpace,
                                  CustomTextField(
                                    hintText: "مثال: Corolla",
                                    controller: cubit.vehicleModelController,
                                    textInputType: TextInputType.text,
                                    prefixIcon: const Icon(
                                      Icons.directions_car_filled_outlined,
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return "الرجاء إدخال موديل المركبة";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        16.verticalSpace,

                        // 3. حروف اللوحة ورقم اللوحة الكامل (Plate Letters & Plate Number)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FieldTitle(title: l10n.plateLetters),
                                  4.verticalSpace,
                                  CustomTextField(
                                    hintText: l10n.plateLettersHint,
                                    controller: cubit.plateLettersController,
                                    textInputType: TextInputType.text,
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(12.r),
                                      child: Image.asset(
                                        AppImages.balletNumIcon,
                                        height: 24.h,
                                        width: 24.h,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return l10n.errEnterPlateLetters;
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            12.horizontalSpace,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const FieldTitle(title: "رقم اللوحة"),
                                  4.verticalSpace,
                                  CustomTextField(
                                    hintText: "مثال: ABC-1234 أو 1234",
                                    controller: cubit.plateNumberController,
                                    textInputType: TextInputType.text,
                                    prefixIcon: const Icon(Icons.pin_outlined),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return "الرجاء إدخال رقم اللوحة";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        4.verticalSpace,
                        Text(
                          l10n.plateNumberDesc,
                          style: AppTextStyle.regular12(
                            context,
                          ).copyWith(color: Colors.grey.shade600),
                        ),
                        24.verticalSpace,

                        InfoBanner(
                          text: l10n.vehicleDataWarning,
                          iconPath: AppImages.warningIcon,
                        ),
                        34.verticalSpace,

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
                                    context.go(AppRoutes.fifthStepPage);
                                  }
                                },
                              ),
                            ),
                            CustomButton(
                              loading: isLoading,
                              horizontalPadding: isLoading ? null : 40,
                              text: l10n.next,
                              onPressed: () {
                                cubit.submitSecondStep();
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

  void _showTransportTypeBottomSheet(
    BuildContext context,
    SecondStepCubit cubit,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (ctx) {
        return BlocProvider.value(
          value: cubit,
          child: BlocBuilder<SecondStepCubit, SecondStepState>(
            builder: (context, state) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 4.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      16.verticalSpace,
                      Text(
                        AppLocalizations.of(context)!.chooseTransportMethod,
                        style: AppTextStyle.bold18(context),
                      ),
                      16.verticalSpace,
                      Flexible(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: cubit.transportTypes.length,
                          separatorBuilder: (context, index) =>
                              12.verticalSpace,
                          itemBuilder: (context, index) {
                            final type = cubit.transportTypes[index];
                            final isSelected =
                                cubit.selectedTransportType?.id == type.id;
                            return InkWell(
                              onTap: () {
                                cubit.changeTransportType(type);
                                Navigator.pop(context);
                              },
                              borderRadius: BorderRadius.circular(12.r),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: isSelected
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey.shade300,
                                    width: isSelected ? 1.5 : 1,
                                  ),
                                  color: isSelected
                                      ? Theme.of(
                                          context,
                                        ).primaryColor.withValues(alpha: 0.05)
                                      : Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        type.name ?? '',
                                        style: AppTextStyle.medium16(context)
                                            .copyWith(
                                              color: isSelected
                                                  ? Theme.of(
                                                      context,
                                                    ).primaryColor
                                                  : null,
                                            ),
                                      ),
                                    ),
                                    if (isSelected)
                                      Icon(
                                        Icons.check_circle,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      16.verticalSpace,
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
