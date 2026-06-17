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
import 'package:metw_go/features/register/presentation/widgets/image_upload_container.dart';
import 'package:metw_go/features/register/presentation/widgets/info_banner.dart';
import 'package:metw_go/features/register/presentation/widgets/pic_image_bottom_sheet.dart';

class ThirdView extends StatelessWidget {
  const ThirdView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return CustomScrollView(
          slivers: [
            FirstViewBody(
              body: Form(
                key: cubit.thirdViewFormKey,
                child: AnimatedColumn(
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
                      AppLocalizations.of(context)!.vehicleData,
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
                      title: AppLocalizations.of(context)!.transportMethod,
                    ),
                    4.verticalSpace,
                    CustomTextField(
                      hintText: AppLocalizations.of(
                        context,
                      )!.chooseTransportMethod,
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      readOnly: true,
                      onTap: () {},
                      validator: (value) {
                        // Normally this validates selectedTransportMethod
                        // For UI implementation, we can just return null or hook it up later.
                        return null;
                      },
                    ),
                    16.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FieldTitle(
                                title: AppLocalizations.of(context)!.maxWeight,
                              ),
                              4.verticalSpace,
                              CustomTextField(
                                hintText: AppLocalizations.of(
                                  context,
                                )!.maxWeightHint,
                                controller: cubit.maxWeightController,
                                textInputType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(
                                      context,
                                    )!.errEnterMaxWeight;
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
                              FieldTitle(
                                title: AppLocalizations.of(context)!.maxVolume,
                              ),
                              4.verticalSpace,
                              CustomTextField(
                                hintText: AppLocalizations.of(
                                  context,
                                )!.maxVolumeHint,
                                controller: cubit.maxVolumeController,
                                textInputType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(
                                      context,
                                    )!.errEnterMaxVolume;
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
                    FieldTitle(
                      title: AppLocalizations.of(context)!.plateNumber,
                    ),
                    4.verticalSpace,
                    CustomTextField(
                      hintText: AppLocalizations.of(context)!.plateNumberHint,
                      controller: cubit.plateNumberController,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: Image.asset(
                          AppImages.balletNumIcon, // The plate icon
                          height: 24.h,
                          width: 24.h,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(
                            context,
                          )!.errEnterPlateNumber;
                        }
                        return null;
                      },
                    ),
                    4.verticalSpace,
                    Text(
                      AppLocalizations.of(context)!.plateNumberDesc,
                      style: AppTextStyle.regular12(
                        context,
                      ).copyWith(color: Colors.grey.shade600),
                    ),
                    24.verticalSpace,
                    ImageUploadContainer(
                      title: AppLocalizations.of(context)!.uploadVehicleImage,
                      subtitle: AppLocalizations.of(
                        context,
                      )!.uploadVehicleImageDesc,
                      iconPath: AppImages.uploadIcon, // Camera icon with plus
                      imagePath: cubit.vehicleImage?.path,
                      isLoading:state is PickVehicleImageLoading,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (ctx) {
                            return BlocProvider.value(
                              value: cubit,
                              child: PickImageBottomSheet(ctx: ctx),
                            );
                          },
                        );
                      },
                    ),
                    24.verticalSpace,
                    InfoBanner(
                      text: AppLocalizations.of(context)!.vehicleDataWarning,
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
                            onPressed: () =>
                                cubit.changePage(1), // Back to SecondView
                          ),
                        ),
                        CustomButton(
                          horizontalPadding: 40,
                          text: AppLocalizations.of(context)!.next,
                          onPressed: () => cubit.thirdViewPress(context),
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
