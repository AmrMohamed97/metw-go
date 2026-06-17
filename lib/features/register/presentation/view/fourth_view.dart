import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/animated_column.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';
import 'package:metw_go/features/register/presentation/widgets/custom_steper.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';
import 'package:metw_go/features/register/presentation/widgets/first_view_body.dart';
import 'package:metw_go/features/register/presentation/widgets/info_banner.dart';
import 'package:metw_go/features/register/presentation/widgets/removable_chip.dart';
import 'package:metw_go/features/register/presentation/widgets/rural_service_toggle.dart';

class FourthView extends StatelessWidget {
  const FourthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return CustomScrollView(
          slivers: [
            FirstViewBody(
              body: Form(
                key: cubit.fourthViewFormKey,
                child: AnimatedColumn(
                  children: [
                    50.verticalSpace,
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 32),
                      child: const CustomSteper(),
                    ),
                    25.verticalSpace,
                    Text(
                      AppLocalizations.of(context)!.serviceAreas,
                      style: AppTextStyle.medium16(
                        context,
                      ).copyWith(color: Theme.of(context).primaryColor),
                    ),
                    // 4.verticalSpace,
                    Text(
                      AppLocalizations.of(context)!.serviceAreasDesc,
                      style: AppTextStyle.regular14(
                        context,
                      ).copyWith(color: Colors.grey.shade400),
                    ),
                    16.verticalSpace,
                    FieldTitle(
                      title: AppLocalizations.of(context)!.chooseGovernorates,
                    ),
                    4.verticalSpace,
                    CustomTextField(
                      hintText: AppLocalizations.of(context)!.governorates,
                      isFixed: false,
                      readOnly: true,
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      onTap: () {},
                    ),
                    8.verticalSpace,
                    if (cubit.selectedGovernorates.isNotEmpty) ...[
                      // 16.verticalSpace,
                      Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: cubit.selectedGovernorates.map((gov) {
                          return RemovableChip(
                            label: gov,
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
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      onTap: () {},
                      isFixed: false,
                    ),
                    8.verticalSpace,
                    if (cubit.selectedCities.isNotEmpty) ...[
                      // 16.verticalSpace,
                      Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: cubit.selectedCities.map((city) {
                          return RemovableChip(
                            label: city,
                            onRemove: () => cubit.removeCity(city),
                          );
                        }).toList(),
                      ),
                    ],
                    32.verticalSpace,
                    RuralServiceToggle(
                      title: AppLocalizations.of(context)!.activateRuralService,
                      subtitle: AppLocalizations.of(context)!.ruralServiceDesc,
                      value: cubit.isRuralServiceEnabled,
                      onChanged: cubit.toggleRuralService,
                    ),
                    24.verticalSpace,
                    InfoBanner(
                      text: AppLocalizations.of(context)!.ruralServiceWarning,
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
                            onPressed: () => cubit.changePage(2),
                          ),
                        ),
                        CustomButton(
                          horizontalPadding: 40,
                          text: AppLocalizations.of(context)!.next,
                          onPressed: () => cubit.fourthViewPress(context),
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
