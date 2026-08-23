import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';
import 'package:metw_go/features/register_steps/data/models/city_model.dart';
import 'package:metw_go/features/register_steps/data/models/governorate_model.dart';

abstract class ServiceAreasState {}

class ServiceAreasInitialState extends ServiceAreasState {}

class ChangeRuralServiceState extends ServiceAreasState {}

class UpdateSelectionsState extends ServiceAreasState {}

class GetGovernoratesLoading extends ServiceAreasState {}

class GetGovernoratesSuccess extends ServiceAreasState {
  final List<GovernorateModel> governorates;
  GetGovernoratesSuccess(this.governorates);
}

class GetGovernoratesFailure extends ServiceAreasState {
  final String message;
  GetGovernoratesFailure(this.message);
}

class GetCitiesLoading extends ServiceAreasState {}

class GetCitiesSuccess extends ServiceAreasState {
  final List<CityModel> cities;
  GetCitiesSuccess(this.cities);
}

class GetCitiesFailure extends ServiceAreasState {
  final String message;
  GetCitiesFailure(this.message);
}

class UpdateServiceAreasLoading extends ServiceAreasState {}

class UpdateServiceAreasSuccess extends ServiceAreasState {
  final ProfileOutModel profileOutModel;
  UpdateServiceAreasSuccess(this.profileOutModel);
}

class UpdateServiceAreasFailure extends ServiceAreasState {
  final String message;
  UpdateServiceAreasFailure(this.message);
}
