import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/animated_column.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';
import 'package:metw_go/features/register/presentation/widgets/custom_steper.dart';
import 'package:metw_go/features/register/presentation/widgets/delegate_type_selector.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';
import 'package:metw_go/features/register/presentation/widgets/first_view_body.dart';
import 'package:metw_go/features/register/presentation/widgets/work_classification_selector.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return CustomScrollView(
          slivers: [
            // 50.verticalSpace,
            FirstViewBody(
              body: Form(
                key: cubit.secondViewFormKey,
                child: AnimatedColumn(
                  revealOnScroll: true,
                  children: [
                    50.verticalSpace,
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 16.0,
                        end: 60,
                      ),
                      child: const CustomSteper(),
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
                        title: AppLocalizations.of(context)!.warehouseNumber,
                      ),
                      4.verticalSpace,
                      CustomTextField(
                        hintText: AppLocalizations.of(
                          context,
                        )!.chooseWarehouseNumber,
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        readOnly: true,
                        // Add a tap handler if needed to open a bottom sheet
                        // But we also need validator as requested
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
                    24.verticalSpace,
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
                    const WorkClassificationSelector(),
                    24.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 20.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6B1A99), // Purple from design
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.trending_up,
                              color: Colors.white,
                            ),
                          ),
                          16.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.higherProfitOpp,
                                  style: AppTextStyle.medium16(
                                    context,
                                  ).copyWith(color: Colors.white),
                                ),
                                4.verticalSpace,
                                Text(
                                  AppLocalizations.of(
                                    context,
                                  )!.intercityShippingIncreasesIncome,
                                  style: AppTextStyle.regular12(context)
                                      .copyWith(
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    34.verticalSpace,
                    Row(
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
                            onPressed: () => cubit.changePage(0),
                          ),
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: CustomButton(
                            text: AppLocalizations.of(context)!.next,
                            onPressed: () => cubit.secondViewPress(context),
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    const ViewInsetsSpace(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
