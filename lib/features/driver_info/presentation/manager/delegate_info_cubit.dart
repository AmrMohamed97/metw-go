import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/driver_info/presentation/manager/delegate_info_state.dart';

@injectable
class DelegateInfoCubit extends Cubit<DelegateInfoState> {
  DelegateInfoCubit() : super(DelegateInfoInitialState());

  final secondViewFormKey = GlobalKey<FormState>();
  bool isIndependentDelegate = true;
  String? selectedWarehouse;

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
}
