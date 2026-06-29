import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/widgets/image_mixin.dart';
import 'package:metw_go/features/vehicle_data/presentation/manager/vehicle_state.dart';

@injectable
class VehicleCubit extends Cubit<VehicleState> with ImageMixin{
  VehicleCubit() : super(VehicleInitialState());

    final thirdViewFormKey = GlobalKey<FormState>();
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
