import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/animated_column.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';
import 'package:metw_go/features/register/presentation/widgets/custom_steper.dart';
import 'package:metw_go/features/register/presentation/widgets/document_upload_box.dart';
import 'package:metw_go/features/register/presentation/widgets/first_view_body.dart';
import 'package:metw_go/features/register/presentation/widgets/personal_photo_container.dart';
import 'package:metw_go/features/register/presentation/widgets/pic_image_bottom_sheet.dart';

class FifthView extends StatelessWidget {
  const FifthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        bool isDocLoading(String key) => state is PickDocumentImageLoading && cubit.currentlyLoadingDoc == key;

        return CustomScrollView(
          slivers: [
            FirstViewBody(
              body: AnimatedColumn(
                children: [
                  50.verticalSpace,
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 32),
                    child: const CustomSteper(), 
                  ),
                  25.verticalSpace,
                  Text(
                    AppLocalizations.of(context)!.uploadOfficialDocs,
                    style: AppTextStyle.medium16(context).copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.uploadOfficialDocsDesc,
                    style: AppTextStyle.regular14(context).copyWith(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  24.verticalSpace,
                  
                  // Personal Photo
                  Text(
                    AppLocalizations.of(context)!.personalPhoto,
                    style: AppTextStyle.medium14(context),
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
                            onPick: (source) => cubit.pickPersonalPhoto(source),
                          ),
                        ),
                      );
                    },
                  ),
                  24.verticalSpace,

                  // National ID
                  Text(
                    AppLocalizations.of(context)!.nationalId,
                    style: AppTextStyle.medium14(context),
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
                          onTap: () => cubit.pickDocumentPhoto(docType: 'nationalId', isFront: false),
                        ),
                      ),
                      16.horizontalSpace,
                      Expanded(
                        child: DocumentUploadBox(
                          title: AppLocalizations.of(context)!.idFront,
                          iconPath: AppImages.personalCard,
                          imageFile: cubit.nationalIdFront,
                          isLoading: isDocLoading('nationalId_front'),
                          onTap: () => cubit.pickDocumentPhoto(docType: 'nationalId', isFront: true),
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,

                  // Driving License
                  Text(
                    AppLocalizations.of(context)!.drivingLicense,
                    style: AppTextStyle.medium14(context),
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
                          onTap: () => cubit.pickDocumentPhoto(docType: 'drivingLicense', isFront: false),
                        ),
                      ),
                      16.horizontalSpace,
                      Expanded(
                        child: DocumentUploadBox(
                          title: AppLocalizations.of(context)!.frontSide,
                          iconPath: AppImages.driveLicenceIcon,
                          imageFile: cubit.drivingLicenseFront,
                          isLoading: isDocLoading('drivingLicense_front'),
                          onTap: () => cubit.pickDocumentPhoto(docType: 'drivingLicense', isFront: true),
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,

                  // Vehicle License
                  Text(
                    AppLocalizations.of(context)!.vehicleLicense,
                    style: AppTextStyle.medium14(context),
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
                          onTap: () => cubit.pickDocumentPhoto(docType: 'vehicleLicense', isFront: false),
                        ),
                      ),
                      16.horizontalSpace,
                      Expanded(
                        child: DocumentUploadBox(
                          title: AppLocalizations.of(context)!.frontSide,
                          iconPath: AppImages.carLicenceIcon,
                          imageFile: cubit.vehicleLicenseFront,
                          isLoading: isDocLoading('vehicleLicense_front'),
                          onTap: () => cubit.pickDocumentPhoto(docType: 'vehicleLicense', isFront: true),
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
                          onPressed: () => cubit.changePage(3), // Back to FourthView
                        ),
                      ),
                      CustomButton(
                        horizontalPadding: 40,
                        text: AppLocalizations.of(context)!.next,
                        onPressed: () => cubit.fifthViewPress(context),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  const ViewInsetsSpace(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}