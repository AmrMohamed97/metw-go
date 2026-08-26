import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/driver_info/data/models/update_work_info_input_model.dart';
import 'package:metw_go/features/driver_info/data/repo/delegate_info_repo.dart';
import 'package:metw_go/features/driver_info/presentation/manager/delegate_info_state.dart';
import 'package:metw_go/features/register_steps/data/models/warehouse_model.dart';

@injectable
class DelegateInfoCubit extends Cubit<DelegateInfoState> {
  final DelegateInfoRepo delegateInfoRepo;

  DelegateInfoCubit({required this.delegateInfoRepo})
    : super(DelegateInfoInitialState());

  final secondViewFormKey = GlobalKey<FormState>();
  bool isIndependentDelegate = true;
  WarehouseModel? selectedWarehouse;
  List<WarehouseModel> warehouses = [];

  void changeDelegateType(bool isIndependent) {
    isIndependentDelegate = isIndependent;
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

  Future<void> getWarehouses() async {
    emit(GetWarehousesLoading());
    final result = await delegateInfoRepo.getWarehouses();
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

  Future<void> updateWorkInfo() async {
    List<String> selectedWorkTypes = [];
    if (isDeliveryDelegate)
      selectedWorkTypes.add('delivery_inside_governorate');
    if (isShippingDelegate) selectedWorkTypes.add('inter_governorate_shipping');
    if (isBusDriver) selectedWorkTypes.add('bus_driver');

    bool hasSelectedWorkTypes = selectedWorkTypes.isNotEmpty;
    bool hasSelectedWarehouse = selectedWarehouse != null;

    if (secondViewFormKey.currentState?.validate() == true &&
        (isIndependentDelegate
            ? hasSelectedWorkTypes
            : hasSelectedWorkTypes && hasSelectedWarehouse)) {
      emit(UpdateWorkInfoLoading());

      final input = UpdateWorkInfoInputModel(
        courierType: isIndependentDelegate ? 'freelance' : 'warehouse',
        warehouseId: isIndependentDelegate ? null : selectedWarehouse?.id,
        workTypes: selectedWorkTypes,
      );

      final result = await delegateInfoRepo.updateWorkInfo(input);
      result.fold(
        (failure) => emit(UpdateWorkInfoFailure(failure.message)),
        (profileOutModel) => emit(UpdateWorkInfoSuccess(profileOutModel)),
      );
    }
  }
}
