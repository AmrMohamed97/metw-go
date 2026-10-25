import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/register_steps/data/models/first_step_input_model.dart';
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
  List<WarehouseModel> selectedWarehouses = [];
  WarehouseModel? get selectedWarehouse =>
      selectedWarehouses.isNotEmpty ? selectedWarehouses.first : null;
  List<WarehouseModel> warehouses = [];
  // List<String> transportTypes = [];
  // List<String> selectedTransportTypes = [];

  void changeDelegateType(bool isIndependent) {
    isIndependentDelegate = isIndependent;
    if (isIndependent) {
      selectedWarehouses.clear();
    }
    emit(ChangeDelegateTypeSuccess());
  }

  bool isDeliveryDelegate = false;
  bool isShippingDelegate = false;
  bool isBusDriver = false;

  void toggleDeliveryDelegate(bool value) {
    isDeliveryDelegate = value;
    emit(ChangeWorkClassificationSuccess());
  }

  void toggleShippingDelegate(bool value) {
    isShippingDelegate = value;
    emit(ChangeWorkClassificationSuccess());
  }

  void toggleBusDriver(bool value) {
    isBusDriver = value;
    emit(ChangeWorkClassificationSuccess());
  }

  // void toggleTransportType(TransportTypeModel type) {
  //   if (selectedTransportTypes.contains(type)) {
  //     selectedTransportTypes.remove(type);
  //   } else {
  //     selectedTransportTypes.add(type);
  //   }
  //   emit(ChangeWorkClassificationSuccess());
  // }

  // Future<void> getTransportTypes() async {
  //   emit(GetTransportTypesLoading());
  //   final result = await firstStepRepo.getTransportTypes();
  //   result.fold(
  //     (failure) => emit(GetTransportTypesFailure(failure.message)),
  //     (response) {
  //       transportTypes = response.data ?? [];
  //       emit(GetTransportTypesSuccess());
  //     },
  //   );
  // }

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

  void toggleWarehouse(WarehouseModel warehouse) {
    final index = selectedWarehouses.indexWhere((w) => w.id == warehouse.id);
    if (index != -1) {
      selectedWarehouses.removeAt(index);
    } else {
      selectedWarehouses.add(warehouse);
    }
    emit(ChangeDelegateTypeSuccess());
  }

  void selectWarehouse(WarehouseModel warehouse) {
    toggleWarehouse(warehouse);
  }

  void clearSelectedWarehouses() {
    selectedWarehouses.clear();
    emit(ChangeDelegateTypeSuccess());
  }

  Future<void> submitFirstStep() async {
    List<String> selectedWorkTypes = [];
    if (isDeliveryDelegate) selectedWorkTypes.add('local_delivery');
    if (isShippingDelegate) selectedWorkTypes.add('inter_governorate_shipping');
    if (isBusDriver) selectedWorkTypes.add('bus_driver');

    bool hasSelectedWorkTypes = selectedWorkTypes.isNotEmpty;
    bool hasSelectedWarehouse = selectedWarehouses.isNotEmpty;

    if (firstStepFormKey.currentState!.validate() &&
        (isIndependentDelegate
            ? hasSelectedWorkTypes
            : hasSelectedWorkTypes && hasSelectedWarehouse)) {
      emit(SubmitFirstStepLoading());

      final input = FirstStepInputModel(
        courierType: isIndependentDelegate ? 'freelance' : 'warehouse',
        warehouseIds: isIndependentDelegate
            ? null
            : selectedWarehouses
                .map((w) => w.id)
                .whereType<int>()
                .toList(),
        workTypes: selectedWorkTypes,
      );

      final result = await firstStepRepo.submitFirstStep(input);
      result.fold(
        (failure) => emit(SubmitFirstStepFailure(failure.message)),
        (successModel) => emit(SubmitFirstStepSuccess()),
      );
    }
  }
}
