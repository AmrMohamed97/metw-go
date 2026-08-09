import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/features/register_steps/presentation/manager/first_step_cubit/first_step_state.dart';

class FirstStepCubit extends Cubit<FirstStepState>{
  FirstStepCubit():super(FirstStepInitial());
  /// second view data
  //----------------------------------------------------------------------------
  final firstStepFormKey = GlobalKey<FormState>();
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