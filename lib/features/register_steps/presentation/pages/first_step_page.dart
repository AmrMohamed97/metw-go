import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/router/app_routes.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_steper.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/register/presentation/widgets/ads_widgets.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';
import 'package:metw_go/features/register_steps/presentation/manager/first_step_cubit/first_step_cubit.dart';
import 'package:metw_go/features/register_steps/presentation/manager/first_step_cubit/first_step_state.dart';
import 'package:metw_go/features/register_steps/presentation/widgets/delegate_type_selector.dart';
import 'package:metw_go/features/register_steps/presentation/widgets/work_classification_selector.dart';

class FirstStepPage extends StatelessWidget {
  const FirstStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FirstStepCubit, FirstStepState>(
      listener: (context, state) {
        if (state is SubmitFirstStepSuccess) {
          showToast(
            context,
            message: AppLocalizations.of(context)!.savedSuccessfully,
            state: ToastStates.success,
          );
          context.go(AppRoutes.secondStepPage);
        } else if (state is SubmitFirstStepFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        } else if (state is GetWarehousesFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<FirstStepCubit>();
        return ScreenWrapper(
          body: CustomScrollView(
            slivers: [
              // 50.verticalSpace,
              SliverToBoxAdapter(
                child: Form(
                  key: cubit.firstStepFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        50.verticalSpace,
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 16.0,
                            end: 60,
                          ),
                          child: const CustomSteper(currentStep: 0),
                        ),
                        16.verticalSpace,
                        Text(
                          AppLocalizations.of(context)!.delegateInfo,
                          style: AppTextStyle.medium16(
                            context,
                          ).copyWith(color: Theme.of(context).primaryColor),
                        ),
                        3.verticalSpace,
                        Text(
                          AppLocalizations.of(context)!.startCreatingProfile,
                          style: AppTextStyle.medium14(context).copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        24.verticalSpace,
                        FieldTitle(
                          title: AppLocalizations.of(context)!.delegateType,
                        ),
                        12.verticalSpace,
                        const DelegateTypeSelector(),
                        if (!cubit.isIndependentDelegate) ...[
                          16.verticalSpace,
                          FieldTitle(
                            title: AppLocalizations.of(
                              context,
                            )!.warehouseNumber,
                          ),
                          4.verticalSpace,
                          CustomTextField(
                            hintText:
                                cubit.selectedWarehouse?.name ??
                                AppLocalizations.of(
                                  context,
                                )!.chooseWarehouseNumber,
                            suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            readOnly: true,
                            onTap: () {
                              if (cubit.warehouses.isNotEmpty) {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Theme.of(context).colorScheme.surface,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                                  ),
                                  builder: (context) {
                                    return SafeArea(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // Drag handle
                                            Container(
                                              height: 4.h,
                                              width: 40.w,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius: BorderRadius.circular(4.r),
                                              ),
                                            ),
                                            16.verticalSpace,
                                            // Title
                                            Text(
                                              AppLocalizations.of(context)!.chooseWarehouseNumber,
                                              style: AppTextStyle.bold18(context),
                                            ),
                                            16.verticalSpace,
                                            // List of items
                                            Flexible(
                                              child: ListView.separated(
                                                shrinkWrap: true,
                                                itemCount: cubit.warehouses.length,
                                                separatorBuilder: (context, index) => 12.verticalSpace,
                                                itemBuilder: (context, index) {
                                                  final warehouse = cubit.warehouses[index];
                                                  final isSelected = cubit.selectedWarehouse == warehouse;
                                                  return InkWell(
                                                    onTap: () {
                                                      cubit.selectWarehouse(warehouse);
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
                                                            ? Theme.of(context).primaryColor.withOpacity(0.05)
                                                            : Colors.transparent,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            padding: const EdgeInsets.all(10),
                                                            decoration: BoxDecoration(
                                                              color: isSelected
                                                                  ? Theme.of(context).primaryColor
                                                                  : Colors.grey.shade100,
                                                              shape: BoxShape.circle,
                                                            ),
                                                            child: Icon(
                                                              Icons.storefront_outlined,
                                                              color: isSelected
                                                                  ? Colors.white
                                                                  : Colors.grey.shade600,
                                                              size: 24.sp,
                                                            ),
                                                          ),
                                                          16.horizontalSpace,
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  warehouse.name ?? '',
                                                                  style: AppTextStyle.medium16(context).copyWith(
                                                                    color: isSelected
                                                                        ? Theme.of(context).primaryColor
                                                                        : null,
                                                                  ),
                                                                ),
                                                                4.verticalSpace,
                                                                Text(
                                                                  warehouse.accountNumber ?? '',
                                                                  style: AppTextStyle.regular12(context).copyWith(
                                                                    color: Colors.grey.shade600,
                                                                  ),
                                                                ),
                                                              ],
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
                                );
                              }
                            },
                            validator: (value) {
                              if (!cubit.isIndependentDelegate &&
                                  cubit.selectedWarehouse == null) {
                                return AppLocalizations.of(
                                  context,
                                )!.errChooseWarehouse;
                              }
                              return null;
                            },
                          ),
                        ],
                        if (cubit.isIndependentDelegate) 24.verticalSpace,
                        FieldTitle(
                          title: AppLocalizations.of(
                            context,
                          )!.workClassification,
                        ),
                        3.verticalSpace,
                        Text(
                          AppLocalizations.of(
                            context,
                          )!.chooseMultipleClassifications,
                          style: AppTextStyle.regular12(
                            context,
                          ).copyWith(color: Colors.grey.shade500),
                        ),
                        12.verticalSpace,
                        const WorkClassificationSelector(),
                        24.verticalSpace,
                        const AdsWidgets(),
                        34.verticalSpace,
                        Row(
                          mainAxisAlignment: .spaceBetween,
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
                                onPressed: () => context.go(
                                  AppRoutes.login,
                                ), // cubit.changePage(0),
                              ),
                            ),
                            // 12.horizontalSpace,
                            CustomButton(
                              loading: state is SubmitFirstStepLoading,
                              horizontalPadding: state is SubmitFirstStepLoading
                                  ? null
                                  : 40,
                              text: AppLocalizations.of(context)!.next,
                              onPressed: () {
                                if ( cubit.selectedTransportTypes.isEmpty) {
                                  showToast(
                                    context,
                                    message: AppLocalizations.of(
                                      context,
                                    )!.errChooseWorkClassification,
                                    state: ToastStates.error,
                                  );
                                  return;
                                }
                                cubit.submitFirstStep();
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
