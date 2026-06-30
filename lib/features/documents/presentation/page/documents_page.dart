import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/animated_column.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/screen_wrapper.dart';
import 'package:metw_go/features/documents/presentation/manager/documents_cubit.dart';
import 'package:metw_go/features/documents/presentation/manager/documents_state.dart';
import 'package:metw_go/features/documents/presentation/widgets/documents_bottom_sheet.dart';
import 'package:metw_go/features/register/presentation/widgets/document_upload_box.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';
import 'package:metw_go/features/register/presentation/widgets/personal_photo_container.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentsCubit, DocumentsState>(
      builder: (context, state) {
        final cubit = context.read<DocumentsCubit>();
        bool isDocLoading(String key) =>
            state is PickDocumentImageLoading &&
            cubit.currentlyLoadingDoc == key;
        return ScreenWrapper(
          appBar: CustomAppBar(title: 'المستندات'),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomButton(text: 'حفظ', onPressed: () {}),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
              child: AnimatedColumn(
                children: [
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
                          child: DocumentsBottomSheet(
                            ctx: ctx,
                            onPick: (source) => cubit.pickPersonalPhoto(source),
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
                  20.verticalSpace,
                  const ViewInsetsSpace(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
