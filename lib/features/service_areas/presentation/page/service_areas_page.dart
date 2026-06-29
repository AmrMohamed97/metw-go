import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/animated_column.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';
import 'package:metw_go/features/register/presentation/widgets/info_banner.dart';
import 'package:metw_go/features/register/presentation/widgets/removable_chip.dart';
import 'package:metw_go/features/register/presentation/widgets/rural_service_toggle.dart';
import 'package:metw_go/features/service_areas/presentation/manager/service_areas_cubit.dart';
import 'package:metw_go/features/service_areas/presentation/manager/service_areas_state.dart';

class ServiceAreasPage extends StatelessWidget {
  const ServiceAreasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(title: 'مناطق الخدمة'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomButton(
          isMax: true,
          text: 'حفظ',
          onPressed: () {
            // cubit.fourthViewPress(context);
          },
        ),
      ),
      body: BlocBuilder<ServiceAreasCubit, ServiceAreasState>(
        builder: (context, state) {
          final cubit = context.read<ServiceAreasCubit>();
          return Form(
            key: cubit.fourthViewFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SingleChildScrollView(
                child: AnimatedColumn(
                  children: [
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
                    20.verticalSpace,
                    const ViewInsetsSpace(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
