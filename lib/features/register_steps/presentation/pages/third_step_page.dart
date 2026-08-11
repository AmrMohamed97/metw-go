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
import 'package:metw_go/features/register/presentation/widgets/removable_chip.dart';
import 'package:metw_go/features/register/presentation/widgets/rural_service_toggle.dart';
import 'package:metw_go/features/register_steps/presentation/manager/third_step_cubit.dart/third_step_cubit.dart';
import 'package:metw_go/features/register_steps/presentation/manager/third_step_cubit.dart/third_step_state.dart';

class ThirdStepPage extends StatelessWidget {
  const ThirdStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThirdStepCubit, ThirdStepState>(
      listener: (context, state) {
        if (state is SubmitThirdStepSuccess) {
          showToast(
            context,
            message: AppLocalizations.of(context)!.savedSuccessfully,
            state: ToastStates.success,
          );
          context.go(AppRoutes.fourthStepPage);
        } else if (state is SubmitThirdStepFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        } else if (state is GetGovernoratesFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        } else if (state is GetCitiesFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ThirdStepCubit>();
        return ScreenWrapper(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Form(
                  key: cubit.thirdStepFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        50.verticalSpace,
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 32),
                          child: const CustomSteper(currentStep: 2),
                        ),
                        25.verticalSpace,
                        Text(
                          AppLocalizations.of(context)!.serviceAreas,
                          style: AppTextStyle.medium16(
                            context,
                          ).copyWith(color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          AppLocalizations.of(context)!.serviceAreasDesc,
                          style: AppTextStyle.regular14(
                            context,
                          ).copyWith(color: Colors.grey.shade400),
                        ),
                        16.verticalSpace,
                        FieldTitle(
                          title: AppLocalizations.of(
                            context,
                          )!.chooseGovernorates,
                        ),
                        4.verticalSpace,
                        CustomTextField(
                          hintText: AppLocalizations.of(context)!.governorates,
                          isFixed: false,
                          readOnly: true,
                          suffixIcon: state is GetGovernoratesLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  ),
                                )
                              : const Icon(Icons.keyboard_arrow_down),
                          onTap: () {
                            if (cubit.governorates.isNotEmpty) {
                              _showGovernoratesBottomSheet(context, cubit);
                            }
                          },
                        ),
                        8.verticalSpace,
                        if (cubit.selectedGovernorates.isNotEmpty) ...[
                          Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            children: cubit.selectedGovernorates.map((gov) {
                              return RemovableChip(
                                label: gov.name ?? '',
                                onRemove: () => cubit.removeGovernorate(gov),
                              );
                            }).toList(),
                          ),
                        ],
                        16.verticalSpace,
                        FieldTitle(
                          title: AppLocalizations.of(context)!.citiesTitle,
                        ),
                        4.verticalSpace,
                        CustomTextField(
                          hintText: AppLocalizations.of(context)!.cities,
                          readOnly: true,
                          suffixIcon: state is GetCitiesLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  ),
                                )
                              : const Icon(Icons.keyboard_arrow_down),
                          onTap: () {
                            if (cubit.selectedGovernorates.isEmpty) {
                              showToast(
                                context,
                                message: "الرجاء اختيار المحافظة أولاً",
                                state: ToastStates.warning,
                              );
                              return;
                            }
                            if (cubit.cities.isNotEmpty) {
                              _showCitiesBottomSheet(context, cubit);
                            }
                          },
                          isFixed: false,
                        ),
                        8.verticalSpace,
                        if (cubit.selectedCities.isNotEmpty) ...[
                          Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            children: cubit.selectedCities.map((city) {
                              return RemovableChip(
                                label: city.name ?? '',
                                onRemove: () => cubit.removeCity(city),
                              );
                            }).toList(),
                          ),
                        ],
                        32.verticalSpace,
                        RuralServiceToggle(
                          title: AppLocalizations.of(
                            context,
                          )!.activateRuralService,
                          subtitle: AppLocalizations.of(
                            context,
                          )!.ruralServiceDesc,
                          value: cubit.isRuralServiceEnabled,
                          onChanged: cubit.toggleRuralService,
                        ),
                        24.verticalSpace,
                        InfoBanner(
                          text: AppLocalizations.of(
                            context,
                          )!.ruralServiceWarning,
                          iconPath: AppImages.warningIcon,
                        ),
                        40.verticalSpace,
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
                                onPressed: () => context.go(AppRoutes.secondStepPage),
                              ),
                            ),
                            CustomButton(
                              loading: state is SubmitThirdStepLoading,
                              horizontalPadding: state is SubmitThirdStepLoading ? null : 40,
                              text: AppLocalizations.of(context)!.next,
                              onPressed: () => cubit.submitThirdStep(),
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

  void _showGovernoratesBottomSheet(BuildContext context, ThirdStepCubit cubit) {
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
          child: BlocBuilder<ThirdStepCubit, ThirdStepState>(
            builder: (context, state) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                        AppLocalizations.of(context)!.chooseGovernorates,
                        style: AppTextStyle.bold18(context),
                      ),
                      16.verticalSpace,
                      Flexible(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: cubit.governorates.length,
                          separatorBuilder: (context, index) => 12.verticalSpace,
                          itemBuilder: (context, index) {
                            final gov = cubit.governorates[index];
                            final isSelected = cubit.selectedGovernorates.contains(gov);
                            return InkWell(
                              onTap: () => cubit.toggleGovernorate(gov),
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
                                      ? Theme.of(context).primaryColor.withOpacity(0.05)
                                      : Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      gov.name ?? '',
                                      style: AppTextStyle.medium16(context).copyWith(
                                        color: isSelected ? Theme.of(context).primaryColor : null,
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

  void _showCitiesBottomSheet(BuildContext context, ThirdStepCubit cubit) {
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
          child: BlocBuilder<ThirdStepCubit, ThirdStepState>(
            builder: (context, state) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                        AppLocalizations.of(context)!.citiesTitle,
                        style: AppTextStyle.bold18(context),
                      ),
                      16.verticalSpace,
                      Flexible(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: cubit.cities.length,
                          separatorBuilder: (context, index) => 12.verticalSpace,
                          itemBuilder: (context, index) {
                            final city = cubit.cities[index];
                            final isSelected = cubit.selectedCities.contains(city);
                            return InkWell(
                              onTap: () => cubit.toggleCity(city),
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
                                      ? Theme.of(context).primaryColor.withOpacity(0.05)
                                      : Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      city.name ?? '',
                                      style: AppTextStyle.medium16(context).copyWith(
                                        color: isSelected ? Theme.of(context).primaryColor : null,
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
