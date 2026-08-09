import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metw_go/core/widgets/image_mixin.dart';
import 'package:metw_go/features/register_steps/presentation/manager/second_step_cubit.dart/second_step_state.dart';

class SecondStepCubit extends Cubit<SecondStepState> with ImageMixin {
  SecondStepCubit() : super(SecondStepInitial());

  /// thired view data
  //----------------------------------------------------------------------------
  final secondStepFormKey = GlobalKey<FormState>();
  String? selectedTransportMethod;
  TextEditingController maxWeightController = TextEditingController();
  TextEditingController maxVolumeController = TextEditingController();
  TextEditingController plateNumberController = TextEditingController();
  File? vehicleImage;

  Future<void> pickVehicleImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      emit(PickVehicleImageLoading());
      vehicleImage = await compress(targetImage: File(image.path));
      // vehicleImagePath = image.path;
      emit(PickVehicleImageSuccess());
    }
  }
}
