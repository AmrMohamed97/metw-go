import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/widgets/image_mixin.dart';
import 'package:metw_go/features/register_steps/data/models/transport_type_model.dart';
import 'package:metw_go/features/vehicle_data/data/repo/vehicle_repo.dart';
import 'package:metw_go/features/vehicle_data/presentation/manager/vehicle_state.dart';

@injectable
class VehicleCubit extends Cubit<VehicleState> with ImageMixin {
  final VehicleRepo vehicleRepo;

  VehicleCubit({required this.vehicleRepo}) : super(VehicleInitialState());

  final thirdViewFormKey = GlobalKey<FormState>();

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
    final result = await vehicleRepo.getTransportTypes();
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

  Future<void> updateTransport() async {
    if (selectedTransportType?.id == null) {
      emit(UpdateTransportFailure('يرجى اختيار وسيلة النقل'));
      return;
    }
    print('======================================');
    print(selectedTransportType!.id!);
    print(plateNumberController.text);

    if (thirdViewFormKey.currentState?.validate() == true) {
      emit(UpdateTransportLoading());

      final result = await vehicleRepo.updateTransport(
        selectedTransportType!.id!,
        plateNumberController.text,
        vehicleImage,
      );

      result.fold(
        (failure) => emit(UpdateTransportFailure(failure.message)),
        (profileOutModel) => emit(UpdateTransportSuccess(profileOutModel)),
      );
    }
  }

  @override
  Future<void> close() {
    maxWeightController.dispose();
    maxVolumeController.dispose();
    plateNumberController.dispose();
    return super.close();
  }
}
