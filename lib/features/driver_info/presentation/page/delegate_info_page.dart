import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/animated_column.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
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
    return ScreenWrapper(
      appBar: CustomAppBar(title: 'معلومات المندوب'),
      body: BlocBuilder<DelegateInfoCubit, DelegateInfoState>(
        builder: (context, state) {
          final cubit = context.read<DelegateInfoCubit>();
          return Form(
            key: cubit.secondViewFormKey,
            child: AnimatedColumn(
              children: [
                50.verticalSpace,

                // 16.verticalSpace,
                // Text(
                //   AppLocalizations.of(context)!.delegateInfo,
                //   style: AppTextStyle.medium16(
                //     context,
                //   ).copyWith(color: Theme.of(context).primaryColor),
                // ),
                // 3.verticalSpace,
                // Text(
                //   AppLocalizations.of(context)!.startCreatingProfile,
                //   style: AppTextStyle.medium14(
                //     context,
                //   ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                // ),
                24.verticalSpace,
                FieldTitle(title: AppLocalizations.of(context)!.delegateType),
                12.verticalSpace,
                const DelegateInfoPageSelector(),
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
                        return AppLocalizations.of(context)!.errChooseWarehouse;
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
                  AppLocalizations.of(context)!.chooseMultipleClassifications,
                  style: AppTextStyle.regular12(
                    context,
                  ).copyWith(color: Colors.grey.shade500),
                ),
                12.verticalSpace,
                const DelegatePageWorkClassification(),

                34.verticalSpace,
                CustomButton(
                      horizontalPadding: 40,
                      text: 'حفظ',
                      onPressed: () {
                        // cubit.secondViewPress(context);
                      },
                    ),
                20.verticalSpace,
                const ViewInsetsSpace(),
              ],
            ),
          );
        },
      ),
    );
  }
}
