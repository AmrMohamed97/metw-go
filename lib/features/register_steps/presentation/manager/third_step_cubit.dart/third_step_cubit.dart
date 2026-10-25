import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/register_steps/data/models/city_model.dart';
import 'package:metw_go/features/register_steps/data/models/governorate_model.dart';
import 'package:metw_go/features/register_steps/data/models/register_profile_response.dart';
import 'package:metw_go/features/register_steps/data/models/third_step_input_model.dart';
import 'package:metw_go/features/register_steps/data/repo/third_step_repo.dart';
import 'package:metw_go/features/register_steps/presentation/manager/third_step_cubit.dart/third_step_state.dart';

@injectable
class ThirdStepCubit extends Cubit<ThirdStepState> {
  final ThirdStepRepo repo;

  ThirdStepCubit(this.repo) : super(ThirdStepInitial());

  final GlobalKey<FormState> thirdStepFormKey = GlobalKey<FormState>();

  RegisterProfile? profile;
  List<String> workTypes = [];

  List<GovernorateModel> governorates = [];
  List<GovernorateModel> selectedGovernorates = [];

  List<CityModel> cities = [];
  List<CityModel> selectedCities = [];

  bool isRuralServiceEnabled = false;

  bool get isDeliveryDelegate =>
      workTypes.contains('delivery_inside_governorate') ||
      workTypes.contains('local_delivery');

  bool get isShippingDelegate =>
      workTypes.contains('shipping_between_governorates') ||
      workTypes.contains('inter_governorate_shipping');

  bool get isBusDriver =>
      workTypes.contains('bus_driver_between_governorates') ||
      workTypes.contains('bus_driver');

  /// الاختيار من قائمة اسماء المحافظات سيكون اختيارات متعددة لمندوب الشحن وسائق الباص و اختيار واحد فقط لمندوب التوصيل
  bool get isMultipleGovernorates => isShippingDelegate || isBusDriver;

  /// الاختيار من قائمة اسماء المدن سيكون نشط لمندوب التوصيل فقط وسيكون غير نشط لكل من مندوب الشحن وسائق الباص
  bool get isCitiesActive => isDeliveryDelegate;

  Future<void> init() async {
    await Future.wait([
      getGovernorates(),
      getRegisterProfile(),
    ]);
  }

  void toggleRuralService(bool value) {
    isRuralServiceEnabled = value;
    emit(ChangeRuralServiceState());
  }

  Future<void> getRegisterProfile() async {
    emit(GetRegisterProfileLoading());
    final result = await repo.getRegisterProfile();
    result.fold(
      (failure) => emit(GetRegisterProfileFailure(failure.message)),
      (response) {
        if (response.data?.profile != null) {
          profile = response.data!.profile;
          workTypes = List.from(profile!.workTypes);
          if (profile!.villagesServiceEnabled != null) {
            isRuralServiceEnabled = profile!.villagesServiceEnabled!;
          }
          _populateInitialSelections();
        }
        emit(GetRegisterProfileSuccess(profile ?? RegisterProfile()));
      },
    );
  }

  Future<void> getGovernorates() async {
    emit(GetGovernoratesLoading());
    final result = await repo.getGovernorates();
    result.fold((failure) => emit(GetGovernoratesFailure(failure.message)), (
      response,
    ) {
      governorates = response.data ?? [];
      _populateInitialSelections();
      emit(GetGovernoratesSuccess(governorates));
    });
  }

  void _populateInitialSelections() {
    if (profile == null || governorates.isEmpty) return;

    if (selectedGovernorates.isEmpty && profile!.governorateIds.isNotEmpty) {
      final matchingGovs = governorates
          .where((g) => profile!.governorateIds.contains(g.id))
          .toList();

      if (isMultipleGovernorates) {
        selectedGovernorates = matchingGovs;
      } else if (matchingGovs.isNotEmpty) {
        selectedGovernorates = [matchingGovs.first];
      }

      if (isCitiesActive && selectedGovernorates.isNotEmpty) {
        getCities().then((_) {
          if (selectedCities.isEmpty && profile!.cityIds.isNotEmpty) {
            selectedCities = cities
                .where((c) => profile!.cityIds.contains(c.id))
                .toList();
            emit(UpdateSelectionsState());
          }
        });
      } else {
        emit(UpdateSelectionsState());
      }
    }
  }

  Future<void> getCities() async {
    if (!isCitiesActive || selectedGovernorates.isEmpty) {
      cities.clear();
      selectedCities.clear();
      emit(UpdateSelectionsState());
      return;
    }

    emit(GetCitiesLoading());
    final selectedGovIds = selectedGovernorates.map((g) => g.id!).toList();
    final result = await repo.getCities(selectedGovIds);

    result.fold((failure) => emit(GetCitiesFailure(failure.message)), (
      response,
    ) {
      cities = response.data ?? [];
      // Remove selected cities that are no longer in the fetched cities
      selectedCities.removeWhere(
        (selectedCity) => !cities.any((c) => c.id == selectedCity.id),
      );
      emit(GetCitiesSuccess(cities));
    });
  }

  void toggleGovernorate(GovernorateModel governorate) {
    if (isMultipleGovernorates) {
      if (selectedGovernorates.contains(governorate)) {
        selectedGovernorates.remove(governorate);
      } else {
        selectedGovernorates.add(governorate);
      }
    } else {
      // Single choice for delivery delegate (اختيار واحد فقط)
      if (selectedGovernorates.contains(governorate)) {
        selectedGovernorates.clear();
      } else {
        selectedGovernorates = [governorate];
      }
      selectedCities.clear();
    }
    emit(UpdateSelectionsState());
    if (isCitiesActive) {
      getCities();
    } else {
      cities.clear();
      selectedCities.clear();
    }
  }

  void removeGovernorate(GovernorateModel governorate) {
    selectedGovernorates.remove(governorate);
    if (!isMultipleGovernorates) {
      selectedCities.clear();
    }
    emit(UpdateSelectionsState());
    if (isCitiesActive) {
      getCities();
    } else {
      cities.clear();
      selectedCities.clear();
    }
  }

  void toggleCity(CityModel city) {
    if (!isCitiesActive) return;
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
    if (selectedGovernorates.isEmpty) {
      emit(SubmitThirdStepFailure('الرجاء اختيار المحافظة'));
      return;
    }

    if (isCitiesActive && selectedCities.isEmpty) {
      emit(SubmitThirdStepFailure('الرجاء اختيار المدن'));
      return;
    }

    emit(SubmitThirdStepLoading());
    final input = ThirdStepInputModel(
      governorateIds: selectedGovernorates.map((e) => e.id!).toList(),
      cityIds: isCitiesActive ? selectedCities.map((e) => e.id!).toList() : [],
      villagesServiceEnabled: isRuralServiceEnabled,
    );

    final result = await repo.submitThirdStep(input);
    result.fold(
      (failure) => emit(SubmitThirdStepFailure(failure.message)),
      (response) => emit(SubmitThirdStepSuccess()),
    );
  }
}
