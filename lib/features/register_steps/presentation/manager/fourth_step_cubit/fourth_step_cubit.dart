import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metw_go/core/widgets/image_mixin.dart';
import 'package:metw_go/features/register_steps/presentation/manager/fourth_step_cubit/fourth_step_state.dart';

class FourthStepCubit extends Cubit<FourthStepState> with ImageMixin{
  FourthStepCubit() : super(FourthStepInitial());

    File? personalPhoto;
  File? nationalIdFront;
  File? nationalIdBack;
  File? drivingLicenseFront;
  File? drivingLicenseBack;
  File? vehicleLicenseFront;
  File? vehicleLicenseBack;

  String? currentlyLoadingDoc;

  Future<void> pickPersonalPhoto(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      currentlyLoadingDoc = 'personalPhoto';
      emit(PickDocumentImageLoading());
      personalPhoto = await compress(targetImage: File(image.path));
      currentlyLoadingDoc = null;
      emit(PickDocumentImageSuccess());
    }
  }

  Future<void> pickDocumentPhoto({
    required String docType,
    required bool isFront,
  }) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
    ); // Forced to camera
    if (image != null) {
      currentlyLoadingDoc = '${docType}_${isFront ? 'front' : 'back'}';
      emit(PickDocumentImageLoading());
      final compressed = await compress(targetImage: File(image.path));

      switch (docType) {
        case 'nationalId':
          isFront ? nationalIdFront = compressed : nationalIdBack = compressed;
          break;
        case 'drivingLicense':
          isFront
              ? drivingLicenseFront = compressed
              : drivingLicenseBack = compressed;
          break;
        case 'vehicleLicense':
          isFront
              ? vehicleLicenseFront = compressed
              : vehicleLicenseBack = compressed;
          break;
      }
      currentlyLoadingDoc = null;
      emit(PickDocumentImageSuccess());
    }
  }
} 