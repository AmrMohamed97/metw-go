import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/core/utils/app_images.dart';
import 'package:metw_go/core/utils/view_insets_space.dart';
import 'package:metw_go/core/widgets/custom_app_bar.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/core/widgets/custom_toast.dart';
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
    return BlocConsumer<DocumentsCubit, DocumentsState>(
      listener: (context, state) {
        if (state is UpdateDocumentsSuccess) {
          showToast(
            context,
            message:
                state.profileOutModel.message ??
                AppLocalizations.of(context)!.savedSuccessfully,
            state: ToastStates.success,
          );
          context.pop(true);
        } else if (state is UpdateDocumentsFailure) {
          showToast(context, message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<DocumentsCubit>();
        bool isDocLoading(String key) =>
            state is PickDocumentImageLoading &&
            cubit.currentlyLoadingDoc == key;
        return ScreenWrapper(
          appBar: CustomAppBar(title: 'المستندات'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  24.verticalSpace,
                  // Personal Photo
                  FieldTitle(
                    title: AppLocalizations.of(context)!.personalPhoto,
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
                  50.verticalSpace,
                  Center(
                    child: CustomButton(
                      isMax: state is! UpdateDocumentsLoading,
                      loading: state is UpdateDocumentsLoading,
                      text: 'حفظ',
                      onPressed: () {
                        cubit.updateDocuments();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
