import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/models/transport_type_model.dart';
import 'package:metw_go/features/register_steps/data/models/warehouse_model.dart';
import 'package:metw_go/features/register_steps/data/repo/first_step_repo.dart';
import 'package:metw_go/features/register_steps/presentation/manager/first_step_cubit/first_step_state.dart';

@injectable
class FirstStepCubit extends Cubit<FirstStepState> {
  final FirstStepRepo firstStepRepo;
  FirstStepCubit(this.firstStepRepo) : super(FirstStepInitial());

  /// second view data
  //----------------------------------------------------------------------------
  final firstStepFormKey = GlobalKey<FormState>();
  bool isIndependentDelegate = true;
  WarehouseModel? selectedWarehouse;
  List<WarehouseModel> warehouses = [];
  List<TransportTypeModel> transportTypes = [];
  List<TransportTypeModel> selectedTransportTypes = [];

  void changeDelegateType(bool isIndependent) {
    isIndependentDelegate = isIndependent;
    emit(ChangeDelegateTypeSuccess());
  }

  void toggleTransportType(TransportTypeModel type) {
    if (selectedTransportTypes.contains(type)) {
      selectedTransportTypes.remove(type);
    } else {
      selectedTransportTypes.add(type);
    }
    emit(ChangeWorkClassificationSuccess());
  }

  Future<void> getTransportTypes() async {
    emit(GetTransportTypesLoading());
    final result = await firstStepRepo.getTransportTypes();
    result.fold(
      (failure) => emit(GetTransportTypesFailure(failure.message)),
      (response) {
        transportTypes = response.data ?? [];
        emit(GetTransportTypesSuccess());
      },
    );
  }

  Future<void> getWarehouses() async {
    emit(GetWarehousesLoading());
    final result = await firstStepRepo.getWarehouses();
    result.fold((failure) => emit(GetWarehousesFailure(failure.message)), (
      response,
    ) {
      warehouses = response.data ?? [];
      emit(GetWarehousesSuccess());
    });
  }

  void selectWarehouse(WarehouseModel warehouse) {
    selectedWarehouse = warehouse;
    emit(ChangeDelegateTypeSuccess());
  }

  Future<void> submitFirstStep() async {
    bool hasSelectedWorkTypes = selectedTransportTypes.isNotEmpty;
    bool hasSelectedWarehouse = selectedWarehouse != null;
    
    if (firstStepFormKey.currentState!.validate() && 
        (isIndependentDelegate ? hasSelectedWorkTypes : hasSelectedWarehouse)) {
      emit(SubmitFirstStepLoading());

      final input = FirstStepInputModel(
        courierType: isIndependentDelegate ? 'freelance' : 'warehouse',
        warehouseId: isIndependentDelegate ? null : selectedWarehouse?.id,
        workTypes: isIndependentDelegate 
            ? selectedTransportTypes.map((t) => t.name!).toList() 
            : null,
      );

      final result = await firstStepRepo.submitFirstStep(input);
      result.fold(
        (failure) => emit(SubmitFirstStepFailure(failure.message)),
        (successModel) => emit(SubmitFirstStepSuccess()),
      );
    }
  }
}
