import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/driver_info/presentation/manager/delegate_info_cubit.dart';
import 'package:metw_go/features/driver_info/presentation/manager/delegate_info_state.dart';
import 'package:metw_go/features/driver_info/presentation/widgets/delegate_info_page_selector.dart';
import 'package:metw_go/features/driver_info/presentation/widgets/delegate_page_work_classification.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';

class DelegateInfoPage extends StatelessWidget {
  const DelegateInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DelegateInfoCubit, DelegateInfoState>(
      listener: (context, state) {
        if (state is UpdateWorkInfoSuccess) {
          showToast(
            context,
            message:
                state.profileOutModel.message ??
                AppLocalizations.of(context)!.savedSuccessfully,
            state: ToastStates.success,
          );
          context.pop(true);
        } else if (state is UpdateWorkInfoFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        } else if (state is GetWarehousesFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<DelegateInfoCubit>();
        return ScreenWrapper(
          appBar: CustomAppBar(title: 'معلومات المندوب'),
          // bottomNavigationBar: Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Center(
          //     child: CustomButton(
          //       isMax: state is! UpdateWorkInfoLoading,
          //       loading: state is UpdateWorkInfoLoading,
          //       text: 'حفظ',
          //       onPressed: () {
          //         cubit.updateWorkInfo();
          //       },
          //     ),
          //   ),
          // ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Form(
              key: cubit.secondViewFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    24.verticalSpace,
                    FieldTitle(
                      title: AppLocalizations.of(context)!.delegateType,
                    ),
                    12.verticalSpace,
                    const DelegateInfoPageSelector(),
                    if (!cubit.isIndependentDelegate) ...[
                      16.verticalSpace,
                      FieldTitle(
                        title: AppLocalizations.of(context)!.warehouseNumber,
                      ),
                      4.verticalSpace,
                      CustomTextField(
                        hintText:
                            cubit.selectedWarehouse?.name ??
                            AppLocalizations.of(context)!.chooseWarehouseNumber,
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        readOnly: true,
                        onTap: () {
                          if (cubit.warehouses.isNotEmpty) {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.5,
                              ),
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.surface,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24.r),
                                ),
                              ),
                              builder: (context) {
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
                                            borderRadius: BorderRadius.circular(
                                              4.r,
                                            ),
                                          ),
                                        ),
                                        16.verticalSpace,
                                        Text(
                                          AppLocalizations.of(
                                            context,
                                          )!.chooseWarehouseNumber,
                                          style: AppTextStyle.bold18(context),
                                        ),
                                        16.verticalSpace,
                                        Flexible(
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            itemCount: cubit.warehouses.length,
                                            separatorBuilder:
                                                (context, index) =>
                                                    12.verticalSpace,
                                            itemBuilder: (context, index) {
                                              final warehouse =
                                                  cubit.warehouses[index];
                                              final isSelected =
                                                  cubit.selectedWarehouse ==
                                                  warehouse;
                                              return InkWell(
                                                onTap: () {
                                                  cubit.selectWarehouse(
                                                    warehouse,
                                                  );
                                                  Navigator.pop(context);
                                                },
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                    16,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12.r,
                                                        ),
                                                    border: Border.all(
                                                      color: isSelected
                                                          ? Theme.of(context)
                                                                .colorScheme
                                                                .primary
                                                          : Colors
                                                                .grey
                                                                .shade300,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        warehouse.name ?? '',
                                                        style:
                                                            AppTextStyle.medium14(
                                                              context,
                                                            ).copyWith(
                                                              color: isSelected
                                                                  ? Theme.of(
                                                                          context,
                                                                        )
                                                                        .colorScheme
                                                                        .primary
                                                                  : Theme.of(
                                                                          context,
                                                                        )
                                                                        .colorScheme
                                                                        .tertiary,
                                                            ),
                                                      ),
                                                      if (isSelected)
                                                        Icon(
                                                          Icons.check_circle,
                                                          color: Theme.of(
                                                            context,
                                                          ).colorScheme.primary,
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
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
                      title: AppLocalizations.of(context)!.workClassification,
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
                    const DelegatePageWorkClassification(),
                    const ViewInsetsSpace(),
                    50.verticalSpace,
                    Center(
                      child: CustomButton(
                        isMax: state is! UpdateWorkInfoLoading,
                        loading: state is UpdateWorkInfoLoading,
                        text: 'حفظ',
                        onPressed: () {
                          cubit.updateWorkInfo();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
