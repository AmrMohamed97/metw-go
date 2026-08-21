import 'package:metw_go/features/register_steps/data/models/city_model.dart';
import 'package:metw_go/features/register_steps/data/models/governorate_model.dart';

abstract class ThirdStepState {}

class ThirdStepInitial extends ThirdStepState {}

class ChangeRuralServiceState extends ThirdStepState {}

class UpdateSelectionsState extends ThirdStepState {}

class GetGovernoratesLoading extends ThirdStepState {}

class GetGovernoratesSuccess extends ThirdStepState {
  final List<GovernorateModel> governorates;
  GetGovernoratesSuccess(this.governorates);
}

class GetGovernoratesFailure extends ThirdStepState {
  final String message;
  GetGovernoratesFailure(this.message);
}

class GetCitiesLoading extends ThirdStepState {}

class GetCitiesSuccess extends ThirdStepState {
  final List<CityModel> cities;
  GetCitiesSuccess(this.cities);
}

class GetCitiesFailure extends ThirdStepState {
  final String message;
  GetCitiesFailure(this.message);
}

class SubmitThirdStepLoading extends ThirdStepState {}

class SubmitThirdStepSuccess extends ThirdStepState {}

class SubmitThirdStepFailure extends ThirdStepState {
  final String message;
  SubmitThirdStepFailure(this.message);
}
