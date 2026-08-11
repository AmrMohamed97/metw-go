import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/register_steps/data/models/city_model.dart';
import 'package:metw_go/features/register_steps/data/models/governorate_model.dart';
import 'package:metw_go/features/register_steps/data/models/third_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/repo/third_step_repo.dart';
import 'package:metw_go/features/register_steps/presentation/manager/third_step_cubit.dart/third_step_state.dart';

@injectable
class ThirdStepCubit extends Cubit<ThirdStepState> {
  final ThirdStepRepo repo;

  ThirdStepCubit(this.repo) : super(ThirdStepInitial());

  final GlobalKey<FormState> thirdStepFormKey = GlobalKey<FormState>();
  
  List<GovernorateModel> governorates = [];
  List<GovernorateModel> selectedGovernorates = [];
  
  List<CityModel> cities = [];
  List<CityModel> selectedCities = [];
  
  bool isRuralServiceEnabled = false;

  void init() {
    getGovernorates();
  }

  void toggleRuralService(bool value) {
    isRuralServiceEnabled = value;
    emit(ChangeRuralServiceState());
  }

  Future<void> getGovernorates() async {
    emit(GetGovernoratesLoading());
    final result = await repo.getGovernorates();
    result.fold(
      (failure) => emit(GetGovernoratesFailure(failure.message)),
      (response) {
        governorates = response.data ?? [];
        emit(GetGovernoratesSuccess(governorates));
      },
    );
  }

  Future<void> getCities() async {
    if (selectedGovernorates.isEmpty) {
      cities.clear();
      selectedCities.clear();
      emit(UpdateSelectionsState());
      return;
    }
    
    emit(GetCitiesLoading());
    final selectedGovIds = selectedGovernorates.map((g) => g.id!).toList();
    final result = await repo.getCities(selectedGovIds);
    
    result.fold(
      (failure) => emit(GetCitiesFailure(failure.message)),
      (response) {
        cities = response.data ?? [];
        // Remove selected cities that are no longer in the fetched cities
        selectedCities.removeWhere((selectedCity) => !cities.any((c) => c.id == selectedCity.id));
        emit(GetCitiesSuccess(cities));
      },
    );
  }

  void toggleGovernorate(GovernorateModel governorate) {
    if (selectedGovernorates.contains(governorate)) {
      selectedGovernorates.remove(governorate);
    } else {
      selectedGovernorates.add(governorate);
    }
    emit(UpdateSelectionsState());
    getCities();
  }

  void removeGovernorate(GovernorateModel governorate) {
    selectedGovernorates.remove(governorate);
    emit(UpdateSelectionsState());
    getCities();
  }

  void toggleCity(CityModel city) {
    if (selectedCities.contains(city)) {
      selectedCities.remove(city);
    } else {
      selectedCities.add(city);
    }
    emit(UpdateSelectionsState());
  }

  void removeCity(CityModel city) {
    selectedCities.remove(city);
    emit(UpdateSelectionsState());
  }

  Future<void> submitThirdStep() async {
    if (selectedGovernorates.isEmpty || selectedCities.isEmpty) {
      emit(SubmitThirdStepFailure('الرجاء اختيار المحافظات والمدن'));
      return;
    }
    
    emit(SubmitThirdStepLoading());
    final input = ThirdStepInputModel(
      governorateIds: selectedGovernorates.map((e) => e.id!).toList(),
      cityIds: selectedCities.map((e) => e.id!).toList(),
      villagesServiceEnabled: isRuralServiceEnabled,
    );
    
    final result = await repo.submitThirdStep(input);
    result.fold(
      (failure) => emit(SubmitThirdStepFailure(failure.message)),
      (response) => emit(SubmitThirdStepSuccess()),
    );
  }
}
