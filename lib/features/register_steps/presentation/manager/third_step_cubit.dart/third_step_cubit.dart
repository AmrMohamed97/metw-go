import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/features/register_steps/presentation/manager/third_step_cubit.dart/third_step_state.dart';

class ThirdStepCubit extends Cubit<ThirdStepState> {
  ThirdStepCubit() : super(ThirdStepInitial());

  final GlobalKey<FormState> thirdStepFormKey = GlobalKey<FormState>();
  List<String> selectedGovernorates = ['القاهرة', 'الجيزة'];
  List<String> selectedCities = ['مدينة نصر', 'مصر الجديدة'];
  bool isRuralServiceEnabled = false;

  void toggleRuralService(bool value) {
    isRuralServiceEnabled = value;
    emit(ChangeRuralServiceState());
  }

  void removeGovernorate(String governorate) {
    selectedGovernorates.remove(governorate);
    emit(RemoveGovernorateState());
  }

  void removeCity(String city) {
    selectedCities.remove(city);
    emit(RemoveCityState());
  }
}
