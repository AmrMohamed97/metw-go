import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/features/service_areas/presentation/manager/service_areas_state.dart';

@injectable
class ServiceAreasCubit extends Cubit<ServiceAreasState> {
  ServiceAreasCubit() : super(ServiceAreasInitialState());

    final GlobalKey<FormState> fourthViewFormKey = GlobalKey<FormState>();
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
