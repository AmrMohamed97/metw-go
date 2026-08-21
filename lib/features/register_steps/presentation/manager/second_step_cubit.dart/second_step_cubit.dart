import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/widgets/image_mixin.dart';
import 'package:metw_go/features/register_steps/data/models/transport_type_model.dart';
import 'package:metw_go/features/register_steps/data/repo/second_step_repo.dart';
import 'package:metw_go/features/register_steps/presentation/manager/second_step_cubit.dart/second_step_state.dart';

@injectable
class SecondStepCubit extends Cubit<SecondStepState> with ImageMixin {
  final SecondStepRepo repo;

  SecondStepCubit(this.repo) : super(SecondStepInitial());

  final secondStepFormKey = GlobalKey<FormState>();

  List<TransportTypeModel> transportTypes = [];
  TransportTypeModel? selectedTransportType;

  TextEditingController maxWeightController = TextEditingController(
    text: '0.0',
  );
  TextEditingController maxVolumeController = TextEditingController(
    text: '0.0',
  );
  TextEditingController plateNumberController = TextEditingController();

  File? vehicleImage;

  void init() {
    getTransportTypes();
  }

  Future<void> getTransportTypes() async {
    emit(GetTransportTypesLoading());
    final result = await repo.getTransportTypes();
    result.fold((failure) => emit(GetTransportTypesFailure(failure.message)), (
      response,
    ) {
      transportTypes = response.data ?? [];
      emit(GetTransportTypesSuccess());
    });
  }

  void changeTransportType(TransportTypeModel type) {
    selectedTransportType = type;
    maxWeightController.text = (type.maxWeightKg ?? 0).toString();
    maxVolumeController.text = (type.maxVolumeM3 ?? 0).toString();
    emit(ChangeTransportTypeSuccess());
  }

  Future<void> pickVehicleImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      emit(PickVehicleImageLoading());
      vehicleImage = await compress(targetImage: File(image.path));
      emit(PickVehicleImageSuccess());
    }
  }

  Future<void> submitSecondStep() async {
    if (secondStepFormKey.currentState!.validate() &&
        selectedTransportType != null &&
        vehicleImage != null) {
      emit(SubmitSecondStepLoading());

      final result = await repo.submitSecondStep(
        selectedTransportType!.id!,
        plateNumberController.text,
        vehicleImage!,
      );

      result.fold(
        (failure) => emit(SubmitSecondStepFailure(failure.message)),
        (response) => emit(SubmitSecondStepSuccess()),
      );
    }
  }
}
