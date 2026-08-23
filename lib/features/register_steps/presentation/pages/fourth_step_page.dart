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
import 'package:metw_go/core/widgets/custom_toast.dart';
import 'package:metw_go/core/widgets/pic_image_bottom_sheet.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/register/presentation/widgets/document_upload_box.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';
import 'package:metw_go/features/register/presentation/widgets/personal_photo_container.dart';
import 'package:metw_go/features/register_steps/presentation/manager/fourth_step_cubit/fourth_step_cubit.dart';
import 'package:metw_go/features/register_steps/presentation/manager/fourth_step_cubit/fourth_step_state.dart';

class FourthStepPage extends StatelessWidget {
  const FourthStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FourthStepCubit, FourthStepState>(
      listener: (context, state) {
        if (state is SubmitFourthStepSuccess) {
          showToast(
            context,
            message: AppLocalizations.of(context)!.savedSuccessfully,
            state: ToastStates.success,
          );
          context.go(AppRoutes.commingSoonPage); // Proceeding to OTP or equivalent
        } else if (state is SubmitFourthStepFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<FourthStepCubit>();
        bool isDocLoading(String key) =>
            state is PickDocumentImageLoading &&
            cubit.currentlyLoadingDoc == key;

        return ScreenWrapper(
          body: AbsorbPointer(
            absorbing:
                state is PickDocumentImageLoading ||
                state is SubmitFourthStepLoading,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        50.verticalSpace,
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 32),
                          // child: const CustomSteper(),
                        ),
                        25.verticalSpace,
                        Text(
                          AppLocalizations.of(context)!.uploadOfficialDocs,
                          style: AppTextStyle.medium16(
                            context,
                          ).copyWith(color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          AppLocalizations.of(context)!.uploadOfficialDocsDesc,
                          style: AppTextStyle.regular14(
                            context,
                          ).copyWith(color: Colors.grey.shade400),
                        ),
                        24.verticalSpace,

                        // Personal Photo
                        FieldTitle(
                          title: AppLocalizations.of(context)!.personalPhoto,
                          // style: AppTextStyle.medium14(context),
                        ),
                        12.verticalSpace,
                        PersonalPhotoContainer(
                          isLoading: isDocLoading('personalPhoto'),
                          imageFile: cubit.personalPhoto,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (ctx) => BlocProvider.value(
                                value: cubit,
                                child: PickImageBottomSheet(
                                  ctx: ctx,
                                  onPick: (source) =>
                                      cubit.pickPersonalPhoto(source),
                                ),
                              ),
                            );
                          },
                        ),
                        24.verticalSpace,

                        // National ID
                        FieldTitle(
                          title: AppLocalizations.of(context)!.nationalId,
                          // style: AppTextStyle.medium14(context),
                        ),
                        12.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: DocumentUploadBox(
                                title: AppLocalizations.of(context)!.idBack,
                                iconPath: AppImages.personalCard,
                                imageFile: cubit.nationalIdBack,
                                isLoading: isDocLoading('nationalId_back'),
                                onTap: () => cubit.pickDocumentPhoto(
                                  docType: 'nationalId',
                                  isFront: false,
                                ),
                              ),
                            ),
                            16.horizontalSpace,
                            Expanded(
                              child: DocumentUploadBox(
                                title: AppLocalizations.of(context)!.idFront,
                                iconPath: AppImages.personalCard,
                                imageFile: cubit.nationalIdFront,
                                isLoading: isDocLoading('nationalId_front'),
                                onTap: () => cubit.pickDocumentPhoto(
                                  docType: 'nationalId',
                                  isFront: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        24.verticalSpace,
                        // Driving License
                        FieldTitle(
                          title: AppLocalizations.of(context)!.drivingLicense,
                          // style: AppTextStyle.medium14(context),
                        ),
                        12.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: DocumentUploadBox(
                                title: AppLocalizations.of(context)!.backSide,
                                iconPath: AppImages.driveLicenceIcon,
                                imageFile: cubit.drivingLicenseBack,
                                isLoading: isDocLoading('drivingLicense_back'),
                                onTap: () => cubit.pickDocumentPhoto(
                                  docType: 'drivingLicense',
                                  isFront: false,
                                ),
                              ),
                            ),
                            16.horizontalSpace,
                            Expanded(
                              child: DocumentUploadBox(
                                title: AppLocalizations.of(context)!.frontSide,
                                iconPath: AppImages.driveLicenceIcon,
                                imageFile: cubit.drivingLicenseFront,
                                isLoading: isDocLoading('drivingLicense_front'),
                                onTap: () => cubit.pickDocumentPhoto(
                                  docType: 'drivingLicense',
                                  isFront: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        24.verticalSpace,

                        // Vehicle License
                        FieldTitle(
                          title: AppLocalizations.of(context)!.vehicleLicense,
                          // style: AppTextStyle.medium14(context),
                        ),
                        12.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: DocumentUploadBox(
                                title: AppLocalizations.of(context)!.backSide,
                                iconPath: AppImages.carLicenceIcon,
                                imageFile: cubit.vehicleLicenseBack,
                                isLoading: isDocLoading('vehicleLicense_back'),
                                onTap: () => cubit.pickDocumentPhoto(
                                  docType: 'vehicleLicense',
                                  isFront: false,
                                ),
                              ),
                            ),
                            16.horizontalSpace,
                            Expanded(
                              child: DocumentUploadBox(
                                title: AppLocalizations.of(context)!.frontSide,
                                iconPath: AppImages.carLicenceIcon,
                                imageFile: cubit.vehicleLicenseFront,
                                isLoading: isDocLoading('vehicleLicense_front'),
                                onTap: () => cubit.pickDocumentPhoto(
                                  docType: 'vehicleLicense',
                                  isFront: true,
                                ),
                              ),
                            ),
                          ],
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
                                onPressed: () {},
                                // cubit.changePage(3), // Back to FourthView
                              ),
                            ),
                            CustomButton(
                              loading: state is SubmitFourthStepLoading,
                              horizontalPadding:
                                  state is SubmitFourthStepLoading ? null : 40,
                              text: AppLocalizations.of(context)!.next,
                              onPressed: () {
                                cubit.submitFourthStep();
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
              ],
            ),
          ),
        );
      },
    );
  }
}
