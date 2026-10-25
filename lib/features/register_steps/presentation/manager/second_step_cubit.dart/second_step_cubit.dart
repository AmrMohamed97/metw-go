import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/register_steps/data/models/second_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/models/transport_type_model.dart';
import 'package:metw_go/features/register_steps/data/repo/second_step_repo.dart';
import 'package:metw_go/features/register_steps/presentation/manager/second_step_cubit.dart/second_step_state.dart';

@injectable
class SecondStepCubit extends Cubit<SecondStepState> {
  final SecondStepRepo repo;

  SecondStepCubit(this.repo) : super(SecondStepInitial());

  final secondStepFormKey = GlobalKey<FormState>();

  List<TransportTypeModel> transportTypes = [];
  TransportTypeModel? selectedTransportType;

  final TextEditingController maxWeightController = TextEditingController(
    text: '0.0',
  );
  final TextEditingController maxVolumeController = TextEditingController(
    text: '0.0',
  );

  /// ماركة المركبة (Toyota)
  final TextEditingController vehicleBrandController = TextEditingController();

  /// موديل / طراز المركبة (Corolla)
  final TextEditingController vehicleModelController = TextEditingController();

  /// خانة الحروف (مثل: س م)
  final TextEditingController plateLettersController = TextEditingController();

  /// رقم اللوحة الكامل (مثل: ABC-1234)
  final TextEditingController plateNumberController = TextEditingController();

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

  Future<void> submitSecondStep() async {
    if (selectedTransportType == null) {
      emit(SubmitSecondStepFailure('الرجاء اختيار وسيلة النقل'));
      return;
    }

    if (!secondStepFormKey.currentState!.validate()) {
      return;
    }

    emit(SubmitSecondStepLoading());

    final letters = plateLettersController.text.trim();
    final plate = plateNumberController.text.trim();

    final input = SecondStepInputModel(
      transportTypeId: selectedTransportType!.id!,
      plateNumber: plate,
      vehicleBrand: vehicleBrandController.text.trim(),
      vehicleModel: vehicleModelController.text.trim(),
      registrationPlateLetters: letters.isNotEmpty ? letters : null,
    );

    final result = await repo.submitSecondStep(input);

    result.fold(
      (failure) => emit(SubmitSecondStepFailure(failure.message)),
      (response) => emit(SubmitSecondStepSuccess()),
    );
  }

  @override
  Future<void> close() {
    maxWeightController.dispose();
    maxVolumeController.dispose();
    vehicleBrandController.dispose();
    vehicleModelController.dispose();
    plateLettersController.dispose();
    plateNumberController.dispose();
    return super.close();
  }
}
