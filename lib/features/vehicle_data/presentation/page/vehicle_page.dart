import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/animated_column.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_text_field.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/pic_image_bottom_sheet.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';
import 'package:metw_go/features/register/presentation/widgets/image_upload_container.dart';
import 'package:metw_go/features/vehicle_data/presentation/manager/vehicle_cubit.dart';
import 'package:metw_go/features/vehicle_data/presentation/manager/vehicle_state.dart';

class VehiclePage extends StatelessWidget {
  const VehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleCubit, VehicleState>(
      listener: (context, state) {
        if (state is UpdateTransportSuccess) {
          showToast(
            context,
            message:
                state.profileOutModel.message ??
                AppLocalizations.of(context)!.savedSuccessfully,
            state: ToastStates.success,
          );
          context.pop(true);
        } else if (state is UpdateTransportFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        } else if (state is GetTransportTypesFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<VehicleCubit>();
        return ScreenWrapper(
          appBar: CustomAppBar(title: 'بيانات المركبة'),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: CustomButton(
                isMax: state is! UpdateTransportLoading,
                loading: state is UpdateTransportLoading,
                text: 'حفظ',
                onPressed: () {
                  cubit.updateTransport();
                },
              ),
            ),
          ),
          body: Form(
            key: cubit.thirdViewFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SingleChildScrollView(
                child: AnimatedColumn(
                  revealOnScroll: true,
                  children: [
                    24.verticalSpace,
                    FieldTitle(
                      title: AppLocalizations.of(context)!.transportMethod,
                    ),
                    4.verticalSpace,
                    CustomTextField(
                      hintText:
                          cubit.selectedTransportType?.name ??
                          AppLocalizations.of(context)!.chooseTransportMethod,
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
                          return AppLocalizations.of(
                            context,
                          )!.errChooseWorkClassification;
                        }
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
                      isFixed: false,
                      hintText: AppLocalizations.of(context)!.plateNumberHint,
                      controller: cubit.plateNumberController,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: Image.asset(
                          AppImages.balletNumIcon,
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
                    FieldTitle(title: 'صورة المركبة'),
                    ImageUploadContainer(
                      title: AppLocalizations.of(context)!.uploadVehicleImage,
                      subtitle: AppLocalizations.of(
                        context,
                      )!.uploadVehicleImageDesc,
                      iconPath: AppImages.uploadIcon,
                      imagePath: cubit.vehicleImage?.path,
                      isLoading: state is PickVehicleImageLoading,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (ctx) {
                            return BlocProvider.value(
                              value: cubit,
                              child: PickImageBottomSheet(
                                ctx: ctx,
                                onPick: (source) =>
                                    cubit.pickVehicleImage(source),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    20.verticalSpace,
                    const ViewInsetsSpace(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showTransportTypeBottomSheet(
    BuildContext context,
    VehicleCubit cubit,
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
          child: BlocBuilder<VehicleCubit, VehicleState>(
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
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.grey.shade300,
                                    width: isSelected ? 1.5 : 1,
                                  ),
                                  color: isSelected
                                      ? Theme.of(
                                          context,
                                        ).colorScheme.primary.withValues(
                                          alpha: 0.05,
                                        )
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
                                                    ).colorScheme.primary
                                                  : null,
                                            ),
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
          ),
        );
      },
    );
  }
}
